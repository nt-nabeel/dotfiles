# Personal Dotfiles

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Arch Linux](https://img.shields.io/badge/Arch%20Linux-1793D1?logo=arch-linux&logoColor=white)](https://archlinux.org/)

> Personal dotfiles repository for an Arch Linux + Sway WM environment focused on modern development workflows and efficient productivity tools.

## 🌟 Overview

This repository contains a comprehensive set of configuration files for a fully-featured Arch Linux development environment with Sway window manager. It's designed to be easily installable with a single script while maintaining flexibility for customization.

### Key Features

- **Modern Development Environment**: Pre-configured tools for Python, Node.js, Rust, and web development
- **Sway WM**: Minimalistic tiling window manager with vim-style keybindings
- **Neovim**: NvChad-based configuration with LSP, Copilot, and modern plugins
- **Fish Shell**: Powerful shell with modular configuration and smart completions
- **AI-Assisted Development**: Claude Code integration with custom commands
- **Automated Setup**: One-command installation with backup handling

## 📁 Repository Structure

```
.
├── config/                    # Application configurations
│   ├── nvim/                  # Neovim (NvChad) configuration
│   ├── fish/                  # Fish shell configuration
│   │   ├── conf.d/           # Modular fish configurations
│   │   └── completions/      # Command completions
│   ├── sway/                 # Sway window manager config
│   ├── waybar/               # Status bar configuration
│   ├── wezterm/              # Terminal emulator settings
│   ├── rofi/                 # Application launcher themes
│   ├── biome.json           # Code formatter configuration
│   └── ...                   # Other tool configurations
├── claude/                    # Claude Code settings
│   ├── settings.json         # Claude configuration
│   └── commands/             # Custom Claude commands
├── local/share/              # Local data (wallpapers, etc.)
├── .gitignore               # Git ignore rules
├── gitconfig                # Git configuration
└── install.sh               # Installation script
```

## 🚀 Quick Start

### Prerequisites

- **Arch Linux** (or Arch-based distribution)
- **Git** installed
- **User with sudo privileges**

### Installation

1. **Clone the repository**:

   ```bash
   git clone https://github.com/nt-nabeel/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

2. **Run the installation script**:

   ```bash
   ./install.sh
   ```

3. **Force refresh Osaka theme** (optional):
   ```bash
   ./install.sh --force-icons-themes
   ```

The installation script will:

- Install required system packages via `pacman` and `aura` (AUR helper)
- Set up development tools (`uv`, `fnm`, `claude-code`)
- Create symbolic links for all configuration files
- Back up existing configurations to `backup/` directory
- Install Solarized Osaka GTK theme from external repository

## 🛠️ Configured Tools

### Development Environment

| Tool        | Description                              | Configuration                                     |
| ----------- | ---------------------------------------- | ------------------------------------------------- |
| **Neovim**  | Modern Vim-based editor with LSP         | `config/nvim/` - NvChad-based with custom configs |
| **Fish**    | User-friendly shell with autosuggestions | `config/fish/` - Modular with tool integrations   |
| **Git**     | Version control                          | `gitconfig` - Personalized settings               |
| **Lazygit** | Terminal Git UI                          | `config/lazygit/`                                 |
| **Biome**   | JavaScript/TypeScript formatter          | `config/biome.json`                               |

### Window Management & UI

| Tool          | Description           | Configuration                                       |
| ------------- | --------------------- | --------------------------------------------------- |
| **Sway**      | Tiling window manager | `config/sway/config` - Vim-style keybindings        |
| **Waybar**    | Status bar            | `config/waybar/` - Custom styling and modules       |
| **Kanshi**    | Display management    | `config/kanshi/config` - Automatic monitor profiles |
| **Rofi**      | Application launcher  | `config/rofi/` - Custom themes and shortcuts        |
| **WezTerm**   | Terminal emulator     | `config/wezterm/` - Solarized Osaka theme           |
| **Dunst**     | Notification daemon   | `config/dunst/`                                     |
| **Gammastep** | Blue light filter     | Started via Sway config with geo-location           |

### Development Tools

| Tool         | Purpose                                 | Configuration                      |
| ------------ | --------------------------------------- | ---------------------------------- |
| **uv**       | Python package management               | `config/fish/conf.d/uv.env.fish`   |
| **fnm**      | Node.js version management              | `config/fish/conf.d/fnm.fish`      |
| **bat**      | Enhanced `cat` with syntax highlighting | `config/fish/conf.d/bat.fish`      |
| **eza**      | Modern `ls` replacement                 | `config/fish/conf.d/eza.fish`      |
| **zoxide**   | Smart directory navigation              | `config/fish/conf.d/zoxide.fish`   |
| **starship** | Custom shell prompt                     | `config/fish/conf.d/starship.fish` |

### AI & Productivity

| Tool            | Description                      | Configuration                            |
| --------------- | -------------------------------- | ---------------------------------------- |
| **Claude Code** | AI-powered development assistant | `claude/` - Custom commands and settings |
| **btop**        | Resource monitor                 | `config/btop/`                           |

## ⌨️ Key Features

### Sway Window Manager

- **Vim-style navigation**: `$mod + hjkl` for window movement
- **Workspaces**: `$mod + 1-10` for workspace switching
- **Screenshots**: `$mod + Print` for area selection with `grim/slurp`
- **Application launcher**: `$mod + d` for Rofi
- **Brightness control**: Function keys with `brightnessctl`

### Neovim Configuration

- **NvChad Base**: Modern Neovim configuration with UI improvements
- **LSP Support**: Configured for Python, TypeScript, JavaScript, Rust, and more
- **Copilot Integration**: GitHub Copilot via `blink-copilot` plugin
- **Debugging**: DAP configuration for multiple languages
- **Git Integration**: Gitsigns and Lazygit integration
- **Custom Plugins**: Additional plugins for specific workflows

### Fish Shell

- **Modular Configuration**: Separate files for each tool integration
- **Smart Completions**: Enhanced completions for `uv`, `eza`, and other tools
- **Custom Functions**: Utility functions for common tasks
- **Theme Support**: Solarized Osaka Dark color scheme
- **Environment Management**: Proper integration with `fnm` and `uv`

### Claude Code Integration

Custom commands for enhanced productivity:

- `/check-docs`: Documentation health check and coverage analysis
- `/suggest-commit`: Intelligent conventional commit message suggestions
- `/update-docs`: Automatic documentation updates based on code changes

## 🎨 Theming

The configuration uses a consistent **Solarized Osaka Dark** color scheme across:

- Terminal (WezTerm)
- Shell prompt (Starship)
- Code editor (Neovim)
- Status bar (Waybar)
- GTK Applications (via Osaka GTK theme)

The Solarized Osaka GTK theme is automatically installed from the official GitHub repository during setup.

## 📦 Package Management

### System Packages

The installation manages three categories of packages:

1. **Core pacman packages**: Essential system tools
2. **AUR packages** (`aura -S`): Additional applications from AUR
3. **AUR binary packages** (`aura -A`): Pre-compiled AUR packages

### Development Tools

- **Python**: `uv` for package management and virtual environments
- **Node.js**: `fnm` for version management
- **Rust**: System installation via `pacman`

## 🔧 Customization

### Adding New Configurations

1. Add configuration files to appropriate `config/` subdirectory
2. Update `install.sh` package arrays if new system packages are needed
3. Add new Fish shell integrations as `.fish` files in `config/fish/conf.d/`
4. For icons/themes, add them to the `gtk` branch instead of main

### Modifying Existing Configurations

- All configurations are symlinked from the repository to their system locations
- Edit files directly in the `~/.dotfiles` directory
- Changes will be reflected immediately in your system

### Environment-Specific Settings

- For machine-specific settings, create local overrides that aren't tracked in git
- Use environment variables in Fish shell configuration for flexibility
- Consider using separate branches for different environments

## 🐛 Troubleshooting

### Common Issues

1. **Installation fails with permissions error**:
   - Ensure you have sudo privileges
   - Check that AUR helper (`aura`) is properly installed

2. **Icons/themes not displaying correctly**:
   - Run `./install.sh --force-icons-themes` to refresh them
   - Ensure the `gtk` branch exists and has the required files

3. **Neovim plugins not loading**:
   - Run `:Lazy sync` in Neovim to update plugins
   - Check for errors in `config/nvim/lua/configs/` files

4. **Fish shell errors**:
   - Check for syntax errors in `config/fish/conf.d/` files
   - Ensure all required tools are installed

### Getting Help

- Check individual configuration files for inline comments
- Use the Claude Code `/check-docs` command for documentation analysis
- Refer to tool-specific documentation for advanced configuration

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](config/nvim/LICENSE) file for details.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

## 📊 System Information

- **Operating System**: Arch Linux
- **Window Manager**: Sway
- **Terminal**: WezTerm
- **Shell**: Fish
- **Editor**: Neovim (NvChad)
- **Primary Font**: JetBrains Mono Nerd Font

---

**Note**: This is a personal dotfiles repository tuned for specific workflows and preferences. Feel free to fork and customize it to suit your own needs!
