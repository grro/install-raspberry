#!/bin/bash


if grep -q /etc/baup/backup.sh "/var/spool/cron/crontabs/root";
then
    echo ""
    echo "++++++++++"
    echo "+ crontab is already updated "
else
    echo ""
    echo "++++++++++"
    echo "+ perform crontab update "
    sudo cp /var/spool/cron/crontabs/root root.tmp
    echo " " >> root.tmp
    echo "# restart each sunday morning" >> root.tmp
    echo "02 23 * * Sun /sbin/shutdown -r" >> root.tmp
    echo "" >> root.tmp
    echo "# weekly backup - each week on wednesday 19:05" >> root.tmp
    echo "05 19 * * 3 /etc/openhab/exec/backup.sh" >> root.tmp
    sudo mv root.tmp /var/spool/cron/crontabs/root
fi








