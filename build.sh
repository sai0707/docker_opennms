#!/bin/sh

if [ ! -f OPENNMS-GPG-KEY ]; then
    curl -O http://debian.opennms.org/OPENNMS-GPG-KEY
fi

docker build -t zenlambda/opennms .


