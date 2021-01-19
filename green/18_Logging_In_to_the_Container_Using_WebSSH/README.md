# Web way
The first step will be accessing the platform, with the assigned credentials:
![login](https://user-images.githubusercontent.com/40834435/42892147-b638bc28-8a76-11e8-98d9-ea1249a5d128.jpg)
##
Once we access the platform we will select a previously created project:
![select project](https://user-images.githubusercontent.com/40834435/42893139-2e84541a-8a79-11e8-83da-e3b6389e8619.jpg)
##
Once inside the project we select the application option:
![select application](https://user-images.githubusercontent.com/40834435/42893144-328d29a6-8a79-11e8-883a-2a056372fb1f.jpg)
##
Then we will click on the "Pods" section:
![select pods](https://user-images.githubusercontent.com/40834435/42893159-3821405a-8a79-11e8-97a8-890da9450e3f.jpg)
##
Select a Pod that we have created:
![select pod2](https://user-images.githubusercontent.com/40834435/42893162-3ac24a02-8a79-11e8-8aca-7418275bf5b4.jpg)
##
Once inside the Pod it shows us the information that contains the selected Pod:
![infopod](https://user-images.githubusercontent.com/40834435/42893173-41c2ffb8-8a79-11e8-9361-c4504680bcb7.jpg)
##
We select the terminal option:
![terminal pod](https://user-images.githubusercontent.com/40834435/42893178-43f22d9a-8a79-11e8-9c21-226806762022.jpg)

# By Terminal
 In order to get access to the container via rsh, the following packages must be installed:
 ![install packages](https://user-images.githubusercontent.com/40834361/42899404-8a55b948-8a8b-11e8-9da0-168a1fb60258.png)
 ##
 Once the packages have been installed, the CLI will be downloaded by accessing the About page of the Openshift Web Console, in  the Command Line Tools link.
![download cli](https://user-images.githubusercontent.com/40834361/42899405-8a765928-8a8b-11e8-8762-c7d09ee0fe4e.png)
##
To login into the console, you must click the copy to clipboard icon next to the oc login **https://console.amx.openshift-lab.com:8443 –token=<hidden>** command line and paste it into a terminal. Using traditional copy-paste commands won’t copy the token correctly.
![token](https://user-images.githubusercontent.com/40834361/42899406-8a88dd50-8a8b-11e8-9d18-c5edddbf25eb.png)
 ##
 To display the available projects, run oc get projects; to change the current project, run oc project <project name>. To display the available pods, run **oc get pods**; to select a pod, run **oc pod <name of the pod>**.
  ![available projects](https://user-images.githubusercontent.com/40834361/42899407-8a9b22c6-8a8b-11e8-94ff-9d5e98d8457f.png)
 ![select pod](https://user-images.githubusercontent.com/40834361/42899408-8ab1c8f0-8a8b-11e8-8e2f-3635827af8de.png)
 ##
 To gain access to a pod’s terminal via rsh, run **oc rsh <name of the pod>**
  ![enter terminal](https://user-images.githubusercontent.com/40834361/42899409-8acb37ea-8a8b-11e8-995f-2617ce53f206.png)
