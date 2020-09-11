source .env.tmp

oc delete project --all --wait

oc new-project ${RHT_OCP4_DEV_USER}-source-build

oc new-app --as-deployment-config --name greet --build-env npm_config_registry="http://${RHT_OCP4_NEXUS_SERVER}/repository/nodejs" nodejs:12~https://github.com/${RHT_OCP4_GITHUB_USER}/DO288-apps#source-build --context-dir nodejs-helloworld
