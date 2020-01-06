#!/bin/bash

#############################################################
# This is a template for making your own install script.
# Clone of https://github.com/Lovecore/kali-additions
#
# Twitter: Lovecore_FGC
#
# v-20200106
#############################################################

# Check our directory and make one
if [[ ! -d /root/Tools ]]; then
	echo -e "\e[1;32m Setting up Tools Directory. \e[0m"
	mkdir ~/Tools
fi
cd /root/Tools/

# Section 1 name
echo "" # linebreak
echo -e "\e[1;32m This is BOLD and GREEN \e[0mBold"
echo -e "\e[1;32m This is Normal and GREEN \e[0m"
echo "Modify this line and put things to do here..."
echo "Copy the line a few times if you want, functionize it even..."

# Section 2 name
echo "" # another linebreak
echo -e "\e[1;33m This is YELLOW... \e[0m"

# Section 3 name
echo "" # another linebreak
echo -e "\e[1;31m This is RED.. \e[0m"
echo ""
echo "You get the idea, put the things you want installed here, over and over again."
echo "Until you have everything you need!"
