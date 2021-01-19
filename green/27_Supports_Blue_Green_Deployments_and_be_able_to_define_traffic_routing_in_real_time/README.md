27 Supports Blue Green Deployments and be able to define traffic routing in real time.
==============================================================

# CLI way

 * Create the project
 
 oc new-project bluegreendeployment --display-name="Blue / Green Deployment"

 * Create the blue application
 
 oc new-app --name='blue' -l name='blue' php~https://github.com/wkulhanek/cotd.git -e SELECTOR=cats
 
 * Expose the service called bluegreen
 
 oc expose svc/blue --name=bluegreen

 * Create the green application
 
 oc new-app --name='green' -l name='green' php~https://github.com/wkulhanek/cotd.git -e SELECTOR=cities

 * Validate the split trafic through the router its attending by blue application
 
 while true; do curl -s http://bluegreen-{project}.{wildcard}.openshift-lab.com/item.php | grep "data/images" | awk '{print $5}'; sleep 1; done

 * Patch the route bluegreen to redirect the traffic through the service green
 
 oc patch route/bluegreen -p '{"spec":{"to":{"name":"green"}}}'

 * Validate the changes through the router 
 
 while true; do curl -s http://bluegreen-{project}.{wildcard}.openshift-lab.com/item.php | grep "data/images" | awk '{print $5}'; sleep 1; done
    
    

# Console way

 * Create the project
 
 ![27_1](https://user-images.githubusercontent.com/40834361/43008363-7daea526-8c00-11e8-85d9-4fbdd195c2ee.png)

 * Create the blue application
 
 ![27_2](https://user-images.githubusercontent.com/40834361/43008364-7dd9e95c-8c00-11e8-9c19-0b95f764fd81.png)
 
 * Expose the service called bluegreen. This step is done from cli, since there is no conosle way to complete it.
 
 ![27_3](https://user-images.githubusercontent.com/40834361/43008365-7e547d52-8c00-11e8-9687-4b4ef4bbd159.png)

 * Create the green application
 
 ![27_4](https://user-images.githubusercontent.com/40834361/43008366-7e79907e-8c00-11e8-9d53-56f37efd85fd.png)

 * Validate the split trafic through the router its attending by blue application
 
 ![27_5](https://user-images.githubusercontent.com/40834361/43008367-7eb957d6-8c00-11e8-8263-87e444d49082.png)

 * Patch the route bluegreen to redirect the traffic through the service green
 
 ![27_6](https://user-images.githubusercontent.com/40834361/43008368-7edb8806-8c00-11e8-8dd3-088b17c37e0a.png)

 * Validate the changes through the router 
 
 ![27_7](https://user-images.githubusercontent.com/40834361/43008369-7efd47ac-8c00-11e8-94c6-911fb8a11929.png)
    
    
    
    
   
