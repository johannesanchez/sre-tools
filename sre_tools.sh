#!/bin/bash

# Settings for MacOS

# # Git branch in prompt.
# parse_git_branch() {
#     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
# }
# export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "


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

# MINIKUBE
#brew install hyperkit
#brew install minikube

brew install kind

# Install Kyverno CLI
brew install kyverno

#KIND
# how to create a cluster with kind: >> kind create cluster
# confirm the default context is pointing to kind cluster: >> kubectl cluster-info
# how to delete cluster: >> kind delete cluster

# KO - makes building single Go container images easy, fast, secure when no OS dependencies used.
brew install ko

# Install ohhmyzsh (very good tool with many plugins & alias)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# During the installation you will be asked if you want to use zsh by default. On my case I said NO, I want to keep using bash and when I want to use zsh, just type `zsh`.

#Install pluto (Optional)
#brew install FairwindsOps/tap/pluto


### Interesting tools:
# IAC: Terragrunt, 

# Linux, Troubleshooting: 
  # Test ssl https://github.com/drwetter/testssl.sh

# Kubernetes
  # cost savings: karpenter https://karpenter.sh/
  
