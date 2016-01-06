# alpine-python

[![Docker Stars](https://img.shields.io/docker/stars/jfloff/sparkit-learn-docker.svg)][hub]
[![Docker Pulls](https://img.shields.io/docker/pulls/jfloff/sparkit-learn-docker.svg)][hub]
[![Docker Layers](https://badge.imagelayers.io/jfloff/sparkit-learn-docker:latest.svg)](https://imagelayers.io/?images=jfloff/sparkit-learn-docker:latest 'Get your own badge on imagelayers.io')

[hub]: https://hub.docker.com/r/jfloff/sparkit-learn-docker/

Docker image to run [sparkit-learn](https://github.com/lensacom/sparkit-learn). This includes installing `spark`, `pyspark`, and respective dependencies.

## Usage
Pull this image with:
```shell
docker pull jfloff/sparkit-learn-docker:latest
```

To run this image, I usually mount my specific application inside the container:
```shell
docker run -it -p 8088:8088 -p 8042:8042 -v "$(pwd)":/home/app -w /home/app -h sandbox jfloff/sparkit-learn bash
```

Extend this images using your custom `Dockerfile`, and build _your_ image:
```shell
docker build --rm=true -t jfloff/sparkit-learn-docker .
```

## License
The code in this repository, unless otherwise noted, is MIT licensed. See the `LICENSE.txt` file in this repository.
