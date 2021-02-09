# Red Hat AMQ

## Customize IMAGE

**Remember** to include customization done in AMQ 6.3 for max-open-files.

To examine the base image, you can run a POD locally to analyze the image filesystem:

```bash
$ podman run --name amq -it registry.redhat.io/amq7/amq-broker:7.8 bash
```

### Build Image Dockerfile strategy

```bash

$ oc new-project amq-operator

$ oc new-build registry.redhat.io/amq7/amq-broker:7.8-11~. \
    --strategy=docker \
    --name=custom-amq-operator-broker \
    --to=custom-amq-broker:1.0.0-ocp-7.8.11 \
    -n $(oc project -q)


$ oc start-build custom-amq-operator-broker --from-dir=. -n $(oc project -q)



# Tagging if needed
$ oc tag custom-amq-broker:1.0.0-ocp-7.8.11 custom-amq-broker:0.0.1-ocp-7.8:latest -n $(oc project -q)

# Cleaning images...
$ oc adm prune images --registry-url=https://image-registry-openshift-image-registry.apps.amqstreams.sandbox1409.opentlc.com --confirm

```



### Build Image S2I approach (DELETE THIS SECTION)

The file 'assemble' inside directory '.s2i/bin' is the following:
```
#!/bin/sh

if [ "${SCRIPT_DEBUG}" = "true" ] ; then
    set -x
    echo "Script debugging is enabled, allowing bash commands and their arguments to be printed as they are executed"
fi

SRCBIN=/tmp/src/bin

if [ -d ${SRCBIN} ]; then
  echo "Copying custom scripts from project to new custom image..."
  chmod -v u=rwx,g=rwx,o=rx ${SRCBIN}/*.sh
  cp -v ${SRCBIN}/*.sh $AMQ_HOME/bin/
fi

# Cleaning working dir
rm -vrf /tmp/src

exit 0
```

Run S2I:

```bash
$ oc new-build registry.redhat.io/amq7/amq-broker:7.8-11~. \
    --name=custom-amq-s2i-broker \
    --to=custom-amq-broker:0.0.3-ocp-7.8.11 \
    -n $(oc project -q)

$ oc start-build custom-amq-s2i-broker --from-dir=. -n $(oc project -q)
```
but it fails:

```bash
STEP 9: RUN /tmp/scripts/assemble
Copying custom scripts from project to new custom image...
mode of '/tmp/src/bin/configure_custom_config.sh' retained as 0775 (rwxrwxr-x)
'/tmp/src/bin/configure_custom_config.sh' -> '/opt/amq/bin/configure_custom_config.sh'
cp: cannot create regular file '/opt/amq/bin/configure_custom_config.sh': Permission denied
```



