#!/usr/bin/env bash

err() {
  echo -e "[$(date +'%Y-%m-%dT%H:%M:%S.%N%z')] FAIL: $@" >&2
  exit 1
}

info() {
  echo -e "[$(date +'%Y-%m-%dT%H:%M:%S.%N%z')] INFO: $@" >&1
}

warn() {
  echo -e "[$(date +'%Y-%m-%dT%H:%M:%S.%N%z')] WARN: $@" >&2
}
