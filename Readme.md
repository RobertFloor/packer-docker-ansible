packer build -var="tag=1.0.0" ubuntu.pkr.hcl

docker build -t amq-base-image .

docker run -v $(pwd)/data:/data --name amq2 amq-base-image

```bash
docker rm amq
ssh-add -D
packer build -var="tag=1.0.2" almalinux.pkr.hcl
docker run -v $(pwd)/data:/data -p 8161:8161 --name amq my-image:1.0.2
```
Urls
localhost:8161
localhost:8161/metrics/