## Canary deployment

[Canary](https://martinfowler.com/bliki/CanaryRelease.html) is about deploying an application in small, incremental steps, and only to a small group of people. There are a few possible approaches, with the simplest being to serve only some percentage of the traffic to the new application (I will show how to do that in OpenShift), to a more complicated solutions, such as a [feature toggle](https://martinfowler.com/articles/feature-toggles.html). A feature toggle allows you to gate access to certain features based on specific criteria (e.g., gender, age, country of origin). The most advanced feature toggle I am aware of, [gatekeeper](https://www.facebook.com/notes/facebook-engineering/building-and-testing-at-facebook/10151004157328920/), is implemented at Facebook.

![Canary deployment](https://opensource.com/sites/default/files/f3_0.png)

*Canary deployment*

Let's try implementing the canary deployment using OpenShift. First we need to create our application. Again we will use the **hello-openshift** image for that purpose:

```
oc run prod --image=openshift/hello-openshift --replicas=9
oc set env dc/prod RESPONSE="Hello from Prod"
oc expose dc/prod --port=8080
```

We need to expose our application to be accessible externally:

```
oc expose svc/prod
```

The newer version of the application (called canary) will be deployed similarly, but with only single instance:

```
oc run canary --image=openshift/hello-openshift
oc set env dc/canary RESPONSE="Hello from Canary"
oc expose dc/canary --port=8080
oc set route-backends prod prod=100 canary=0
```

We want to verify whether the new version of the application is working correctly in our "production" environment. The caveat is that we want to expose it only to a small amount of clients—to gather feedback, for example. For that we need to configure the route in such a way that only a small percent of the incoming traffic is forwarded to the newer (canary) version of the application:

```
oc set route-backends prod prod=90 canary=10
```

The easiest way to verify this new setup (as seen in the OpenShift web console screenshot below) is by invoking the following loop:

```
while true; do curl http://prod-canary.apps.paas.americamovil.com/; sleep .2; done
```

![OpenShift web console, route preview after sending small percentage of the traffic to the canary version.](https://opensource.com/sites/default/files/f4_0.png)

*OpenShift web console, route preview after sending small percentage of the traffic to the canary version*

Note: There is a connection between how many replicas you have deployed and the percentage of the traffic that is being directed at each version. Because the service that is in front of the deployment works as a load balancer in combination with route division, that gives you the actual amount of traffic the application will get. In our case it is approximately 1.5%.

The biggest advantage of this approach is the feature toggle, especially when you have one that allows you to pick the target groups of your canary deployment. That, connected with decent user-behavior analytics tools, will give you a good feedback about the new features you are considering deploying to a wider audience. Like blue-green deployment, canary suffers from the N-1 data compatibility, because at any point in time we are running more than one version of the application.

There is nothing stopping you from having more than one canary deployments at any point in time. 