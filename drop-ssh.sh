#!/bin/bash
IPT=/usr/sbin/iptables
inet_if=eth0
ssh_port=22
$IPT -I INPUT -p tcp --dport ${ssh_port} -i ${inet_if} -m state --state NEW -m recent  --set
$IPT -I INPUT -p tcp --dport ${ssh_port} -i ${inet_if} -m state --state NEW -m recent  --update --seconds 60 --hitcount 5 -j DROP
