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

# Example: ./test2.sh --iface eth2

# https://gitlab.mbedsys.org/mbedsys/bashopts/-/blob/master/bashopts.sh
source /utils/dev/bashopts.sh;

trap 'bashopts_exit_handle' ERR;
bashopts_setup -n "test.sh" -d "Home work task";
	bashopts_declare -n INTERFACE -l iface -o i -d "Network interface name like eth0" -t string -r;
bashopts_parse_args "$@"; bashopts_process_opts;

PREFIX="192.168" # constant prefix
COUNT=3; # constant amount of pings

./test.sh --prfx=$PREFIX --iface=$INTERFACE --cnt=$COUNT;
