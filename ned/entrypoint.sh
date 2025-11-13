#!/bin/bash

ip route del default via 192.168.10.1
ip route add default via 192.168.10.254

kea-dhcp4 -c /etc/kea/kea-dhcp4.conf -d