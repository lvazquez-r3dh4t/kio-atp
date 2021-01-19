#!/bin/bash


oc create -f /home/santiago/atp-utils/tests/jenkins-1.json -n openshift

oc create -f /home/santiago/atp-utils/tests/jenkins-ephemeral-template.json -n openshift
