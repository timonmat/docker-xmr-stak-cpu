#!/bin/bash 
set -x

if [ -z "${CORES}" ]; then
export CORES=`grep -c processor /proc/cpuinfo`
fi

export AUTO_CONFIGURATION=$(/app/xmr-stak-cpu | grep "low_power_mode")

envtpl /app/xmr-stak-cpu.conf.tpl -o /app/xmr-stak-cpu.conf --allow-missing --keep-template

if [ "$1" = 'xmr-stak-cpu' ]; then
    exec /app/xmr-stak-cpu /app/xmr-stak-cpu.conf
fi

exec "$@"
