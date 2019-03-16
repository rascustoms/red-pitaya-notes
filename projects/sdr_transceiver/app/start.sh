#! /bin/sh

apps_dir=/media/mmcblk0p1/apps

source $apps_dir/stop.sh

cat $apps_dir/sdr_transceiver/sdr_transceiver.bit > /dev/xdevcfg

$apps_dir/sdr_transceiver/sdr-transceiver 1 &
echo $! > ~/server_1.pid
$apps_dir/sdr_transceiver/sdr-transceiver 2 &
echo $! > ~/server_2.pid
avahi-publish-service sdr-transceiver-$(hostname)-1 _redpitayasdr._tcp 1001 "Red Pitaya SDR Transciever Port 1" &
echo $! > ~/avahi_1.pid
avahi-publish-service sdr-transceiver-$(hostname)-2 _redpitayasdr._tcp 1002 "Red Pitaya SDR Transceiver Port 2" &
echo $! > ~/avahi_2.pid