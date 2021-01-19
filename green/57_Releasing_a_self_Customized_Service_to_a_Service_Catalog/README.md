## Releasing a self-Customized Service

Create custom project: 

```
$ oc new-project custom
```

Create image stream in custom project: 

```
$ oc create -f jenkins-1.json -n custom
```

Import template in custom project: 

```
$ oc create -f jenkins-1-ephemeral-template.json -n custom
```





 

 
