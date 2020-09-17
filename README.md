# DO288 Containerized Example Applications

This repository contains a collection of sample containerized applications.  To complete the course you need to fork this repo into your personal Github account.

```bash
# login
source .env.tmp

oc delete project --all
oc new-project "${RHT_OCP4_DEV_USER}-design-container"

oc new-app "https://github.com/${RHT_OCP4_GITHUB_USER}/DO288-apps#design-container" --name elvis --as-deployment-config --context-dir hello-java

sleep 3
oc logs bc/elvis -f

sleep 3
oc get pods -l deploymentconfig=elvis
oc logs -f -l deploymentconfig=elvis
```