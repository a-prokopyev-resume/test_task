#!/bin/bash

#=====begin of copyright notice=====
copyright()
{
        echo -e "
        
        The AUTHOR of this file is Alexander Borisovich Prokopyev, Kurgan, Russia \n
        Contact: a.prokopyev.net at gmail.com \n
         
        Copyright (c) Alexander B. Prokopyev, 2022 \n
 
        All materials contained in this file are protected by copyright law. \n
        Nobody except the AUTHOR may alter or remove this copyright notice from copies of the content. \n
         
        The AUTHOR allows to use this content under AGPL v3 license:
        http://opensource.org/licenses/agpl-v3.html
        
        ";
}

#copyright;
#=====end of copyright notice=====

# Before using script you have to install num-utils package.

at_position()
{
	let Position=$1-1;
	perl -lane 'print $F['$Position']';
}

method1()
{
	local TotalSize=$(numsum $SizeListFN);
	local FileCount=$(cat $SizeListFN | wc -l);
	
	local AverageSize=$(( TotalSize/FileCount ));
	echo "Average file size by method1: $AverageSize";
}

method2()
{
	local AverageSize=$(numaverage $SizeListFN);
	echo "Average file size by method2: $AverageSize";
	
	# Following is just for example, not used anymore
	#local TotalSize=$(cat $SizeListFN | paste -sd+ - | bc);
}

#set -x;

Dir=$1;
if [[ ! -d $Dir ]]; then
	echo "Directory $Dir does not exist!";
	exit 1;
fi;

SizeListFN=$(mktemp --dry-run);
#set +x; # disable debug to avoid tracking large amount of files
stat -c '%F %s' $Dir/* | grep reg | at_position 3 > $SizeListFN;
#set -x;

method1;
method2;

rm -f $SizeListFN;
