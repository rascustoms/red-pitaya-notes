#! /bin/sh

kill $(cat ~/server_1.pid) $(cat ~/server_2.pid) $(cat ~/avahi_1.pid) $(cat ~/avahi_2.pid)
