# Importing and instantiating an existing image in OpenShift

Given an application image loaded in a docker daemon, built from a dockerfile such as the following:
![dockerfile](img/dockerfile.png)

![docker build](img/docker_build.png)

The image can be imported in the OpenShift local registry to be instantiated in OpenShift as follows:

## Assuming the docker daemon it resides on cannot or should not connect to the OpenShift registry directly

Export the image as a tar/tar.gz file:
![docker save](img/docker_save.png)

Import the file in a Docker daemon with access to the OpenShift registry. Possibly one of the OpenShfit nodes themselves

## In any case

Login to the registry using the OAuth user and token
![docker login](img/docker_login.png)

Load, tag, and push the image
![docker load](img/docker_load.png)

Check the imagestream was correctly generated
![imagestream](img/openshift_is.png)

Crete a container using the loaded image
![project home](img/project_home.png)
![import image](img/import_image.png)

![application overview](img/application_overview.png)
![application logs](img/application_logs.png)
