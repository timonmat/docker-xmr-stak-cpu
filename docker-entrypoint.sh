#!/bin/bash 

if [ "$1" = '/app/xmr-stak-cpu' ]; then
    export AUTO_CONFIGURATION=$(/app/xmr-stak-cpu | grep "low_power_mode")
    envtpl xmr-stak-cpu.conf.tpl -o xmr-stak-cpu.conf --allow-missing --keep-template
    exec /app/xmr-stak-cpu /app/xmr-stak-cpu.conf
fi

exec "$@"
