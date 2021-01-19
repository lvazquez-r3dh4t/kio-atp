
# Support of configuration management


   * Deploy the same application in two different projects: one which represents the development environment (32 Development) and               another one which represents the QA environment (32 QA)
     
     ![32_1](https://user-images.githubusercontent.com/40834361/43105299-07cb06aa-8e9a-11e8-8750-8ec87b265371.png)
     
     ![32_2](https://user-images.githubusercontent.com/40834361/43105300-07e5bfea-8e9a-11e8-86df-28452a22db21.png)
    
   * Add an environment variable to the aplication in 32 Development
    
   ![32_3](https://user-images.githubusercontent.com/40834361/43105301-07fb6084-8e9a-11e8-9179-8c5332feb86c.png)
    
   * Display the new variable and its value in console
    
   ![32_4](https://user-images.githubusercontent.com/40834361/43105302-0814ee28-8e9a-11e8-813a-e16f851bff6d.png)
   
   * Add the same variable with a different value to the application in 32 QA
    
   ![32_5](https://user-images.githubusercontent.com/40834361/43105303-0832b4f8-8e9a-11e8-9c91-fe42629eea9c.png)
    
   * Display the variable in the 32 QA application and its value
    
   ![32_7](https://user-images.githubusercontent.com/40834361/43105305-08589952-8e9a-11e8-8bfb-feaf3b057d5b.png)
    
   * Modify the value of the variable in the 32 Development environment
    
   ![32_8](https://user-images.githubusercontent.com/40834361/43105306-08715b18-8e9a-11e8-8535-9f04d690ccd9.png)
    
   * Display the new value
    
   ![32_9](https://user-images.githubusercontent.com/40834361/43105307-089d19f6-8e9a-11e8-9b20-47773574a342.png)
    
   * Display the value of the variable in 32 QA in order to verify it has not changed
    
   ![32_10](https://user-images.githubusercontent.com/40834361/43105308-08b347d0-8e9a-11e8-8801-c1ed8d99af2f.png)
    
   * Display the deployment history from the application in 32 Developent
    
   ![32_11](https://user-images.githubusercontent.com/40834361/43105309-08dce4fa-8e9a-11e8-931b-bdb20fcd2e5c.png)
    
   * Verify that the former value of the variable is registered in the deployment history
    
   ![32_12](https://user-images.githubusercontent.com/40834361/43105310-08f49992-8e9a-11e8-9039-e527f7f291e9.png)
    
  * Rollback the first version of the deployment
    
   ![32_13](https://user-images.githubusercontent.com/40834361/43105311-091ebea2-8e9a-11e8-845a-f4035b9cf98e.png)
   ![32_14](https://user-images.githubusercontent.com/40834361/43105312-0935578e-8e9a-11e8-8ebc-e687c49c5ae8.png)
    
   * Verify that the variable in 32 Development returns to its original value after the rollback
    
   ![32_15](https://user-images.githubusercontent.com/40834361/43105313-094c69f6-8e9a-11e8-80cc-abc83b363b78.png)
    
   * Verify that the variable in 32 QA hasn't changed its value
    
   ![32_16](https://user-images.githubusercontent.com/40834361/43105315-095e75a6-8e9a-11e8-8640-61982ba6d1c9.png)
    
