packer build -var="tag=1.0.0" ubuntu.pkr.hcl

docker build -t amq-base-image .

docker run -v $(pwd)/data:/data --name amq2 amq-base-image