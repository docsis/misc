#!/bin/bash

apt-get install ctags cscope vim -y
apt-get install sudo aptitude -y
apt-get install gcc -y

update-alternatives --config editor
visudo

gui () {
apt-get install fonts-wqy-zenhei -y
apt-get install iceweasel
apt-get install lxterminal -y
apt-get install tightvncserver
apt-get install xfce
apt-get install xfonts-wqy -y
apt-get install xorg xdm xfce4
apt-get install xubuntu-desktop
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
pip install pyopenssl ndg-httpsclient pyasn1
pip install requests
apt-get install python-openssl
apt-get install python-pip
apt-get install python-requests
apt-get install python-urllib3
}


