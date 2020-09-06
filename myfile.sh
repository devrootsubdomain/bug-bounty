#!/bin/bash

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
BLUE=$(tput setaf 4)
RESET=$(tput sgr0)

AMASS_VERSION=3.8.2


echo "${RED} ######################################################### ${RESET}"
echo "${RED} #                 TOOLS FOR BUG BOUNTY                  # ${RESET}"
echo "${RED} ######################################################### ${RESET}"
logo(){
echo "${BLUE}
                ___ ___ _  _ _____     ___
               | _ ) _ ) || |_   _|_ _|_  )
               | _ \ _ \ __ | | | \ V // /
               |___/___/_||_| |_|  \_//___| ${RESET}"
}
logo
echo ""
echo "${GREEN} Tools created by the best people in the InfoSec Community ${RESET}"
echo "${GREEN}                   Thanks to everyone!                     ${RESET}"
echo ""


echo "${GREEN} [+] Updating and installing dependencies ${RESET}"
echo ""

sudo apt-get -y update
sudo apt-get -y upgrade

sudo add-apt-repository -y ppa:apt-fast/stable < /dev/null
sudo echo debconf apt-fast/maxdownloads string 16 | debconf-set-selections
sudo echo debconf apt-fast/dlflag boolean true | debconf-set-selections
sudo echo debconf apt-fast/aptmanager string apt-get | debconf-set-selections
sudo apt install -y apt-fast

sudo apt-fast install -y apt-transport-https
sudo apt-fast install -y libcurl4-openssl-dev
sudo apt-fast install -y libssl-dev
sudo apt-fast install -y jq
sudo apt-fast install -y ruby-full
sudo apt-fast install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
sudo apt-fast install -y build-essential libssl-dev libffi-dev python-dev
sudo apt-fast install -y python-setuptools
sudo apt-fast install -y libldns-dev
sudo apt-fast install -y python3-pip
sudo apt-fast install -y python-dnspython
sudo apt-fast install -y git
sudo apt-fast install -y npm
sudo apt-fast install -y nmap phantomjs 
sudo apt-fast install -y gem
sudo apt-fast install -y perl 
sudo apt-fast install -y parallel
sudo apt-fast install -y 
pip3 install jsbeautifier
echo ""
echo ""
sar 1 1 >/dev/null

#Setting shell functions/aliases
echo "${GREEN} [+] Setting bash_profile aliases ${RESET}"
curl https://raw.githubusercontent.com/unethicalnoob/aliases/master/bashprofile > ~/.bash_profile
echo "${BLUE} If it doesn't work, set it manually ${RESET}"
echo ""
echo ""
sar 1 1 >/dev/null 

echo "${GREEN} [+] Installing Golang ${RESET}"
if [ ! -f /usr/bin/go ];then
    cd ~
    wget -q -O - https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh | bash
	export GOROOT=$HOME/.go
	export PATH=$GOROOT/bin:$PATH
	export GOPATH=$HOME/go
    echo 'export GOROOT=$HOME/.go' >> ~/.bash_profile
	
	echo 'export GOPATH=$HOME/go'	>> ~/.bash_profile			
	echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile
    source ~/.bash_profile 
else 
    echo "${BLUE} Golang is already installed${RESET}"
fi
    break
echo""
echo "${BLUE} Done Install Golang ${RESET}"
echo ""
echo ""
sar 1 1 >/dev/null
#sublist3r 
git clone https://github.com/aboul3la/Sublist3r.git ~/tools/Sublist3r
cd ~/tools/Sublist3r
sudo pip3 install -r requirements.txt
python3 setup.py install

cd ~
wget https://github.com/s0md3v/XSStrike/archive/3.1.5.zip
unzip 3.1.5.zip  & cd XSStrike-3.1.5/
python3  xsstrike.py 
cd ~ 

pip3 install colored  tldextract argparse requests texttable keyboard tldextract termcolor colored goop lockfile Unidecode


#subfinder 
go get -u github.com/projectdiscovery/subfinder/cmd/subfinder
#assetfinder
go get -u github.com/tomnomnom/assetfinder
#gospider       
go get -u github.com/jaeles-project/gospider
#hakrawler
go get github.com/hakluke/hakrawler
alias hakrawler='~/go/bin/hakrawler'

#subrake
pip3 install subrake
#ffuf
go get github.com/ffuf/ffuf
#findlinux 
wget https://github.com/Edu4rdSHL/findomain/releases/download/2.1.1/findomain-linux
chmod +x findomain-linux
mv findomain-linux /usr/bin/findomain

#gitsub 
wget https://raw.githubusercontent.com/gwen001/github-search/master/github-subdomains.py
chmod +x github-subdomains.py
mv github-subdomains.py /usr/bin/gitsub

#httpx 
go get -u -v github.com/projectdiscovery/httpx/cmd/httpx
#anew 
go get -u github.com/tomnomnom/anew
#waybaskurls 
go get github.com/tomnomnom/waybackurls
#gobuster
go get -u github.com/OJ/gobuster
#wfuzz
apt-fast install wfuzz
#aquatone
go get -u github.com/michenriksen/aquatone 
#massdsns
git clone https://github.com/blechschmidt/massdns.git ~/tools/massdns
cd ~/tools/massdns
make 
cd 
#Subover
go get -u github.com/Ice3man543/SubOver

 
cd ~/
echo "${GREEN} #### Downloading wordlists #### ${RESET}"
git clone https://github.com/assetnote/commonspeak2-wordlists ~/tools/Wordlists/commonspeak2-wordlists
git clone https://github.com/fuzzdb-project/fuzzdb ~/tools/Wordlists/fuzzdb
git clone https://github.com/1N3/IntruderPayloads ~/tools/Wordlists/IntruderPayloads
git clone https://github.com/swisskyrepo/PayloadsAllTheThings ~/tools/Wordlists/PayloadsAllTheThings
git clone https://github.com/danielmiessler/SecLists ~/tools/Wordlists/SecLists
cd ~/tools/Wordlists/SecLists/Discovery/DNS/
##THIS FILE BREAKS MASSDNS AND NEEDS TO BE CLEANED
cat dns-Jhaddix.txt | head -n -14 > clean-jhaddix-dns.txt
printf "${BLUE} Wordlists downloaded ${RESET}"


#subfinder 
go get -u github.com/projectdiscovery/subfinder/cmd/subfinder
#assetfinder
go get -u github.com/tomnomnom/assetfinder
#gospider       
go get -u github.com/jaeles-project/gospider

#nuclei 
git clone https://github.com/projectdiscovery/nuclei.git; cd nuclei/cmd/nuclei/; go build; mv nuclei /usr/local/bin/; nuclei -update-templates;  
cd ~/ && mkdir ~/all/ 

cp ~/nuclei-templates/*/*.yaml ~/all/ 
cd ~/
rm ~/nuclei-templates -r 
rm ~/all/basic-cors-flash.yaml ~/all/missing-x-frame-options.yaml ~/all/tech-detect.yaml ~/all/security.txt.yaml ~/all/favicon-detection.yaml ~/all/robots.txt.yaml

cd ~/

mkdir test && cd test ; wget https://raw.githubusercontent.com/devrootsubdomain/bug-bounty/master/subdomain.sh


