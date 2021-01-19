# OpenShift - 62 Application health check and automatic recovery
OpenShift can monitor health of containers with Readiness and Liveness properties.



## How to run this?

Create a frontend project, example httpd.

![1544201840527](1544201840527.png)



Then setup health checks:



![1546523994850](1546523994850.png)



Setup replicas to 3:



![1546524139749](1546524139749.png)

Then try to delete a pod:

![1546524194071](1546524194071.png)



See how a new pod is created a few seconds later:

![1546524264253](1546524264253.png)
