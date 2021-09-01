# EKS Cluster

This is EKS cluster with manifests of simple go application

## Apply IaaS

```bash
cd Iaac
terraform plan
terraform apply
```

## Usage

```bash
kubectl create -f Manifests/.
```

## Delete Manifests

```bash
kubectl delete -f Manifests/.
```

## Helm Usage

```bash
cd Helm
helm install release1 GoApp
```

## Helm Destory 

```bash
cd Helm
helm delete release1
```

## Destory IaaS

```bash
cd Iaac
terraform destory
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.
