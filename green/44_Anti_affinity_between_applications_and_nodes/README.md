*Node affinity* is a set of rules used by the scheduler to determine where a pod can be placed. The rules are defined using custom [labels on nodes](https://docs.openshift.com/container-platform/3.11/architecture/core_concepts/pods_and_services.html#labels) and label selectors specified in pods. Node affinity allows a **pod** to specify an affinity (or anti-affinity) towards a group of **nodes** it can be placed on. The node does not have control over the placement.

For example, you could configure a pod to only run on a node with a specific CPU or in a specific availability zone.

There are two types of node affinity rules: *required* and *preferred*.

Required rules **must** be met before a pod can be scheduled on a node. Preferred rules specify that, if the rule is met, the scheduler tries to enforce the rules, but does not guarantee enforcement. 



### Node Anti affinity

- The **Node1** (app0.paas.americamovil.com)  has the label  zone ​ us:

  ```
  $ oc label node app0.paas.americamovil.com zone=us
  ```



- Create the pod using the standard command:

  ```
  $ oc create -f /home/santiago/atp-utils/tests/4-ene-2019/44-Anti-affinity-Nodes-Apps/pod-s1.yaml
  
  ```


- The pod **pod-s1** is scheduled on **Node1**:

  ```
  oc describe pod pod-s1
  
  ```

  Then:

- Create the pod 2using the standard command:

  ```
  $ oc create -f /home/santiago/atp-utils/tests/4-ene-2019/44-Anti-affinity-Nodes-Apps/pod-s2.yaml
  
  ```

- The pod **pod-s2** is scheduled on  another **Node**:

  ```
  oc describe pod pod-s2
  
  ```

