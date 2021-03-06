#!/usr/bin/env bash

if [ -z "${1}" ]; then
  app="server"
else
  app="${1}"
fi

set -eu -o pipefail

./bin/tf_complete_build.sh "${app}"

if [ "${app}" == "provider-tests" ]; then
 cd terraform-provider-todo
 make testacc TEST=./todo
fi
