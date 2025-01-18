#!/bin/bash

# run base git sync
./setup.sh

# ensure ansible package is present
sudo pacman -S ansible --noconfirm

# ensure the collection is locally installed
ansible-galaxy collection install jacobvhs.ansible_roles_arch --force

# run configuration management
ansible-playbook arch-configuration-management.yml
