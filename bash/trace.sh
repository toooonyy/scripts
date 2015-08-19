#!/usr/bin/env bash
# this use ip.cn

ip=`mtr -rn $1 -c 1|awk '$2 ~ "[12]?[0-9]?[0-9]\.[12]?[0-9]?[0-9]\.[12]?[0-9]?[0-9]\.[12]?[0-9]?[0-9]"{print $2}'`

for i in $ip
do
    echo -e $i'\t\t\c'
    curl -s "http://ip.cn/index.php?ip="$i | awk -F "来自：" '{print $2}'
done 
