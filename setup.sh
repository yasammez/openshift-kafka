#!/bin/bash

#oc process -f templates/pvc.json | oc create -f-

oc process -f templates/ellie.json | oc create -f-
oc process -f templates/valli.json | oc create -f-
oc process -f templates/ottla.json | oc create -f-

oc patch svc ellie -p '{"spec":{"externalIPs":["10.237.233.10"]}}'
oc patch svc valli -p '{"spec":{"externalIPs":["10.237.233.10"]}}'
oc patch svc ottla -p '{"spec":{"externalIPs":["10.237.233.10"]}}'

oc expose svc ellie
oc expose svc valli
oc expose svc ottla
