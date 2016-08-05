#!/bin/bash

csv=./ios_$1月开发行数统计.csv
echo "开始统计$1月份每个人的代码行数,并输出到csv中"
rm -rf $csv
#防止csv乱码
printf "\xEF\xBB\xBF" > $csv
echo "$1月份的开发行数,,," >> $csv
echo "姓名,增加的行数,删除的行数,总共" >> $csv
git log --author=weiqing.tang --pretty=tformat: --numstat --since=2016-$1-01 | awk '{add+=$1;del+=$2;total+=$1+$2}END{print "唐伟清,"add,",",del,",",total}' >> $csv
git log --author=zhoujianshun --pretty=tformat: --numstat --since=2016-$1-01 | awk '{add+=$1;del+=$2;total+=$1+$2}END{print "周建顺,"add,",",del,",",total}' >> $csv
git log --author=gxd --pretty=tformat: --numstat --since=2016-$1-01 | awk '{add+=$1;del+=$2;total+=$1+$2}END{print "顾晓东,"add,",",del,",",total}' >> $csv
git log --author=jia --pretty=tformat: --numstat --since=2016-$1-01 | awk '{add+=$1;del+=$2;total+=$1+$2}END{print "刘佳,"add,",",del,",",total}' >> $csv
git log --author=dy --pretty=tformat: --numstat --since=2016-$1-01 | awk '{add+=$1;del+=$2;total+=$1+$2}END{print "丁阳,"add,",",del,",",total}' >> $csv
git log --author=shuai.wang --pretty=tformat: --numstat --since=2016-$1-01 | awk '{add+=$1;del+=$2;total+=$1+$2}END{print "王帅,"add,",",del,",",total}' >> $csv
git log --author=yuchen.li --pretty=tformat: --numstat --since=2016-$1-01 | awk '{add+=$1;del+=$2;total+=$1+$2}END{print "李玉臣,"add,",",del,",",total}' >> $csv
echo "结束统计"
