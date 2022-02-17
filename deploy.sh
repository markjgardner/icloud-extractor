#!/bin/bash
kubectl apply -f ./1-secrets.yaml
kubectl apply -f ./2-volumes.yaml
kubectl apply -f ./3-pods.yaml
kubectl exec -it icloudlogin -- icloudpd --username $USERNAME --password $PASSWORD --cookie-directory /cookies --list-albums
kubectl exec -it onedrivelogin -- onedrive
kubectl apply -f ./4-cronjob.yaml