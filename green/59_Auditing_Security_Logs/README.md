 https://access.redhat.com/solutions/2174381



# OpenShift Authentication Logs

 SOLUTION VERIFICADA 

\- Actualizado

 

19 de Abril de 2018 a las 09:23

 

\-

 

[English ](https://access.redhat.com/solutions/2174381)

## Medio Ambiente

- Red Hat OpenShift Enterprise 3.1
- Red Hat OpenShift Container Platform
  - 3.2+

## Cuestión

- Looking for authentication logs
- If a user logs into OpenShift using the CLI, or the Web UI, where can we see the access logs or authentication errors?
- I need to know which users logged into the cluster in a specific timeframe

## Resolución

Authentication actions are being logged on the master node by the atomic-openshift-master service; However, the default log level does not show these logs. The first level that does show these logs is log level 4.

### Single master clusters, version 3.7 or earlier

To update to level 4,
\- Add the following to the `/etc/sysconfig/atomic-openshift-master` file:

[Raw](https://access.redhat.com/solutions/2174381#)

```
OPTIONS=--loglevel=4
```

- And then restart the master service:

[Raw](https://access.redhat.com/solutions/2174381#)

```
systemctl restart atomic-openshift-master
```

- Watch the journal logs for the master service for "Got userIdentityMapping" signature

[Raw](https://access.redhat.com/solutions/2174381#)

```
journalctl -lafu atomic-openshift-master | grep -i 'Got userIdentityMapping'
```

You should then be able to login somewhere else and see that result, otherwise you can now go into the logs for atomic-openshift-master and see it there:

[Raw](https://access.redhat.com/solutions/2174381#)

```
journalctl -u atomic-openshift-master
```

### Multi-master cluster on any version, or single master cluster from 3.9+

To update to level 4,
\- Add the following to the `/etc/sysconfig/atomic-openshift-master-api` file:

[Raw](https://access.redhat.com/solutions/2174381#)

```
OPTIONS=--loglevel=4
```

- And then restart the master api service:

[Raw](https://access.redhat.com/solutions/2174381#)

```
systemctl restart atomic-openshift-master-api
```

- Watch the journal logs for the master service for "Got userIdentityMapping" signature

[Raw](https://access.redhat.com/solutions/2174381#)

```
journalctl -lafu atomic-openshift-master-api | grep -i 'Got userIdentityMapping'
```

You should then be able to login somewhere else and see that result, otherwise you can now go into the logs for atomic-openshift-master-api and see it there:

[Raw](https://access.redhat.com/solutions/2174381#)

```
journalctl -u atomic-openshift-master-api
```

