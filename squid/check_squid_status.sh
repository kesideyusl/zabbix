#########################################################################
# File Name: check_squid_status.sh
# Author: kerncai
# mail: kernkerncai@gmail.com
# Created Time: 2013年11月12日 星期二 10时30分05秒
#########################################################################
#!/bin/bash

/usr/local/squid-2.7/bin/squidclient -h localhost -p 3128 mgr:info > /var/log/squid.txt

five_min(){
/usr/local/squid-2.7/bin/squidclient -h localhost -p 3128 mgr:info |grep 'Request Hit Ratios:' |awk '{print$5/100}'
}

six_min(){
/usr/local/squid-2.7/bin/squidclient -h localhost -p 3128 mgr:info |grep 'Request Hit Ratios:' |awk '{print$7/100}'
}

objects(){
/usr/local/squid-2.7/bin/squidclient -h localhost -p 3128 mgr:info |grep 'on-disk objects' |awk '{print$1}'
}

space(){
cat /var/log/squid.txt |grep 'Filesystem Space in use:'|awk -F '/' '{print$1}'|awk '{print$5}'
}

$1
