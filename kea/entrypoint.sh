#!/bin/bash


ip route del default via 192.168.10.1
ip route del default via 192.168.10.254

rm -f /var/run/kea/kea-dhcp4.kea-dhcp4.pid
rm -f /var/run/kea/kea-dhcp-ddns.kea-dhcp-ddns.pid

kea-dhcp-ddns -d -c /etc/kea/kea-dhcp-ddns.conf  &
kea-dhcp4 -c /etc/kea/kea-dhcp4.conf -d 

# sleep infinity
