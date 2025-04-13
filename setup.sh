#!/bin/zsh

set -e
set -o pipefail

# Install Homebrew
if [[ ! -x /usr/local/bin/brew ]]; then
  echo "[INFO] Install Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install Ansible
if [[ ! -x /usr/local/bin/ansible ]]; then
  echo "[INFO] Install Ansible"
  brew install ansible
fi

# Install Ansible Collections
if [[ ! -x /usr/local/bin/ansible-galaxy ]]; then
  echo "[INFO] Install Ansible Collections"
  ansible-galaxy install -r requirements.yml
fi

echo "[INFO] Done"
exit 0
