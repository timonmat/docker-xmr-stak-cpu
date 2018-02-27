#!/bin/ash

set -x

if [ -z "${CORES}" ]; then
export CORES=`grep -c processor /proc/cpuinfo`
fi

export AUTO_CONFIGURATION=$(/app/xmr-stak | grep "low_power_mode")

envtpl /app/xmr-stak-cpu.config.tpl -o /app/config.txt --allow-missing --keep-template
envtpl /app/xmr-stak-cpu.cpu.tpl -o /app/cpu.txt --allow-missing --keep-template

if [ "$1" = 'xmr-stak-cpu' ]; then
    exec /app/xmr-stak --cpu cpu.txt
fi

exec "$@"
