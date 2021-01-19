#/bin/bash
echo "Creating gluster volumes and persistent volumes"
for volume in volume{1..10}; do 
oc create -f - << EOF
apiVersion: v1
kind: PersistentVolume
metadata:
  name: gluster-$volume
spec:
  capacity:
    storage: 1Gi     
  accessModes:
  - ReadWriteMany    
  glusterfs:         
    endpoints: gluster-endpoints        
    path: $volume
    readOnly: false
  persistentVolumeReclaimPolicy: Recycle
EOF
oc -nglusterfs rsh $(oc -nglusterfs get pods -l"glusterfs=heketi-storage-pod" -oname | sed 's/pods\///g') bash -c "heketi-cli volume create --user=admin --secret=\$HEKETI_ADMIN_KEY --name=$volume --size=1 --gid=1000000100"
done

echo "Printing existing persistent volumes"
oc get pv

echo "Creating project. Setting supplemental group range to 1000000000 - 1000001000"
oc new-project storage-test
oc patch ns/storage-test -p '{"metadata":{"annotations":{"openshift.io/sa.scc.supplemental-groups":"1000000000/1000"}}}'

echo "Importing gluster endpoints and service from the glusterfs namespace"
oc -nglusterfs export endpoints/heketi-db-storage-endpoints | sed 's/heketi-db-storage-endpoints/gluster-endpoints/g' | oc -nstorage-test create -f -
oc -nglusterfs export services/heketi-db-storage-endpoints | sed 's/heketi-db-storage-endpoints/gluster-endpoints/g' | oc -nstorage-test create -f -

echo "Creating and binding the mysql pvc"
oc -nstorage-test create -f - << EOF
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  annotations:
  creationTimestamp: null
  name: mysql-data
spec:
  accessModes:
  - ReadWriteMany
  resources:
    requests:
      storage: 1Gi
  storageClassName: ""
EOF

echo "Printing pvc"
oc -nstorage-test get pvc

echo "Creating application using the mysql-ephemeral template so an empty directory is mounted in the mysql data mountpoint and waiting 60 seconds for the pod to start"
oc -nstorage-test new-app --name=mysql mysql-ephemeral -p"MYSQL_USER=user" -p"MYSQL_PASSWORD=password" -p"MYSQL_DATABASE=db"    
sleep 60

echo "Setting the pod's supplemental group to 1000000100 so it can write to the gluster volume to be mounted and waiting 60 seconds for the new deployment to start"
oc -nstorage-test patch dc/mysql -p '{"spec":{"template":{"spec":{"securityContext":{"supplementalGroups":[1000000100]}}}}}'
sleep 60

echo "Printing mountpoints for the newly created application "
oc -nstorage-test rsh $(oc -nstorage-test get pods -oname | sed 's/pods\///g') mount


echo "Replacing the empty dir volume with the pvc. Waiting 60 seconds for the pod to re-deploy"
oc -nstorage-test volumes dc/mysql --add -tpvc --name="mysql-data" --claim-name="mysql-data" --overwrite
sleep 60

echo "Printing mountpoints again"
oc -nstorage-test rsh $(oc -nstorage-test get pods -oname | sed 's/pods\///g') mount
