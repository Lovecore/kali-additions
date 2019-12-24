#!/bin/bash

#############################################################
# A simple script to run when with a new install of Kali.
# This will install some additional tools for CTFs.				      
# 	 	 					    
# Twitter: Lovecore_FGC					    
# 							    
# Check for tools dir					    
#############################################################

# Add new repos
# Atom
echo ""
echo -e "\e[1;32m Adding Repos \e[0m"
echo -e "\e[1;32m Adding  Atom code editor repo \e[0m"
wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'

# Make sure we're up to date
echo ""
echo -e "\e[1;32m Making sure everyting is up to date... \e[0m"
apt-get update && apt-get dist-upgrade -y

# Check our directory
if [[ ! -d /root/Tools ]]; then
	echo -e "\e[1;32m Setting up Tools Directory. \e[0m"
	mkdir ~/Tools
fi
cd /root/Tools/

# Install Atom
echo ""
echo -e "\e[1;33m Installing Atom code editor...  \e[0m"
apt install atom -y

# Clone some Repos
echo -e "\e[1;32m Cloning Repos...\e[0m"

# Get Linpeas suite
echo ""
echo -e "\e[1;33m Getting LinPeas...\e[0m"
git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite

# Get LinEnum
echo ""
echo -e "\e[1;33m Getting LinEnum...\e[0m"
wget https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh

# Get Pspy
echo ""
echo -e "\e[1;33m Getting Pspy...\e[0m"
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy64
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy32

# John tools (ssh2john)
echo ""
echo -e "\e[1;33m Getting John tools...\e[0m"
git clone https://github.com/koboi137/john

# Get Evil WinRM
echo ""
echo -e "\e[1;33m Getting Evil WinRM...\e[0m"
git clone https://github.com/Hackplayers/evil-winrm

# Get Bloodhound
echo ""
echo -e "\e[1;33m Getting Bloodhound...\e[0m"
git clone https://github.com/adaptivethreat/Bloodhound

# Get Evil-WinRAR
echo ""
echo -e "\e[1;33m Getting Evil WinRar... \e[0m"
git clone https://github.com/manulqwerty/Evil-WinRAR-Gen

# Get patator
echo ""
echo -e "\e[1;33m Getting Patator...  \e[0m"
git clone https://github.com/lanjelot/patator

# Get nc static binaries
echo ""
echo -e "\e[1;33m Getting Netcat static binaries \e[0m"
wget https://eternallybored.org/misc/netcat/netcat-win32-1.12.zip
unzip -j -o netcat-win32-1.12.zip "nc64.exe" "nc.exe" -d . && rm -rf netcat-win32-1.12.zip

# Install zsh
echo ""
echo -e "\e[1;33m Last step, installing zsh... \e[0m"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cd ~
