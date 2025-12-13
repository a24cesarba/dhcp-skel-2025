#!/bin/bash


ip addr del decffault via 192.168.10.1
ip addr del decffault via 192.168.10.254

rm -f /var/run/kea/kea-dhcp4.kea-dhcp4.pid
rm -f /var/run/kea/kea-dhcp-ddns.kea-dhcp-ddns.pid

kea-dhcp4 -c /etc/kea/dhcp4.conf -d #&

# sleep infinity
