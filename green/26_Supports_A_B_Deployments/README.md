26 Supports A/B Deployments.
==============================================================

# CLI way

 * Create the project
 
 oc new-project abdeployment --display-name="A/B Deployment"

 * Create two applications to perform A/B Deployment
 
 oc new-app --name='cotd1' -l name='cotd1' php~https://github.com/wkulhanek/cotd.git -e SELECTOR=cats
 
 oc new-app --name='cotd2' -l name='cotd2' php~https://github.com/wkulhanek/cotd.git -e SELECTOR=cities

 * Expose the service
 
 oc expose service cotd1 --name='cotd-ab' -l name='cotd'

 * Set route bacnkend setting 50% / 50% for split the trafic 
 
 oc set route-backends cotd-ab cotd1=50 cotd2=50

 * Validate the split trafic through the router 
 
 while true; do curl -s http://cotd-ab-{project}.{wildcard}.openshift-lab.com/item.php | grep "data/images" | awk '{print $5}'; sleep 1; done

 * Modify the route backend and validate the changes
 
 oc set route-backends cotd-ab --adjust cotd2=+20%

 * Validate the changes through the router 
 
 while true; do curl -s http://cotd-ab-{project}.{wildcard}.openshift-lab.com/item.php | grep "data/images" | awk '{print $5}'; sleep 1; done
    
    
# Via Console

* Create the project A/B Deployment

![26_1](https://user-images.githubusercontent.com/40834361/42970148-1ee78090-8b6e-11e8-8616-d2555cc3c63c.png)

* Create two applications to perform A/B Deployment

![26_2](https://user-images.githubusercontent.com/40834361/42970150-1f00246a-8b6e-11e8-85e9-e138efbb0ea2.png)

![26_3](https://user-images.githubusercontent.com/40834361/42970254-711039ca-8b6e-11e8-8857-720d7713fac3.png)

 * Expose the service
 
   Since there is no way to expose the service via console, it must be exposed via CLI.
   
 ![26_4](https://user-images.githubusercontent.com/40834361/42974131-9feae2ce-8b7b-11e8-8b80-8612010a5786.png)
    

 * Set route bacnkend setting 50% / 50% for split the trafic 
 
 ![26_5](https://user-images.githubusercontent.com/40834361/42974205-e6a88aea-8b7b-11e8-967f-3ec0e13244b8.png)
 
 * Validate the split trafic through the router 
 
 ![26_6](https://user-images.githubusercontent.com/40834361/42974246-0c3e8110-8b7c-11e8-994c-d9408723dc0f.png)

 * Modify the route backend and validate the changes
 
 ![26_7](https://user-images.githubusercontent.com/40834361/42974940-1ca6372a-8b7f-11e8-992c-3f710c97b388.png)

 
 * Validate the changes through the router 
 ![26_8](https://user-images.githubusercontent.com/40834361/42974941-1cc54eb2-8b7f-11e8-8737-00d2e99b4be7.png)
    
    
   
