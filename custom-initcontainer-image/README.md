# Red Hat AMQ - Operator installation

## Customize installation using init-container

To examine the base image for init-container, you can run a POD locally to analyze the image filesystem:

```bash
$ podman run --name amq-init -it quay.io/artemiscloud/activemq-artemis-broker-init:0.2.3 bash
```

### Build Custom Image

```bash

$ oc new-project amq-operator

$ oc new-build quay.io/artemiscloud/activemq-artemis-broker-init:0.2.3~. \
    --strategy=docker \
    --name=custom-activemq-artemis-broker-init \
    --to=custom-activemq-artemis-broker-init:0.0.1-ocp-0.2.3 \
    -n $(oc project -q)

$ oc start-build custom-activemq-artemis-broker-init --from-dir=. -n $(oc project -q)

```
