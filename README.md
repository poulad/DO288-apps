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

# Fix "hello-java/Dockerfile" and commit

oc start-build bc/elvis
oc logs bc/elvis -f

sleep 3
oc get pods -l deploymentconfig=elvis
sleep 5
oc logs -f -l deploymentconfig=elvis

oc expose svc/elvis
oc get route/elvis -o jsonpath="{.spec.host}"

curl "elvis-${RHT_OCP4_DEV_USER}-design-container.${RHT_OCP4_WILDCARD_DOMAIN}/api/hello"

# using a configmap
oc create cm appconfig --from-literal APP_MSG="Elvis lives"
oc set env dc/elvis --from cm/appconfig

sleep 7
oc logs -l deploymentconfig=elvis
curl "elvis-${RHT_OCP4_DEV_USER}-design-container.${RHT_OCP4_WILDCARD_DOMAIN}/api/hello"

```