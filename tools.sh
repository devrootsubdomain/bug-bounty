
#sublist3r 
git clone https://github.com/aboul3la/Sublist3r.git Sublist3r
cd Sublist3r
sudo pip3 install -r requirements.txt

#subfinder 
go get -u github.com/projectdiscovery/subfinder/cmd/subfinder
#assetfinder
go get -u github.com/tomnomnom/assetfinder
#gospider       
go get -u github.com/jaeles-project/gospider
#findlinux 
wget https://github.com/Edu4rdSHL/findomain/releases/download/2.1.1/findomain-linux
#gitsub 
wget https://raw.githubusercontent.com/gwen001/github-search/master/github-subdomains.py

#nuclei 
git clone https://github.com/projectdiscovery/nuclei.git; cd nuclei/cmd/nuclei/; go build; mv nuclei /usr/local/bin/; nuclei -h
nuclei -update-templates

#httpx 

GO111MODULE=auto go get -u -v github.com/projectdiscovery/httpx/cmd/httpx

#anew 
go get -u github.com/tomnomnom/anew
#waybaskurls 
go get github.com/tomnomnom/waybackurls

