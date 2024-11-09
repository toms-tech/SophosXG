#!/usr/bin/ash
sysctl -w net.core.rmem_max=7500000
sysctl -w net.core.wmem_max=7500000
ethtool -K Port11 tx off rx off gso off tso off gro off lro off
ethtool -K Port12 tx off rx off gso off tso off gro off lro off
ethtool -K Port11 sg on
ethtool -K Port12 sg on
for i in `ifconfig | grep Link | grep -v inet6 | grep -v lo | awk '{print $1}'`
do
        ifconfig $i txqueuelen 10000
done
echo 1024 > /sys/block/sda/queue/nr_requests
echo noop > /sys/block/sda/queue/scheduler
lcdr=$(/usr/bin/ps | grep -i lcdd | grep -i system | awk '{print $2}')

if [ "$lcdr" == "" ]
then
        lcdr=0
fi

if [[ "$lcdr" -ne 0 ]]
then
        echo "Killing $lcdr ..."
        kill $lcdr
fi
/usr/bin/nohup /usr/bin/lcdd -c /cfs/system/lcd/lcd.conf >/dev/null 2>&1 &
