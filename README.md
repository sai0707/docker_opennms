# Docker OpenNMS

A Dockerfile for building an OpenNMS docker container.

The images are host on [dockerhub](https://registry.hub.docker.com/u/zenlambda/opennms/).

# Building

Run ./build.sh.

# Running

First kick off a PostgreSQL server:

  docker run --name opennms-postgres -d postgres

Then setup up the database (you only need to do this once!):

  docker run -P --link=opennms-postgres:postgres -d zenlambda/opennms /dockerexec/install

Then run the server:

  docker run -P --link=opennms-postgres:postgres -d zenlambda/opennms /dockerexec/install

