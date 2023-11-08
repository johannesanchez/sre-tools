#!/bin/bash

# Install Homebrew (if not already installed)
if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install common
brew install jq git wget

# Install Ansible
brew install ansible

# Install Ansible
brew install terraform

# Install Python3.10
brew install python@3.10
#show python version installed
python --version

# Install aws cli v2
brew install awscli
#show aws cli version installed
aws --version

# Install iterm2
brew install iterm2

# Install visual studio code
brew install visual-studio-code

# Install kubectl
brew install kubectl@1.23
#show aws cli version installed
kubectl version --client

# Install kustomize
brew install kustomize

# Install k9s - https://github.com/derailed/k9s
brew install derailed/k9s/k9s

# Install kubeseal
brew install kubeseal

# Install sapling (git)
brew install sapling

# Install bazelisk
brew install bazelisk

#Optionals k8s
brew install istio-ctl
brew install hyperkit
brew install minikube
