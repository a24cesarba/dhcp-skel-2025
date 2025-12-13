#!/bin/bash

echo 1 | tee /proc/sys/net/ipv4/ip_forward

nft list tables | grep -q '^table ip nat$' || nft add table ip nat

# Crear chain postrouting se non existe
nft list chain ip nat POSTROUTING > /dev/null 2>&1 || \
  nft 'add chain ip nat POSTROUTING { type nat hook postrouting priority 100; policy accept}'

# Agregar regra de masquerade

nft list ruleset | grep -q 'oifname "eth0" masquerade' || \
  nft add rule ip nat POSTROUTING oifname "eth0" masquerade 

ip addr add 192.168.10.253/24 dev eth1
ip addr add 192.168.10.252/24 dev eth1

# Manter o contenedor vivo

dhcp-heper -s 192.168.10.10 -i eth2 -i eth3 -d