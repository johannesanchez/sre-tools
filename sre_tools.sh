#!/bin/bash

# Install Homebrew (if not already installed)
if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install common
brew install jq

# Install git
brew install git

# Install Ansible
brew install ansible

# Install iterm2
brew install iterm2

# Install visual studio code
brew install visual-studio-code
