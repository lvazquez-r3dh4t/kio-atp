
## Application Mounting 

##
We create an application:
![crear app](https://user-images.githubusercontent.com/40834435/42958023-f85fa62e-8b49-11e8-9b7b-f0b394aec824.JPG)
![crear app2](https://user-images.githubusercontent.com/40834435/42958027-fa88c016-8b49-11e8-8978-48337684dded.JPG)
![crear app3](https://user-images.githubusercontent.com/40834435/42958033-fc979bf2-8b49-11e8-8c3c-068600a331f3.JPG)
##
We validate the overview of the application:
![overwiew de app](https://user-images.githubusercontent.com/40834435/42958287-d28a4ae8-8b4a-11e8-920c-a5607470a239.JPG)
##
Select resources and click on configmaps:
![crear configmap](https://user-images.githubusercontent.com/40834435/42958295-d6faac30-8b4a-11e8-8226-550834c39ee9.JPG)
##
Click on create configmap:
![crear configmap2](https://user-images.githubusercontent.com/40834435/42958299-d8ef6a62-8b4a-11e8-9011-7b6c853d499d.JPG)
##
We create the configmap with the corresponding parameters:
![crear configmap3](https://user-images.githubusercontent.com/40834435/42958304-dad2fcea-8b4a-11e8-90e8-38f7d15098aa.JPG)
##
We validate that it was created correctly:
![crear configmap4](https://user-images.githubusercontent.com/40834435/42958315-ddd4fd6c-8b4a-11e8-8c78-6f1a6bd38c47.JPG)
##
Once created we add it to the application:
![add application](https://user-images.githubusercontent.com/40834435/42958333-eaace978-8b4a-11e8-8bb3-f84eb33fc0eb.JPG)
##
Select the deployment config and add the configmap as volume, assigning the directory where it will be mounted:
![add application2](https://user-images.githubusercontent.com/40834435/42958338-ec6efdfa-8b4a-11e8-90f2-33fbc8a0dde6.JPG)
##
We select the pod of the application, once inside the pod we click on terminal:
![validar1](https://user-images.githubusercontent.com/40834435/42958347-f07461ce-8b4a-11e8-99f7-5805d8411380.JPG)
![validar2](https://user-images.githubusercontent.com/40834435/42958350-f34e9914-8b4a-11e8-8a40-a03094930e49.JPG)
##
We validate that this is the configmap mounted in the directory that we specify and that contains what was previously configured:
![validar 3](https://user-images.githubusercontent.com/40834435/42958355-f52ee4aa-8b4a-11e8-86d8-2fa213f849a5.JPG)
![validar 4](https://user-images.githubusercontent.com/40834435/42958360-f6a2150a-8b4a-11e8-979b-daca1c2c66b2.JPG)
![validar 5](https://user-images.githubusercontent.com/40834435/42958365-f8744d62-8b4a-11e8-8e4a-e16de9d77f67.JPG)

