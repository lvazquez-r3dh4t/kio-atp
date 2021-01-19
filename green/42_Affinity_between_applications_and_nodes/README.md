*Node affinity* is a set of rules used by the scheduler to determine where a pod can be placed. The rules are defined using custom [labels on nodes](https://docs.openshift.com/container-platform/3.11/architecture/core_concepts/pods_and_services.html#labels) and label selectors specified in pods. Node affinity allows a **pod** to specify an affinity (or anti-affinity) towards a group of **nodes** it can be placed on. The node does not have control over the placement.

For example, you could configure a pod to only run on a node with a specific CPU or in a specific availability zone.

There are two types of node affinity rules: *required* and *preferred*.

Required rules **must** be met before a pod can be scheduled on a node. Preferred rules specify that, if the rule is met, the scheduler tries to enforce the rules, but does not guarantee enforcement. 



### Node Affinity

The node1 node has the label `zone:us`:

```
$ oc label node node1 zone=us
```

- Create the pod using the standard command:

  ```
  $ oc create -f pod-s1.yaml
  
  ```


- The pod **pod-s1** can be scheduled on **node1**:

  ```
   oc get pod -o wide
  NAME     READY     STATUS       RESTARTS   AGE      IP      NODE
  pod-s1   1/1       Running      0          4m       IP1     node1
  ```

### 