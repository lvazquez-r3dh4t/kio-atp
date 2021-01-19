A full CI/CD environment can be installed in OpenShift



https://github.com/siamaksade/openshift-cd-demo



## Deploy on OpenShift

Create the following projects for CI/CD components, Dev and Stage environments:

```
# Create Projects
oc new-project dev --display-name="Tasks - Dev"
oc new-project stage --display-name="Tasks - Stage"
oc new-project cicd --display-name="CI/CD"

# Grant Jenkins Access to Projects
oc policy add-role-to-group edit system:serviceaccounts:cicd -n dev
oc policy add-role-to-group edit system:serviceaccounts:cicd -n stage
```

And then deploy the ci/cd environment:

```
# Deploy Demo
oc new-app -n cicd -f cicd-template.yaml
```



## Automated Deploy on OpenShift

You can se the `scripts/provision.sh` script provided to deploy the entire demo:

```
./provision.sh --help
./provision.sh deploy --enable-che --ephemeral # with Eclipse Che
./provision.sh delete 
```



Users:

- Gogs: `gogs/gogs`
- Nexus: `admin/admin123`
- SonarQube: `admin/admin`