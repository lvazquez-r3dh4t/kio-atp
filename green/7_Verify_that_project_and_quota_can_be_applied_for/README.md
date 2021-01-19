 Quota Management Strategy for OpenShift

The following is an example of a strategy that might be employed by an Operations team for managing project quotas. This approach uses the concept of *tier profiles* so as to avoid having to manage many custom quotas for each project/tenant. In this example we have defined the following tier profiles.

| Profile         | Project CPU             | Project Memory          | Per Pod CPU                       | Per Pod Memory                         |
| --------------- | ----------------------- | ----------------------- | --------------------------------- | -------------------------------------- |
| Small (default) | 1 core (burstable to 2) | 6 Gi (burstable to 8)   | 10m - 100m; default request: 50m  | 128 Mi - 1 Gi; default request: 256 Mi |
| Medium          | 2 core (burstable to 4) | 12 Gi (burstable to 16) | 10m - 200m; default request: 50m  | 128 Mi - 2 Gi; default request: 256 Mi |
| Large           | 4 core (burstable to 8) | 24 Gi (burstable to 32) | 10m - 1000m; default request: 50m | 128 Mi - 4 Gi; default request: 256 Mi |

The specs above are not important, nor are the number of profiles we've defined. What is important is how we define & apply the quotas to projects. We describe the process below.

## Concepts and Workflow

The following sections describe how we piece together this approach.

### Quota Files

First off, each quota is defined in its own YAML file (`./files/quota-small.yml`, `./files/quota-medium.yml`, `./files/quota-large.yml`) in a git repo. Each file contains the same *List* of objects all with the same names:

```
$ awk '/name:/{print}' files/quota-*.yml
files/quota-large.yml:    name: quota
files/quota-large.yml:    name: burst-quota
files/quota-large.yml:    name: limits
files/quota-medium.yml:    name: quota
files/quota-medium.yml:    name: burst-quota
files/quota-medium.yml:    name: limits
files/quota-small.yml:    name: quota
files/quota-small.yml:    name: burst-quota
files/quota-small.yml:    name: limits
```

The *profiles* are differentiated using labels and annotations:

```
$ awk /'labels:/{getline; print}' files/quota-*.yml
      quota-tier: Large
      quota-tier: Large
      quota-tier: Large
      quota-tier: Medium
      quota-tier: Medium
      quota-tier: Medium
      quota-tier: Small
      quota-tier: Small
      quota-tier: Small

$ awk /'annotations:/{getline; print}' files/quota-*.yml
      openshift.io/quota-tier: Large
      openshift.io/quota-tier: Large
      openshift.io/quota-tier: Large
      openshift.io/quota-tier: Medium
      openshift.io/quota-tier: Medium
      openshift.io/quota-tier: Medium
      openshift.io/quota-tier: Small
      openshift.io/quota-tier: Small
      openshift.io/quota-tier: Small
```

### Apply Quota Tier Profiles

When set up as above, our *tier profiles* may be easily applied, reapplied, and overlayed on top of each other. Let's look at an example.

A user wants to create a new project, and does so via `oc new-project myapp-space`.

A `cluster-admin` can then simply go in and apply the small quota to that project in order to limit resource consumption in that new project.

```
$ oc apply -f files/quota-small.yml -n myapp-space
resourcequota "quota" created
resourcequota "burst-quota" created
limitrange "limits" created
```

Looking at the resources created, we can see the consistent `quota-tier=Small` label across them.

```
$ oc get quota,limitrange --show-labels -n myapp-space
NAME                AGE       LABELS
quota/burst-quota   2m        quota-tier=Small
quota/quota         2m        quota-tier=Small

NAME            AGE       LABELS
limits/limits   2m        quota-tier=Small
```

Now let's create a couple more projects all with a small quota.

```
$ oc new-project myapp-space2
$ oc apply -f files/quota-small.yml -n myapp-space2
$ oc new-project myapp-space3
$ oc apply -f files/quota-small.yml -n myapp-space3
$ oc new-project myapp-space4
$ oc apply -f files/quota-small.yml -n myapp-space4
```

And now, let's re-examine what we've got as far as quotas established.

```
$ oc get quota,limitrange --all-namespaces --show-labels
NAMESPACE      NAME                AGE       LABELS
myapp-space    quota/burst-quota   14m       quota-tier=Small
myapp-space    quota/quota         14m       quota-tier=Small
myapp-space2   quota/burst-quota   3m        quota-tier=Small
myapp-space2   quota/quota         3m        quota-tier=Small
myapp-space3   quota/burst-quota   2m        quota-tier=Small
myapp-space3   quota/quota         2m        quota-tier=Small
myapp-space4   quota/burst-quota   2m        quota-tier=Small
myapp-space4   quota/quota         2m        quota-tier=Small

NAMESPACE      NAME            AGE       LABELS
myapp-space    limits/limits   14m       quota-tier=Small
myapp-space2   limits/limits   2m        quota-tier=Small
myapp-space3   limits/limits   2m        quota-tier=Small
myapp-space4   limits/limits   2m        quota-tier=Small
```

As you can see, we have 4 projects, each with our Small *tier profile* applied to it.

Now let's say that `myapp-space2` is consistently running up against it's quota, and we would like to grant it some more breathing room. Doing that is as easy as applying a larger *tier profile* to the project.

```
$ oc apply -f files/quota-medium.yml -n myapp-space2
resourcequota "quota" configured
resourcequota "burst-quota" configured
limitrange "limits" configured
```

Notice that this time around the same 3 objects are listed, but they are listed as `configured` instead of `created`. This is because our *tier profiles* all define the same set of named resources, just with different values. If we look at the labels, we can, in fact see that the objects were updated.

```
$ oc get quota,limitrange --all-namespaces --show-labels
NAMESPACE      NAME                AGE       LABELS
myapp-space    quota/burst-quota   23m       quota-tier=Small
myapp-space    quota/quota         23m       quota-tier=Small
myapp-space2   quota/burst-quota   12m       quota-tier=Medium
myapp-space2   quota/quota         12m       quota-tier=Medium
myapp-space3   quota/burst-quota   11m       quota-tier=Small
myapp-space3   quota/quota         11m       quota-tier=Small
myapp-space4   quota/burst-quota   11m       quota-tier=Small
myapp-space4   quota/quota         11m       quota-tier=Small

NAMESPACE      NAME            AGE       LABELS
myapp-space    limits/limits   23m       quota-tier=Small
myapp-space2   limits/limits   11m       quota-tier=Medium
myapp-space3   limits/limits   11m       quota-tier=Small
myapp-space4   limits/limits   10m       quota-tier=Small
```