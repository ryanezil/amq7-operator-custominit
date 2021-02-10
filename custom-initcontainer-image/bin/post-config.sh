#!/bin/bash

echo "####################################################"
echo "##                                                ##"
echo "##          Custom configuration script           ##"
echo "##                                                ##"
echo "####################################################"

echo "#### The config dir locates at ${CONFIG_INSTANCE_DIR} ####"
ls ${CONFIG_INSTANCE_DIR}

echo "#### checkout remote configuration repo ####"
git --version

# Username and email set to avoid errors due to old GIT versions.
git config --global user.name "Username set to avoid git bug"
git config --global user.email "username@initcontainer.zyx"
mkdir /tmp/config-repo/
git clone https://github.com/ryanezil/amq7-operator-custominit.git /tmp/config-repo


echo "#### Copying user configuration files to ${CONFIG_INSTANCE_DIR}/etc ####"
cp /tmp/config-repo/custom-initcontainer-image/custom-config-files/artemis-users.properties ${CONFIG_INSTANCE_DIR}/etc
cp /tmp/config-repo/custom-initcontainer-image/custom-config-files/artemis-roles.properties ${CONFIG_INSTANCE_DIR}/etc

echo "#### Custom config done. ####"
