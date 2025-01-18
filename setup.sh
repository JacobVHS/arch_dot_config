#!/bin/bash

# Work variables
HOMEDIR="/home/$(whoami)"

# Check if Git is installed
if ! command -v git &> /dev/null; then
    echo "Error: Git is not installed."
    exit 1
fi

# Check if ~/.config directory exists
if [ ! -d "$HOMEDIR/.config" ]; then
    echo ".config directory not present! Cloning from GitHub now."
    git clone git@github.com:JacobVHS/arch_dot_config.git "$HOMEDIR/.config"
else
    if [ -d "$HOMEDIR/.config/.git" ]; then
        echo "Found existing .config repository. Checking for uncommitted changes..."

        # Check for uncommitted changes
        cd "$HOMEDIR/.config" || { echo "Error: Failed to access .config directory."; exit 1; }
        if ! git diff-index --quiet HEAD --; then
            echo "Warning: Uncommitted changes found in .config."
            echo "Options:"
            echo "1. Stash changes and sync with upstream."
            echo "2. Exit without syncing."
            echo "Enter your choice (1/2): "
            read -r choice
            case $choice in
                1)
                    echo "Stashing changes..."
                    git stash || { echo "Error: Failed to stash changes."; exit 1; }
                    echo "Syncing with upstream..."
                    git pull || { echo "Error: Failed to pull from GitHub."; exit 1; }
                    echo "Reapplying stashed changes..."
                    git stash pop || { echo "Error: Failed to reapply stashed changes."; exit 1; }
                    ;;
                2)
                    echo "Exiting without syncing."
                    exit 0
                    ;;
                *)
                    echo "Invalid choice. Exiting."
                    exit 1
                    ;;
            esac
        else
            echo "No uncommitted changes found. Syncing with upstream..."
            git pull || { echo "Error: Failed to pull from GitHub."; exit 1; }
        fi
    else
        echo "Missing .git, recloning"
        mv "$HOMEDIR/.config/" "$HOMEDIR/.config_old" || { echo "Error: Failed to backup existing .config."; exit 1; }
        git clone git@github.com:JacobVHS/arch_dot_config.git "$HOMEDIR/.config" || { echo "Error: Failed to clone repository."; exit 1; }
    fi
fi

sudo pacman -S ansible --noconfirm
ansible-galaxy collection install jacobvhs.ansible_roles_arch --force
ansible-playbook arch-configuration-management.yml

# Function to create symlink if it doesn't exist
create_symlink() {
    local target=$1
    local link=$2
    if [ ! -L "$link" ]; then
        ln -s "$target" "$link"
        echo "Symlink created: $link -> $target"
    else
        echo "Symlink already exists: $link"
    fi
}

# Create symlinks
create_symlink "$HOMEDIR/.config/zshrc" "$HOMEDIR/.zshrc"
create_symlink "$HOMEDIR/.config/bashrc" "$HOMEDIR/.bashrc"
create_symlink "$HOMEDIR/.config/shell_aliases" "$HOMEDIR/.shell_aliases"

# Generate bat cache
bat cache --build
