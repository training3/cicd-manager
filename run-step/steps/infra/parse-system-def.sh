
#!/usr/bin/bash

set -x
SYSTEM_DEFS_FILE=$(ls ${SYSTEM_DEFS_DIR}/${SYSTEM_NAME}.y*)

COMPONENT_NAME=$(basename ${WORKING_DIR})
echo "COMPONENT_NAME=${COMPONENT_NAME}" >> ${GITHUB_ENV}

CODEBASE=$(yq e ".components[] | select(.repo == \"${COMPONENT_NAME}\") | .codebase" ${SYSTEM_DEFS_FILE})
echo "CODEBASE=${CODEBASE}" >> ${GITHUB_ENV}

OVERRIDES=$(yq e ".components[] | select(.repo == \"${COMPONENT_NAME}\") | .overrides" ${SYSTEM_DEFS_FILE})
echo "OVERRIDES=${OVERRIDES}" >> ${GITHUB_ENV}

set +x