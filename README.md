# docker-packer-maas
Build your MAAS images using docker. 

## Requisites

- Docker >= 24.0.2 (this is the tested version, it might work also with previous versions).
- KVM enabled

## Pre-built image

I publish the docker image under my dockerhub account. You can find it [here](https://hub.docker.com/r/r00ta/packer-maas).

## How to use the image

Clone `packer-maas`

```bash
git clone https://github.com/canonical/packer-maas.git
```

The image needs to be run as privileged and must be run on an host with KVM enabled. You can then build, for example, the `centos8-stream` image with the following command

```
docker run --privileged -v $(pwd)/packer-maas:/workspace -w /workspace/centos8-stream -e PACKER_LOG=1 -it r00ta/packer-maas:1.0
```

Note that the command above is mounting `$(pwd)/packer-maas` and then is setting `/workspace/centos8-stream` as working directory. If you wish to build another image, just change this last path accordingly. 
Once the build has completed, you will find the image in the directory `$(pwd)/packer-maas/centos8-stream`.

## Build the image by yourself

You can build the image by yourself by cloning this repository 

```bash
git clone https://github.com/r00ta/docker-packer-maas.git
```

and then by running 

```bash
cd docker-packer-maas/
docker build -t r00ta/packer-maas:1.0 .
```
