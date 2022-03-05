#!/bin/bash

#============================== The Beginning of the Copyright Notice =====================================================================
# The AUTHOR of this file is Alexander Borisovich Prokopyev, Kurgan, Russia
# https://career.habr.com/alexander-prokopyev
# Contact: a.prokopyev.resume at gmail.com
# Copyright (c) Alexander B. Prokopyev, 2022
# 
# All materials contained in this file are protected by copyright law.
# Nobody except the AUTHOR may alter or remove this copyright notice from copies of the content.
#
# The AUTHOR allows to use this content under AGPL v3 license: http://opensource.org/licenses/agpl-v3.html
#================================= The End of the Copyright Notice ========================================================================

# Example: ./test.sh --prfx=192.168 --iface=eth2 --cnt=3

# Source code location: https://gitlab.mbedsys.org/mbedsys/bashopts/-/blob/master/bashopts.sh
source /utils/dev/bashopts.sh; # shall be placed here in advance for example by wget

trap 'bashopts_exit_handle' ERR;
bashopts_setup -n "test.sh" -d "Home work task";
	bashopts_declare -n PREFIX -l prfx -o p -d "Subnet like 192.168 part from 192.168.x.x" -t string -r; # -v NOT_SET
	bashopts_declare -n INTERFACE -l iface -o i -d "Network interface name like eth0" -t string -r;
	bashopts_declare -n COUNT -l cnt -o c -d "Count of how many arp pings shall be done" -t number -r;
bashopts_parse_args "$@"; bashopts_process_opts;

set -x;

for SUBNET in {1..255}; do
	for HOST in {1..255}; do
		echo "[*] IP : ${PREFIX}.${SUBNET}.${HOST}";
		arping -c "$COUNT" -I "$INTERFACE" "${PREFIX}.${SUBNET}.${HOST}" || true 2> /dev/null;
		echo test
	done;
done;
