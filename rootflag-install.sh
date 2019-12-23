#!/bin/bash

#############################################################
# A simple Script to get base Kali installs up and running  #
# with some additional tools				    #  
# 	 	 					    #
# Twitter: Lovecore_FGC					    #
# 							    #
# Check for tools dir					    #
#############################################################

# Check our directory
if [[ ! -d /root/Tools ]]; then
	echo -e "\e[1;32m Setting up Tools Directory. \e[0m"
	mkdir ~/Tools
fi
cd /root/Tools/

# Clone some Repos
echo -e "\e[1;32m Cloning Repos...\e[0m"

# Get Linpeas suite
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

# Get Bloodhound
echo ""
echo -e "\e[1;33m Getting Bloodhound...\e[0m"
git clone https://github.com/adaptivethreat/Bloodhound

# Install zsh
echo ""
echo -e "\e[1;33m Last step, installing zsh... \e[0m"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
