# 该脚本使用工具s3-benchmark对kodo s3apiv2接口进行性能测试
# 参考：https://github.com/minio/s3-benchmark

#!/bin/bash

set -o errexit
set -o pipefail

# set env
export PWD=$(dirname "${BASH_SOURCE[0]}")
export WORKSPACE=${PWD}/..
source ${PWD}/util.sh

info "download s3-benchmark tool"
curl -Lo /usr/local/bin/s3-benchmark http://plivx6dnj.bkt.clouddn.com/s3-benchmark && chmod a+x /usr/local/bin/s3-benchmark

info "start performance test with s3-benchmark"
info "Pls monitor service request @ http://prometheus.in.tc.echosoul.cn/graph"
s3-benchmark -a CDF4IkThrImiuLquQWK-XTVqJvbBbYMFBSts370D -s NrgObTdYBZRg0Sf7gQMSGo6hs-jw6Oi55s506Q1b -b s3-benchmark -t 10 -u http://s3.in.tc.echosoul.cn -d 600

info "s3-benchmark test complete!"

