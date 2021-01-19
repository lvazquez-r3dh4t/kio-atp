*Pod affinity* and *pod anti-affinity* allow you to specify rules about how pods should be placed relative to other pods. The rules are defined using custom [labels on nodes](https://docs.openshift.com/container-platform/3.11/architecture/core_concepts/pods_and_services.html#labels) and label selectors specified in pods. Pod affinity/anti-affinity allows a **pod** to specify an affinity (or anti-affinity) towards a group of **pods** it can be placed with. The node does not have control over the placement.

For example, using affinity rules, you could spread or pack pods within a service or relative to pods in other services. Anti-affinity rules allow you to prevent pods of a particular service from scheduling on the same nodes as pods of another service that are known to interfere with the performance of the pods of the first service. Or, you could spread the pods of a service across nodes or availability zones to reduce correlated failures. 

*Pod anti affinity*  test:

Create the pods

```
$ oc create -f "pod-s1.yaml"
```

```
$ oc create -f "pod-s2.yaml"
```



The pod **pod-s2** should be scheduled on a different node as `pod-s1`.
