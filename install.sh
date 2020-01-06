#!/bin/bash

#############################################################
# A simple script to run when with a new install of Kali.
# This will install some additional tools for CTFs or
# engagments.
#
# Twitter: Lovecore_FGC
#
# v-20200106
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

# Install full Kali toolset Install Atom Install terminator
echo ""
echo -e "\e[1;33m Installing Terminator... \ep[0mBold"
echo -e "\e[1;33m Installing Atom code editor...  \e[0mBold"
echo -e "\e[1;32m Installing full Kali toolset... \e[0mBold"
apt install kali-linux-full atom terminator grc xclip ufw -y

############## Start static file things #####################
# Get nc static binaries
echo ""
echo -e "\e[1;33m Getting Netcat static binaries \e[0m"
wget https://eternallybored.org/misc/netcat/netcat-win32-1.12.zip
unzip -j -o netcat-win32-1.12.zip "nc64.exe" "nc.exe" -d . && rm -rf netcat-win32-1.12.zip

# Get Pspy
echo ""
echo -e "\e[1;33m Getting Pspy...\e[0m"
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy64
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy32

# Get Sysinternals Suite
echo ""
echo -e "\e[1;33m Getting Sysinternals... \e[0m"
wget https://download.sysinternals.com/files/SysinternalsSuite.zip
mkdir Sysinternals
unzip -o SysinternalsSuite.zip -d /root/Tools/Sysinternals && rm -rf SysinternalsSuite.zip

# Get Ghidra
echo ""
echo -e "\e[1;33m Getting Ghidra v9.1.1... \e[0m"
wget https://ghidra-sre.org/ghidra_9.1.1_PUBLIC_20191218.zip
unzip -o ghidra_9.1.1_PUBLIC_20191218.zip && rm -rf ghidra_9.1.1_PUBLIC_20191218.zip
echo "alias ghidra=\"~/Tools/ghidra_9.1.1_PUBLIC/ghidraRun\"" >> ~/.bashrc

# Copy over plink.exe
echo ""
echo -e "\e[1;33m Getting Plink.exe... \e[0m"
cp $(locate plink.exe) .

############## End static file things ####################

############## Start Git things ##########################
# Clone some Repos
echo ""
echo -e "\e[1;32m Cloning Repos...\e[0mBold"

# Get Linpeas suite
echo ""
echo -e "\e[1;33m Getting LinPeas...\e[0m"
git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite

# Get LinEnum
echo ""
echo -e "\e[1;33m Getting LinEnum...\e[0m"
wget https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh

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

# Get Watson
echo ""
echo -e "\e[1;33m Getting Watson... \e[0m"
git clone https://github.com/rasta-mouse/Watson

################ End Git things #########################

################ Misc things ############################
# Install zsh
echo ""
echo -e "\e[1;33m Last step, installing zsh... \e[0mBold"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install ZSH Syntax Highlighting
echo ""
echo -e "\e[1;31m Installing Zsh Plugins... \e[0mBold"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo -e "source \${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
sed -i 's/plugins=(git.*/plugins=(git encode64)/' "~/.zshrc"

# Add aliases
echo ""
echo -e "\e[1;31m Adding Aliases...\e[0mBold"
echo "alias ghidra=\"~/Tools/ghidra_9.1.1_PUBLIC/ghidraRun\"" >> ~/.zshrc
echo "alias simple=\"python -m SimpleHTTPServer 80\"" >> ~/.bashrc
echo "alias simple=\"python -m SimpleHTTPServer 80\"" >> ~/.zshrc
echo "alias tools=\"cd ~/Tools\"" >> ~/.zshrc
echo "alias tools=\"cd ~/Tools\"" >> ~/.bashrc
echo "alias nmap=\"grc nmap\"" >> ~/.bashrc
echo "alias nmap=\"grc nmap\"" >> ~/.zshrc

# Building alias
source ~/.zshrc
source ~/.bashrc
cd ~
