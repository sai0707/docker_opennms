#!/bin/sh

/dockerexec/configure

JAVA_CMD=/usr/bin/java
OPENNMS_HOME=/usr/share/opennms
BOOTSTRAP="$OPENNMS_HOME/lib/opennms_bootstrap.jar"
MANAGER_OPTIONS="$MANAGER_OPTIONS -Dopennms.home=$OPENNMS_HOME"
MANAGER_OPTIONS="$MANAGER_OPTIONS -Dcom.sun.management.jmxremote.port=18980"
MANAGER_OPTIONS="$MANAGER_OPTIONS -Dcom.sun.management.jmxremote.ssl=false"
MANAGER_OPTIONS="$MANAGER_OPTIONS -Dcom.sun.management.jmxremote.authenticate=false"
#MANAGER_OPTIONS="$MANAGER_OPTIONS -Xmx${JAVA_HEAP_SIZE}m"
MANAGER_OPTIONS="$MANAGER_OPTIONS -XX:+HeapDumpOnOutOfMemoryError"

APP_VM_PARMS="$MANAGER_OPTIONS"

$JAVA_CMD -Djava.endorsed.dirs=$OPENNMS_HOME/lib/endorsed $APP_VM_PARMS -jar $BOOTSTRAP $APP_PARMS_CONTROLLER start
