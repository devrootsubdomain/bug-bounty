#!/bin/bash
#add in asdasd
#subdomain Finding....
#github key

key='45994bf906d47015e99c9ef0263f9d55430c7fbb'


#echo "########## Enter domain name the"  

mkdir test && cd test 
cp ../file .

while IFS= read -r i 
do 
echo $i

#Sublist3r , Subfinder , assetfinder , findlinux 
mkdir dir_$i && cd dir_$i

sublist3r -d $i -v -o op.txt
subfinder -d $i |tee -a op.txt 
assetfinder --subs-only $i |tee -a op.txt 
findomain-linux -t $i |tee -a op.txt 
gitsub -t $key -d $i |tee -a op.txt 

curl -s https://dns.bufferover.run/dns?q=.$i |jq -r .FDNS_A[] | sed -s 's/,/\n/g' |tee -a op.txt 


echo "Done here "

cat op.txt | sort -u |httpx -timeout 3 --threads 1000 --follow-redirect -slient| anew  $i.txt


nuclei -c 1000 -l $i.txt -t ~/nuclei_all/ -silent  -o $i.final.txt

cd ../

done<$'file'
