#Supports the original rolling
##
Create a new project within the platform:
![paso1](https://user-images.githubusercontent.com/40834435/42894080-98236ee0-8a7b-11e8-9e91-9b59b5bc5d00.jpg)
##
Assign name for the new project and a short description 
![paso2](https://user-images.githubusercontent.com/40834435/42894084-9b5c6b5c-8a7b-11e8-86bf-c6d029e26c6d.jpg)
##
Select the browse catalog option:
![paso3](https://user-images.githubusercontent.com/40834435/42894087-9d4e4a48-8a7b-11e8-846a-c77257780dfb.jpg)
##
We select an application:
![paso4](https://user-images.githubusercontent.com/40834435/42894089-9f11cbde-8a7b-11e8-99ac-bfe060caad1f.jpg)
##
We configure the application that we select:
![paso5](https://user-images.githubusercontent.com/40834435/42894093-a11ea640-8a7b-11e8-874b-224a989c9421.jpg)
##
We assign the corresponding parameters:
![paso6](https://user-images.githubusercontent.com/40834435/42894097-a3c51686-8a7b-11e8-9a4b-ac647568aeb4.jpg)
![paso7](https://user-images.githubusercontent.com/40834435/42894103-a6916072-8a7b-11e8-9290-aa7b097a05da.jpg)
##
Once created, we will click on the overview to validate the creation:
![paso8](https://user-images.githubusercontent.com/40834435/42894105-a8c2e6ea-8a7b-11e8-98b5-6d8b9f2308f6.jpg)
##
We increase the number of pods by clicking on the scale up that is next to the total of pods that we have
![paso9](https://user-images.githubusercontent.com/40834435/42894109-ab9e8b26-8a7b-11e8-955e-33ecd473c25d.jpg)
##
Click on créate binding:
![paso10](https://user-images.githubusercontent.com/40834435/42894116-ae3eab04-8a7b-11e8-8ea2-e31b230866cd.jpg)
##
Click on bind:
![paso11](https://user-images.githubusercontent.com/40834435/42894119-b08f6dee-8a7b-11e8-95c3-c71fdf3fac97.jpg)
##
The Rolling deployment begins:
![paso12](https://user-images.githubusercontent.com/40834435/42894122-b24930d4-8a7b-11e8-8840-fca1b4cec10b.jpg)
![paso13](https://user-images.githubusercontent.com/40834435/42894128-b69cc72c-8a7b-11e8-81f9-baab65f188ab.jpg)
##
At the end of the Rolling:
![paso14](https://user-images.githubusercontent.com/40834435/42894133-b9e5df72-8a7b-11e8-87ef-44cda778e433.jpg)

##
We connect by console to the project and validate that the corresponding deployments were made
![seleccionar proyecto](https://user-images.githubusercontent.com/40834435/43015391-484c7358-8c15-11e8-9e4f-cb305a0e7fb5.JPG)
![validar deploy](https://user-images.githubusercontent.com/40834435/43015377-3dec72b4-8c15-11e8-9001-3fd0de341b9c.JPG)
##
We enter the following command to rollback [oc rollout undo dc / "name of the image"]
![rollback](https://user-images.githubusercontent.com/40834435/43015410-4d231f9e-8c15-11e8-8f82-36be6a0307d9.JPG)
##
We display the overview to validate rollout
![rollback2](https://user-images.githubusercontent.com/40834435/43015438-52d73aba-8c15-11e8-9329-7bc8abbdac83.JPG)



