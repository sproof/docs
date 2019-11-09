
# sproof documentation (sproof-docs) [![Documentation Status](https://readthedocs.org/projects/sproof-docs/badge/?version=latest)](https://sproof-docs.readthedocs.io/en/latest/?badge=latest)

This repository contains the documentation of sproof. It explains how to set up sproof profiles and how to use the sproof docker client and JavaScript API.

## For users (developers and integrators)

A fully formatted version of this documentation can be found on [Read the Docs](https://sproof-docs.readthedocs.io).

## For contributors

The sources for the documentation can be found in the [docs/](docs/) folder. The [Dockerfile](Dockerfile) and the [docker-compose.yml file](docker-compose.yml) in the root directory can be used with [Docker Compose](https://docs.docker.com/compose/) to automatically generate a fully formatted version of the source files while editing. After starting the Docker container with `docker-compose up -d`, the formatted documentation can be accessed with a Web browser at http://localhost:8000/ on the Docker host. It is updated, i.e., regenerated from the source files, on the fly. Please double-check any changes in the fully formatted version before submitting a pull request.
