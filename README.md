ATP-OCP-RHV: La finalidad de este proyecto es demostrar funcionalidades definidas por el cliente y comprobadas mediante distintos tests en un ambiente de OpenShift en RHV
==============================================================
Authors: Javier Arce, Ana Cecilia Ruiz, Erik Gutiérrez,Jorge Cano, Jorge Juárez, Santiago Angel
Level: Intermediate  
Technologies: OCP 3.9, OCP 3.10, OCP 3.11, RHV 4, RHEL 7.5, Docker, Kubernetes  

Source: <https://github.com/santiagoangel/ATP-OCP-RHV>  


ATP-OCP-RHV - Acceptane Test Protocol PAAS

# Test Cases 

## Multi-Tenant Management

### 1 Deployment to Multiple Data centers

### 2 Active/Active setup across multiple data centers

### 3 Tenant Application and Approval

### 4 Integration with enterprise SSO

### 5 Integration with LDAP

### 6 Role-based administration Management

## Cluster Management

### 7 Cluster project and Quota Application

### 8 Manually manage a Cluster

### 9 Manage Clusters in Batches

### 10 Dynamically Expanding a Cluster

## Container Application Management

### 11 Stateless containerized application

### 12 Stateful containerized application

### 13 Short task life cycle management

### 16 Container manual scaling

### 17 Automatic container scaling based on RAM or vCPU metrics

### 18 WebSSH Log in to the container.

## VM Application mangement

### 19 Life cycle management of VM applications

## Application Service Management

### 20 Application Loadbalance service access

### 21 Application ClusterIP service access

### 22 Mapping apps IP to host

## Application Upgrade

### 23 Rolling application upgrade

### 24 Application replacement and upgrade

### 25 Rolling upgrade of applications in the same place

### 26 A/B Deploymet

### 27 Blue Green Deployment

### 28 Canary deployment

## Volume Management

### 29 Creating and Deleting Data Volumes

### 30 Attaching a Data Volume to an Application

### 31 Dynamically Creating Data Volumes

## Configuration Management

### 32 Add and delete configurations

### 33 Application Mounting Configuration

### 34 Dynamic update configuration

### 35 Environment variable management

### 36 Capability to inject custom configurations at runtime using ConfigMaps

## Monitoring and Log Management

### 37 Application monitoring

### 38 Customizing Monitoring Indicators

### 39 Log interface

### 40 Log Search

## Scheduling policy management

### 41 Affinity between applications

### 42 Affinity between applications and nodes

### 43 Anti-affinity between applications

### 44 Anti-affinity between applications and nodes

## Warehouse Management

### 45 Image repository management

### 46 Image and version management

### 47 Image repository permission management

### 48 Software warehouse management of VM applications

### 49 Software Package and Version Management of VM applications

## Application Orchestration Test 

### 50 Graphical orchestration of container applications

### 51 Graphical orchestration of VM applications

### 52 Graphical hybrid orchestration of containers and VM applications

## Service Catalog

### 56 Releasing Universal Middleware Services

### 57 Releasing a self-Customized Service

### 58 Service instance orchestration

## Security Management

### 59 Auditing Security Logs

### 60 Audit operation logs

## Availability test 

### 62 Application health check and automatic recovery

### 63 Container availability

### 64 Host machine availability

### 65 High availability of the image repository

### 66 Management node availability

## Customized test

### 67 Dark Launch

### 68 CICD

### 69 Developer tools

### 70 Standalone developer version

### 71 Migration test

## Extra

### 72 In place upgrade
https://docs.openshift.com/container-platform/3.11/upgrading/automated_upgrades.html
