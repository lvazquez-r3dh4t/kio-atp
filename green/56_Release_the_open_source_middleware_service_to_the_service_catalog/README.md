## Releasing Universal Middleware Services

Create test project: 

```
$ oc new-project test
```

Create image streams in test project: 

```
$ oc create -f image-streams-rhel7.json -n test
```

Import template in test project: 

```
$ oc create -f mysql-ephemeral-template.json -n test
```





 

 
