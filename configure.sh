#!/bin/sh

#Configure Datasources
echo Configuring Datasouces...
augtool -LA -e <<EOF
set /augeas/load/Xml/lens Xml.lns
set /augeas/load/Xml/incl[2] /etc/opennms/opennms-datasources.xml
load
defvar dsconfig "/files/etc/opennms/opennms-datasources.xml/datasource-configuration"
defvar opennmsds "\$dsconfig/jdbc-data-source[#attribute/name='opennms']"
defvar adminds "\$dsconfig/jdbc-data-source[#attribute/name='opennms-admin']"
set \$opennmsds/#attribute/url "jdbc:postgresql://$POSTGRES_PORT_5432_TCP_ADDR:$POSTGRES_PORT_5432_TCP_PORT/opennms"
set \$adminds/#attribute/url "jdbc:postgresql://$POSTGRES_PORT_5432_TCP_ADDR:$POSTGRES_PORT_5432_TCP_PORT/template1"
save
EOF

