
#!/usr/bin/bash

set -x
SYSTEM_DEFS_FILE=$(ls ${SYSTEM_DEFS_DIR}/${SYSTEM_NAME}.y*)
COMPONENT_NAME=$(basename ${WORKING_DIR})
CODEBASE=$(yq e ".components[] | select(.repo == \"${COMPONENT_NAME}\") | .codebase" ${SYSTEM_DEFS_FILE})
echo "CODEBASE=${CODEBASE}" >> ${GITHUB_ENV}


OVERRIDE_PREFIX=__overrides_

YQ_EXPR=".components[] | select(.repo == \"${COMPONENT_NAME}\") | .overrides | to_entries | .[] | \
         \"${OVERRIDE_PREFIX}\" + .key + \"=\" + (.value | ..style=\"single\")"

eval $(yq e ${YQ_EXPR} ${SYSTEM_DEFS_FILE})
unset YQ_EXPR

for VAR in $(set | grep ${OVERRIDE_PREFIX})
do
    echo "${VAR}" >> ${GITHUB_ENV}
done

set +x