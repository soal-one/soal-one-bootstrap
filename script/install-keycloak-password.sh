#!/usr/bin/env bash

kubectl create secret generic keycloak-admin --from-literal="password=$KEYCLOAK_ADMIN_PW"
