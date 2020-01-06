# kali-additions
This script is just for installing some additional CTF tools.

Simply `chmod +x install.sh` then execute it.

It will create a 'Tools' directory on /root/ and install all the tools.

---
## Tools that get downloaded:

- Kali Full
- Atom editor
- Terminator
- GRC
- Xclip
- Ufw
- LinPeas
- LinEnum
- Pspy32 & Pspy64
- Netcat binaries
- Plink
- Sysinternals suite
- Ghidra
- John tools
- Evil winrm
- Bloodhound
- Evil-WinRAR
- Patator
- Watson
- OhMyZsh Shell

## Aliases created:

- Type `ghidra` to launch ghidra.
- Type `simple` to launch a SimpleHTTPServer on port 80.
- Type `nmap` to lauch a colored nmap scan.
- Type `tools` to go to the Tools directory.

## Zsh Plugins enabled:

- encode64

Example:
```
encode64 some_string
=> c29tZV9zdHJpbmc=

decode64 c29tZV9zdHJpbmc=
=> some_string
```
- zsh-syntax-highlighting
