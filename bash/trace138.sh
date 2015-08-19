#!/usr/bin/env bash
# this use ip138.com

ip=`mtr -rn $1 -c 1|awk '$2 ~ "[12]?[0-9]?[0-9]\.[12]?[0-9]?[0-9]\.[12]?[0-9]?[0-9]\.[12]?[0-9]?[0-9]"{print $2}'`

for i in $ip
do
    echo -e $i'\t\t\c'
    curl -s "ip138.com/ips138.asp?ip="$i | iconv -f gbk -t utf-8 | grep class=\"ul1\" |awk -v FS=">" '{print $4}' |awk -v FS="<" '{print $1}'|awk -v FS="：" '{print $2}'
done 
