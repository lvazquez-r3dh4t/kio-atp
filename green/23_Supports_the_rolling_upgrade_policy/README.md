* Supports the rolling upgrade policy

=================================

* Create the project:

![paso1](https://user-images.githubusercontent.com/40834435/42894080-98236ee0-8a7b-11e8-9e91-9b59b5bc5d00.jpg)

##

* We configure the parameters of the project:

![paso2](https://user-images.githubusercontent.com/40834435/42894084-9b5c6b5c-8a7b-11e8-86bf-c6d029e26c6d.jpg)

##

* We create the application that we will use:

![paso3](https://user-images.githubusercontent.com/40834435/42894087-9d4e4a48-8a7b-11e8-846a-c77257780dfb.jpg)
![paso4](https://user-images.githubusercontent.com/40834435/42894089-9f11cbde-8a7b-11e8-99ac-bfe060caad1f.jpg)

##

* We configure the parameters of the application:

![paso5](https://user-images.githubusercontent.com/40834435/42894093-a11ea640-8a7b-11e8-874b-224a989c9421.jpg)
![paso6](https://user-images.githubusercontent.com/40834435/42894097-a3c51686-8a7b-11e8-9a4b-ac647568aeb4.jpg)
![paso7](https://user-images.githubusercontent.com/40834435/42894103-a6916072-8a7b-11e8-9290-aa7b097a05da.jpg)

##

* We validate that the application was created correctly:

![paso8](https://user-images.githubusercontent.com/40834435/42894105-a8c2e6ea-8a7b-11e8-98b5-6d8b9f2308f6.jpg)

##

* We increase the number of pods by clicking on the scale up that is next to the total of pods that we have:

![paso9](https://user-images.githubusercontent.com/40834435/42894109-ab9e8b26-8a7b-11e8-955e-33ecd473c25d.jpg)

##

* Click on créate binding:

![paso10](https://user-images.githubusercontent.com/40834435/42894116-ae3eab04-8a7b-11e8-8ea2-e31b230866cd.jpg)
![paso11](https://user-images.githubusercontent.com/40834435/42894119-b08f6dee-8a7b-11e8-95c3-c71fdf3fac97.jpg)

##

* The Rolling deployment begins:


![paso12](https://user-images.githubusercontent.com/40834435/42894122-b24930d4-8a7b-11e8-8840-fca1b4cec10b.jpg)
![paso13](https://user-images.githubusercontent.com/40834435/42894128-b69cc72c-8a7b-11e8-81f9-baab65f188ab.jpg)

##

* At the end of the Rolling:

![paso14](https://user-images.githubusercontent.com/40834435/42894133-b9e5df72-8a7b-11e8-87ef-44cda778e433.jpg)

##

# CLI way

Rolling deployments are the default in OpenShift Container Platform.
    
* Create the project
oc new-project rollingupdate --display-name="Rolling Update Deployment"

* Create an application based on the example deployment images found in DockerHub:
oc new-app openshift/deployment-example

* Expose the service
oc expose svc/deployment-example

* Browse to the application at deployment-example.<project>.<router_domain> to verify you see the v1 image.

* Scale the deployment configuration up to three replicas:
oc scale dc/deployment-example --replicas=3

* Trigger a new deployment automatically by tagging a new version of the example as the latest tag
oc tag --source=docker openshift/deployment-example:v2 deployment-example:latest

* Now we can use rollout commands for view and modify the rolling life cycle deploymenet

Available Commands:
cancel      cancel the in-progress deployment
history     View rollout history
latest      Start a new rollout for a deployment config with the latest state from its triggers
pause       Mark the provided resource as paused
resume      Resume a paused resource
retry       Retry the latest failed rollout
status      Show the status of the rollout
undo        Undo a previous rollout

oc rollout undo dc/example-deployment

* In your browser, refresh the page until you see the v2 image

* We can view during the deployment process the changes
##
oc describe dc deployment-example




