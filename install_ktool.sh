#!/bin/bash

# Make ktool executable:
chmod +x ktool
cp -rp ktool /usr/local/bin/

# Add aliases to your .bashrc/.zshrc file
cp -rp aliases ~/.aliases
echo "[ -f ~/.aliases ] && source ~/.aliases" >> ~/.bash_profile
echo "[ -f ~/.aliases ] && source ~/.aliases" >> ~/.zshrc

#source ~/.bash_profile
#source ~/.zshrc
