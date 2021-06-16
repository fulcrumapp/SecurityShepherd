# Deploy

## Deploy the Persistent Volume Claim
Security Shepherd's mysql database relies on a Persistent Volume Claim so that data will persist between deployments or pod restarts. To deploy the PVC use:
```
helm secrets upgrade -i security-shepherd-pvc ./charts/security-shepherd-pvc
```
To delete use:
```
helm delete security-shepherd-pvc
```
**THIS WILL CLEAR ALL STORED DATA FROM THE DATABASE!!**

## Deploy Security Shepherd
Once the PVC has been deployed, you can deploy Security Shepherd with:
```
helm secrets upgrade -f ./charts/security-shepherd/helm_vars/secrets.chaos.yaml -i security-shepherd ./charts/security-shepherd
```
To delete use:
```
helm delete security-shepherd
```
