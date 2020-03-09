# 该脚本通过获取prometheus的alert告警判断

#!/bin/bash

set -o errexit
set -o pipefail

# set env
export PWD=$(dirname "${BASH_SOURCE[0]}")
export WORKSPACE=${PWD}/..
source ${PWD}/util.sh
ALERT_NAME=$1
result=0

info "check prometheus alert"
curl -s http://prometheus.in.tc.echosoul.cn/api/v1/alerts | grep ${ALERT_NAME} || result=$?
if [[ ${result} -gt 0 ]]; then
    err "prometheus get alter from ${ALERT_NAME}, KODO-chaos test failed!"
fi


