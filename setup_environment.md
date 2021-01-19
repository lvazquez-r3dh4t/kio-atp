 
## Creación de Proyecto Development

oc new-project dev --display-name="Development"

![a_1](https://user-images.githubusercontent.com/40834361/42909324-68b073dc-8aa9-11e8-91e9-592b228a4e2d.png)


## Creación de Proyecto QA

oc new-project qa --display-name="Quality"

![b_1](https://user-images.githubusercontent.com/40834361/42909325-68cb612e-8aa9-11e8-8c80-8122d285faaa.png)


## Creación de Proyecto CICD

oc new-project cicd --display-name="CI/CD"

![c_1](https://user-images.githubusercontent.com/40834361/42909326-68e14f34-8aa9-11e8-80dd-ca0f6660660f.png)


## Permisos de jenkins Service Account

oc policy add-role-to-user edit system:serviceaccount:cicd:jenkins -n dev

![d_1](https://user-images.githubusercontent.com/40834361/42909327-68f489c8-8aa9-11e8-9473-6e4aca056efe.png)

oc policy add-role-to-user edit system:serviceaccount:cicd:jenkins -n qa

![d_d](https://user-images.githubusercontent.com/40834361/42909328-690508de-8aa9-11e8-9941-62e256b48f67.png)


## Despliegue de GOGS dentro de CICD

oc new-app -f https://raw.githubusercontent.com/OpenShiftDemos/sonarqube-openshift-docker/master/sonarqube-postgresql-template.yaml --param=SONARQUBE_VERSION=6.7

![e_1](https://user-images.githubusercontent.com/40834361/42909330-69180d1c-8aa9-11e8-9ffc-efeee220b7ea.png)


## Depliegue de Jenkins, SonarQube, Nexus

oc new-app -n cicd -f https://raw.githubusercontent.com/OpenShiftDemos/openshift-cd-demo/ocp-3.9/cicd-template.yaml --param DEV_PROJECT=dev --param STAGE_PROJECT=qa

![f_1](https://user-images.githubusercontent.com/40834361/42909331-692aaed6-8aa9-11e8-95be-4dcb14091906.png)

![f_2](https://user-images.githubusercontent.com/40834361/42909332-6943f7ba-8aa9-11e8-8094-73708f95784e.png)
