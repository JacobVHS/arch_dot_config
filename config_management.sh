#!/bin/bash
./setup.sh
sudo pacman -S ansible --noconfirm
ansible-galaxy collection install jacobvhs.ansible_roles_arch --force
ansible-playbook arch-configuration-management.yml
