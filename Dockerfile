FROM ubuntu:14.04

MAINTAINER Frank Wilson <frank@zenlambda.com>

ADD OPENNMS-GPG-KEY /tmp/OPENNMS-GPG-KEY
ADD ./opennms.sources.list /etc/apt/sources.list.d/opennms.list
RUN apt-key add /tmp/OPENNMS-GPG-KEY
RUN apt-get update -y && apt-get install -y \
    openjdk-7-jdk \
    augeas-tools \
    opennms
RUN /usr/share/opennms/bin/runjava -S /usr/bin/java
ADD libraries.properties /etc/opennms/libraries.properties
ADD configure.sh /dockerexec/configure
ADD install.sh /dockerexec/install
ADD run.sh /dockerexec/run

EXPOSE 8980

