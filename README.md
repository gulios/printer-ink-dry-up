Printer ink dry up ?
===========

This is simple bash script to print test page via cron job with all colors to prevent cartridges from drying out.
I don't use printer a lot so ink dried up in my last one so i had to buy another one(cleaning didn't work for me).

That's why i wrote this piece of code to print test page every 15 days(you can change it via firs parameter).


#### Installation
* pull repo
* check your printer name(needed for second parameter PrinterName)

<pre>
lpstat -p
</pre>

* edit crontab
<pre>

crontab -e

#and paste

0 * * * * (cd /path/to/project/printer-ink-dry-up; sh print.sh 1296000 PrinterName)

</pre>

* save cron job

Cron running every hour and check 'printing_automation.log' for last printed time.



