#!/bin/bash

echo "####################################################"
echo "##                                                ##"
echo "##          Custom configuration script           ##"
echo "##                                                ##"
echo "####################################################"

echo "#### The config dir locates at ${CONFIG_INSTANCE_DIR} ####"
ls ${CONFIG_INSTANCE_DIR}

echo "#### checkout remote configuration repo ####"
mkdir /tmp/config-repo/
git clone https://github.com/ryanezil/amq7-operator-custominit.git /tmp/config-repo


echo "#### Copying user configuration files to ${CONFIG_INSTANCE_DIR}/etc ####"
cp /tmp/config-repo/custom-config-files/artemis-users.properties ${CONFIG_INSTANCE_DIR}/etc
cp /tmp/config-repo/custom-config-files/artemis-roles.properties ${CONFIG_INSTANCE_DIR}/etc

echo "#### Custom config done. ####"
