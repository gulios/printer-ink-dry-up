#!/usr/bin/env bash
########################################################################################################################
### Artur 'Gulios' Milkowski <gulios@gulios.pl>#########################################################################
########################################################################################################################

### example cron every one hour an checking 15 days from last print:
### every one hour because i don't have PC running all the time.
### ### 15days -> 60*60*24*15  = 1296000
# crontab -e
### 0 * * * * (cd PATH_TO_FILES; sh print.sh 1296000 GuliosPrinter)

if [ -z "$1" ]; then
    echo 'Please set first parameter period time in seconds e.g "sh print.sh 86400". It prints one time every 24 hours.';
    exit;
fi

if [ -z "$2" ]; then
    echo 'Please set second parameter printer name "sh print.sh 86400 GuliosPrinter"';
    exit;
fi
########################################################################################################################
periodTime=$1;
printer=$2;
file2print='test.pdf';
logFile='printing_automation.log';
currentTimestamp=$(date +%s);
########################################################################################################################
### If there is no log, just print it
if [ ! -f $logFile ]; then
	echo $currentTimestamp > $logFile
fi
########################################################################################################################
### Checking seconds from last printing.
logTime=$(head $logFile);
count="$((currentTimestamp - logTime))";

if [ $count -gt $periodTime ]; then
    ### print example file
	lp -d $printer -o media=A4 $file2print
	
	### adding current timestamp to log
	echo $currentTimestamp > $logFile
fi
########################################################################################################################