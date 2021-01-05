#! /bin/bash

ls=`ls |grep -E "jpg|JPG|png"`
count=`ls |grep -cE "jpg|JPG|png"`
c=0

echo "Do skonwertowania $count pliki"
for i in $ls
do
	convert $i -sampling-factor 4:2:0 -strip -quality 85 -interlace JPEG -colorspace RGB $i 

    	let c=$c+1
    	echo -n -e "skonwertowane $c - $count \r"
done
