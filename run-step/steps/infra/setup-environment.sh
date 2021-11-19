
#!/usr/bin/bash

set -x
echo "CICD_REPO_MGR_DIR=${GITHUB_WORKSPACE}/cicd-manager" >> ${GITHUB_ENV}
echo "SYSTEM_DEFS_DIR=${GITHUB_WORKSPACE}/cicd-manager/.github/system-defs" >> ${GITHUB_ENV}
echo "WORKING_DIR=${GITHUB_WORKSPACE}/${GITHUB_REPOSITORY}" >> ${GITHUB_ENV}
set +x

echo ::add-mask::$(cat /var/secrets/PAT_TOKEN)
echo "PAT_TOKEN=$(cat /var/secrets/PAT_TOKEN)" >> ${GITHUB_ENV}