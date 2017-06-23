#!/bin/bash
# Check if all kubernetes components are healthy
#
# The health check is done with following command line:
# /usr/bin/kubectl get componentstatus ${COMPONENT}

COMPONENT=$1
TIMESTAMP=$(date '+%s')

if [[ $(/usr/bin/kubectl get componentstatus ${COMPONENT}) ]]; then
    echo "nais.component.eventtags.component.${COMPONENT} 0 ${TIMESTAMP}"
else
    echo "nais.component.eventtags.component.${COMPONENT} 1 ${TIMESTAMP}"
fi