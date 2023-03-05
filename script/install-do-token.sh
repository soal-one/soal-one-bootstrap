#!/usr/bin/env bash

kubectl create secret generic do-token --from-literal="DO_TOKEN=$DIGITALOCEAN_ACCESS_TOKEN"
