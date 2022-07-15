#/bin/bash
# Copyright (c) Alexander B. Prokopyev, 2022 \n

while true; do
  echo $(date +"%T") $(cat /proc/loadavg);
  sleep 5s;
done;
