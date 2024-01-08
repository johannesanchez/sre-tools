#!/bin/bash

# Make ktool executable:
chmod +x ktool
cp -rp ktool /usr/local/bin/

# Add aliases to your .bashrc/.zshrc file
cp -rp kubectl_aliases ~/.kubectl_aliases
echo "[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases" >> ~/.bash_profile
echo "[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases" >> ~/.zshrc
