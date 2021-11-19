
#!/usr/bin/bash

set -x
SYSTEM_DEFS_FILE=$(ls ${SYSTEM_DEFS_DIR}/${SYSTEM_NAME}.y*)
COMPONENT_NAME=$(basename ${WORKING_DIR})
CODEBASE=$(yq e ".components[] | select(.repo == \"${COMPONENT_NAME}\") | .codebase" ${SYSTEM_DEFS_FILE})
echo "CODEBASE=${CODEBASE}" >> ${GITHUB_ENV}
set +x