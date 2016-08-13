#!/usr/bin/env python3
# -* - coding: UTF-8 -* -

import sys
from subprocess import call
import itertools
import requests
from bs4 import BeautifulSoup

call("sudo mtr -rn " + sys.argv[1] + """ -c 3 | awk '$2 ~ "[12]?[0-9]?[0-9]\.[12]?[0-9]?[0-9]\.[12]?[0-9]?[0-9]\.[12]?[0-9]?[0-9]"{print $2}' > /tmp/geoip""", shell=True)


def get_ip_from_ipcn(ip):
    r = requests.get('http://ip.cn/index.php?ip=' + ip)
    soup = BeautifulSoup(r.text, "html.parser")
    address = [x.string for x in soup.findAll("code")][1]
    return address


def get_ip_from_ipipnet(ip):
    r = requests.get('http://freeapi.ipip.net/' + ip)
    address = ' '.join(x for x in filter(None, eval(r.text)))
    return address

with open('/tmp/geoip', 'r') as f:
    ip_address = f.read().splitlines()

table_list = [[x, get_ip_from_ipcn(x), get_ip_from_ipipnet(x)] for x in ip_address]
max_wide = max([len(x) for x in list(itertools.chain(*table_list))]) + 1

for row in table_list:
    print("{:<{width}}{:<{width}}{:<{width}}".format(*row, width=max_wide))
