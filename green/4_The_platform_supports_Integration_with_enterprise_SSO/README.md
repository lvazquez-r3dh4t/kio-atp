 **4 -SSO**

## 1.1. What Is Red Hat Single Sign-On?

Red Hat Single Sign-On (RH-SSO) is an integrated sign-on solution available as a Red Hat JBoss Middleware for OpenShift containerized image. The Red Hat Single Sign-On for OpenShift image provides an authentication server for users to centrally log in, log out, register, and manage user accounts for web applications, mobile applications, and RESTful web services.

Red Hat offers multiple OpenShift application templates utilizing the RH-SSO for OpenShift image version number 7.2. These define the resources needed to develop Red Hat Single Sign-On 7.2 server based deployment and can be split into the following two categories:

- Templates using HTTPS and JGroups keystores and a truststore for the RH-SSO server, all prepared beforehand. These secure the TLS communication using [passthrough TLS termination](https://docs.openshift.com/container-platform/latest/architecture/networking/routes.html#passthrough-termination):
  - **sso72-https**: RH-SSO 7.2 backed by internal H2 database on the same pod.
  - **sso72-mysql**: RH-SSO 7.2 backed by ephemeral MySQL database on a separate pod.
  - **sso72-mysql-persistent**: RH-SSO 7.2 backed by persistent MySQL database on a separate pod.
  - **sso72-postgresql**: RH-SSO 7.2 backed by ephemeral PostgreSQL database on a separate pod.
  - **sso72-postgresql-persistent**: RH-SSO 7.2 backed by persistent PostgreSQL database on a separate pod.

- Templates using OpenShift’s internal [service serving x509 certificate secrets](https://docs.openshift.com/container-platform/latest/dev_guide/secrets.html#service-serving-certificate-secrets) to automatically create the HTTPS keystore used for serving secure content. The JGroups cluster traffic is authenticated using the `AUTH` protocol. The RH-SSO server truststore is also created automatically, containing the **/var/run/secrets/kubernetes.io/serviceaccount/service-ca.crt** CA certificate file, which is used to create these cluster certificates. Moreover, the truststore for the RH-SSO server is pre-populated with the all known, trusted CA certificate files found in the Java system path. These are securing the TLS communication using [re-encryption TLS termination](https://docs.openshift.com/container-platform/latest/architecture/networking/routes.html#re-encryption-termination):
  - **sso72-x509-https**: RH-SSO 7.2 with auto-generated HTTPS keystore and RH-SSO truststore, backed by internal H2 database.
  - **sso72-x509-mysql-persistent**: RH-SSO 7.2 with auto-generated HTTPS keystore and RH-SSO truststore, backed by persistent MySQL database.
  - **sso72-x509-postgresql-persistent**: RH-SSO 7.2 with auto-generated HTTPS keystore and RH-SSO truststore, backed by persistent PostgreSQL database.

Other templates that integrate with RH-SSO are also available:

- **eap64-sso-s2i**: RH-SSO-enabled Red Hat JBoss Enterprise Application Platform 6.4.
- **eap70-sso-s2i**: RH-SSO-enabled Red Hat JBoss Enterprise Application Platform 7.0.
- **eap71-sso-s2i**: RH-SSO enabled Red Hat JBoss Enterprise Application Platform 7.1.
- **datavirt63-secure-s2i**: RH-SSO-enabled Red Hat JBoss Data Virtualization 6.3.

These templates contain environment variables specific to RH-SSO that enable automatic RH-SSO client registration when deployed.

See [Automatic and Manual RH-SSO Client Registration Methods](https://access.redhat.com/documentation/en-us/red_hat_single_sign-on/7.2/html-single/red_hat_single_sign-on_for_openshift/index#Auto-Man-Client-Reg) for more information.

# Chapter 2. Before You Begin

## 2.1. Comparison: RH-SSO for OpenShift Image and Red Hat Single Sign-On

The RH-SSO for OpenShift image version number 7.2 is based on Red Hat Single Sign-On 7.2. There are some differences in functionality between the RH-SSO for OpenShift image and Red Hat Single Sign-On:

- The RH-SSO for OpenShift image includes all of the functionality of Red Hat Single Sign-On. In addition, the RH-SSO-enabled JBoss EAP image automatically handles OpenID Connect or SAML client registration and configuration for **.war** deployments that contain **<auth-method>KEYCLOAK</auth-method>** or **<auth-method>KEYCLOAK-SAML</auth-method>** in their respective **web.xml** files.

## 2.2. Version Compatibility and Support

See the xPaaS part of the [OpenShift and Atomic Platform Tested Integrations page](https://access.redhat.com/articles/2176281) for details about OpenShift image version compatibility.

## 2.3. Deprecated Image Streams and Application Templates for RH-SSO for OpenShift

IMPORTANT

The RH-SSO for OpenShift image version number 7.0 and 7.1 are deprecated and they will no longer receive updates of image and application templates.

**To deploy new applications, it is recommended to use the version 7.2 of the RH-SSO for OpenShift image along with the application templates specific to that version.**

## 2.4. Initial Setup

The Tutorials in this guide follow on from and assume an OpenShift instance similar to that created in the [OpenShift Primer](https://access.redhat.com/documentation/en/red-hat-application-services/0/openshift-primer).

IMPORTANT

For information related to updating the existing database when migrating RH-SSO for OpenShift image from RH-SSO 7.0 to RH-SSO 7.1, or from RH-SSO 7.1 to RH-SSO 7.2, see the [Updating Existing Database when Migrating RH-SSO for OpenShift Image to a new version](https://access.redhat.com/documentation/en-us/red_hat_single_sign-on/7.2/html-single/red_hat_single_sign-on_for_openshift/index#upgrading-sso-db-from-70-to-71) section.

# Chapter 3. Getting Started

## 3.1. Using the RH-SSO for OpenShift Image Streams and Application Templates

Red Hat JBoss Middleware for OpenShift images are pulled on demand from the Red Hat Registry: [registry.access.redhat.com](http://registry.access.redhat.com/). To update to the latest RH-SSO for OpenShift images, run the following commands:

1. On your master host(s), ensure that you are logged in as a cluster administrator or a user with project administrator access to the global `openshift` project.

   ```
   $ oc login -u system:admin
   ```

2. Run the following commands to update the core set of RH-SSO 7.2 resources for OpenShift in the `openshift` project:

   ```
   $ for resource in sso72-image-stream.json \
     sso72-https.json \
     sso72-mysql.json \
     sso72-mysql-persistent.json \
     sso72-postgresql.json \
     sso72-postgresql-persistent.json \
     sso72-x509-https.json \
     sso72-x509-mysql-persistent.json \
     sso72-x509-postgresql-persistent.json
   do
     oc replace -n openshift --force -f \
     https://raw.githubusercontent.com/jboss-openshift/application-templates/ose-v1.4.11/sso/${resource}
   done
   ```

3. Run the following command to install the RH-SSO 7.2 OpenShift image streams in the `openshift` project:

   ```
   $ oc -n openshift import-image redhat-sso72-openshift:1.1
   ```

## 3.2. Deploying the RH-SSO for OpenShift Image

### 3.2.1. Preparing the Deployment

Log in to the OpenShift CLI with a user that holds the *cluster:admin* role.

1. Create a new project:

   ```
   $ oc new-project sso-app-demo
   ```

2. Add the `view` role to the [`default`](https://docs.openshift.com/container-platform/latest/dev_guide/service_accounts.html#default-service-accounts-and-roles) service account. This enables the service account to view all the resources in the sso-app-demo namespace, which is necessary for managing the cluster.

   ```
   $ oc policy add-role-to-user view system:serviceaccount:$(oc project -q):default
   ```

### 3.2.2. Deploying the RH-SSO for OpenShift Image using Application Template

#### 3.2.2.1. Deploying the Template via OpenShift CLI

1. List the available RH-SSO application templates:

   ```
   $ oc get templates -n openshift -o name | grep -o 'sso72.\+'
   sso72-https
   sso72-mysql
   sso72-mysql-persistent
   sso72-postgresql
   sso72-postgresql-persistent
   sso72-x509-https
   sso72-x509-mysql-persistent
   sso72-x509-postgresql-persistent
   ```

2. Deploy the selected one:

   ```
   $ oc new-app --template=sso72-x509-https
   --> Deploying template "openshift/sso72-x509-https" to project sso-app-demo
   
        Red Hat Single Sign-On 7.2 (Ephemeral)
        ---------
        An example RH-SSO 7 application. For more information about using this template, see https://github.com/jboss-openshift/application-templates.
   
        A new RH-SSO service has been created in your project. The admin username/password for accessing the master realm via the RH-SSO console is IACfQO8v/nR7llVSVb4Dye3TNRbXoXhRpAKTmiCRc. The HTTPS keystore used for serving secure content, the JGroups keystore used for securing JGroups communications, and server truststore used for securing RH-SSO requests were automatically created via OpenShift's service serving x509 certificate secrets.
   
        * With parameters:
           * Application Name=sso
           * JGroups Cluster Password=jg0Rssom0gmHBnooDF3Ww7V4Mu5RymmB # generated
           * Datasource Minimum Pool Size=
           * Datasource Maximum Pool Size=
           * Datasource Transaction Isolation=
           * ImageStream Namespace=openshift
           * RH-SSO Administrator Username=IACfQO8v # generated
           * RH-SSO Administrator Password=nR7llVSVb4Dye3TNRbXoXhRpAKTmiCRc # generated
           * RH-SSO Realm=
           * RH-SSO Service Username=
           * RH-SSO Service Password=
           * Container Memory Limit=1Gi
   
   --> Creating resources ...
       service "sso" created
       service "secure-sso" created
       service "sso-ping" created
       route "sso" created
       route "secure-sso" created
       deploymentconfig "sso" created
   --> Success
       Run 'oc status' to view your app.
   ```

#### 3.2.2.2. Deploying the Template via OpenShift Web Console

Alternatively, perform the following steps to deploy the RH-SSO template via OpenShift web console:

1. Log in to the OpenShift web console and select the *sso-app-demo* project space.
2. Click **Add to Project**, then **Browse Catalog** to list the default image streams and templates.
3. Use the **Filter by Keyword** search bar to limit the list to those that match *sso*. You may need to click **Middleware**, then **Integration** to show the desired application template.
4. Select an RH-SSO application template. This example uses **Red Hat Single Sign-On 7.2 (Ephemeral)**.
5. Click **Next** in the **Information** step.
6. From the **Add to Project** drop-down menu, select the *sso-app-demo* project space. Then click **Next**.
7. Select **Do not bind at this time** radio button in the **Binding** step. Click **Create** to continue.
8. In the **Results** step, click the **Continue to the project overview** link to verify the status of the deployment.

### 3.2.3. Accessing the Administrator Console of the RH-SSO Pod

After the template got deployed, identify the available routes:

```
$ oc get routes
```

| NAME       | HOST/PORT                                     | PATH | SERVICES   | PORT  | TERMINATION | WILDCARD |
| ---------- | --------------------------------------------- | ---- | ---------- | ----- | ----------- | -------- |
| secure-sso | secure-sso-sso-app-demo.openshift.example.com |      | secure-sso | <all> | reencrypt   | None     |
| sso        | sso-sso-app-demo.openshift.example.com        |      | sso        | <all> |             | None     |

and access the RH-SSO administrator console at:

- **https://secure-sso-sso-app-demo.openshift.example.com/auth/admin**
- **http://sso-sso-app-demo.openshift.example.com/auth/admin**

using the [administrator account](https://access.redhat.com/documentation/en-us/red_hat_single_sign-on/7.2/html-single/red_hat_single_sign-on_for_openshift/index#sso-administrator-setup).

