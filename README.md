# Deploy Red Hat AMQ with custom configuration

This repository is based on:

* https://artemiscloud.github.io/website/blog/initcontainer/
* https://github.com/artemiscloud/artemiscloud-examples/tree/main/operator/init/jdbc


Steps to reproduce:

1. Create custom init container image (see directory ``custom-initcontainer-image```)
2. Deploy ArtemisCloud Operator starting from v0.18.1
3. **Edit** and deploy custom resource ```broker_custom_init.yaml```

