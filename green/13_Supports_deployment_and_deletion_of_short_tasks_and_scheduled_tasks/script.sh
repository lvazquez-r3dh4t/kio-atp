#!/bin/bash

# Cronjobs

date
oc -njobs run timer --image=rhel7 --replicas=1 -- --restart=OnFailure --labels="app=cronjob" --command -- bash -c date
oc -njobs get cronjobs
oc -njobs get pods

sleep 130
oc -njobs get cronjobs
oc -njobs get pods

sleep 250
oc -njobs get cronjobs
oc -njobs get pods
for pod in $(oc -njobs get pods -oname | sed 's/pods\///g'); do
  oc -njobs logs $pod
done

oc -njobs delete cronjob/timer



#Jobs

oc -njobs create -f - << EOF
apiVersion: batch/v1
kind: Job
metadata:
  name: dater
spec:
  parallelism: 2    
  completions: 5    
  template:         
    metadata:
      name: dater
    spec:
      containers:
      - name: dater
        image: perl
        command: ["bash",  "-c", "date"]
      restartPolicy: OnFailure
EOF

oc -njobs get jobs

sleep 30

oc -njobs get jobs
oc -njobs get pods
for pod in $(oc -njobs get pods -oname | sed 's/pods\///g'); do
  oc -njobs logs $pod
done
