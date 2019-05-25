# Kubernetes - Helm
This is the helm segment in a multipart series about Kubernetes and some of the finer points 
I've learned along the way when using [Kubernetes](https://kubernetes.io/) with 
[Google Cloud Platform](https://cloud.google.com/).

You can read the accompanying post for this folder here: 
[Kubernetes - Helm](https://medium.com/@jonbcampos/).

To run this code here are the quick steps.

### To startup and deploy helm:
```bash
git clone https://github.com/jonbcampos/kubernetes-series.git
cd ~/kubernetes-series/helm/scripts
sh startup.sh
sh add_helm.sh
sh add_redis.sh # add redis
```

### To startup and deploy secure helm:
```bash
git clone https://github.com/jonbcampos/kubernetes-series.git
cd ~/kubernetes-series/helm/scripts
sh startup.sh
sh add_secure_helm.sh
sh add_secure_redis.sh # add redis
```

### To Teardown:
```bash
cd ~/kubernetes-series/helm/scripts # if necessary
sh teardown.sh
```