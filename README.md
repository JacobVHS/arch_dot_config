# Arch Dot Config Repository

This repository contains the configuration files for managing an Arch Linux setup. The provided script automates the process of syncing these configuration files with a GitHub repository and creating symbolic links for `.bashrc` and `.zshrc` files.

## Appearance
![Alt text](example_img/hyprland_example.png)

## Features

- Automatically clones the configuration repository if not present.
- Syncs existing local configurations with the upstream repository.
- Handles uncommitted changes locally with interactive prompts.
- Creates symbolic links for `.bashrc` and `.zshrc`.
- Includes error handling for common issues like missing Git or failed operations.

## Script Usage

### Prerequisites

- **Git Installed**: Ensure `git` is installed on your system. You can install it using your package manager (e.g., `sudo pacman -S git`).
- **SSH Key Configured**: The repository uses SSH for cloning. Set up your SSH keys and add them to GitHub.

### Running the Script

1. Clone this repository:
   ```bash
   git clone git@github.com:JacobVHS/arch_dot_config.git ~/.config
   ```

2. Navigate to the repository directory and run the script:
   ```bash
   cd ~/.config
   ./setup.sh
   ```
3. Alternatively, you can make use of my Ansible collection to config manage the OS
  ```bash
  cd ~/.config/
  ./config_management.sh
  ```
### Script Behavior

- If the `~/.config` directory does not exist, it will clone the repository.
- If the directory exists:
  - It checks for a valid Git repository.
  - If uncommitted changes are present, the script prompts to stash changes or exit.
  - If no changes are present, it syncs with the upstream repository.
- Creates symbolic links for `.bashrc` and `.zshrc`.

## Error Handling

- **Git Not Installed**: The script exits with an error if Git is not found.
- **Uncommitted Changes**: The user is prompted to stash changes or exit without syncing.
- **Failed Operations**: Errors are logged with appropriate messages.

## Example Output

```bash
.config directory not present! Cloning from GitHub now.
Syncing with upstream
Found existing .config repository. Checking for uncommitted changes...
No uncommitted changes found. Syncing with upstream...
Creating symlinks for bashrc and zshrc...
Done.
```

## Contributing

Contributions are welcome! To contribute:

1. Fork the repository.
2. Create a new branch.
3. Make your changes and test thoroughly.
4. Submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).

