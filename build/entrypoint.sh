#!/bin/bash

echo
echo "Initializing path"
PATH="/usr/local/bin:/usr/bin:/bin"

echo
echo "Substituting environment variables into config file"
envsubst < /autorestic_preconfig.yml > /autorestic.yml

echo
echo "Autorestic check"
autorestic check -c ./autorestic.yml

echo
echo "Running backup on startup"
autorestic backup -c ./autorestic.yml -a

echo
echo "Entering infinite loop"
while true
do
    echo "Running cron."
    $CRON_LOOP_START_HOOK
    autorestic -c ./autorestic.yml --ci cron > /tmp/autorestic.log 2>&1
    $CRON_LOOP_FINISH_HOOK
    echo "Cron finished. Log file:"
    echo $(cat /tmp/autorestic.log)
    rm /tmp/autorestic.log
    echo "Sleeping."
    sleep 15m
done