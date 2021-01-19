# OpenShift - Autoscaling
OpenShift can manually or automatically scale application pods up and down based on container metrics such as cpu and memory consumption.  



## How to run this?

Create a frontend project, example httpd.

![1544201840527](./1544201840527.png)



Then setup resource limits:



![1546522424261](./1546522424261.png)



Then create an autoscaler:

![1544200754492](./1544200754492.png)



Set autoscale config:

![1546523758333](./1546523758333.png)





Test:



ab -n 50000 -c 10 http://httpd-ex-auto2.apps.paas.americamovil.com/

![1544201688749](./1544201688749.png)



And see pod autoscaling:



![1544201773842](./1544201773842.png)

