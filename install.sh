#!/usr/bin/env bash
set -euo pipefail

# === Variables ===
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"
BACKUP_DIR="$DOTFILES_DIR/backup/$(date +%Y%m%d%H%M%S)"

PACMAN_PKGS=(
  fish neovim git
)

AURA_PKGS=(
  sway waybar wezterm rofi brightnessctl wl-clipboard unzip zoxide starship
  btop openssh keychain ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbols
  noto-fonts-emoji nwg-look pavucontrol lazygit thunar mpv blueman
  network-manager-applet bat fd xdg-utils eza grim slurp jq
  gtk-engine-murrine kanshi gammastep
)

AURA_BIN_PKGS=(
  zen-browser-bin
)

# === Functions ===
backup() {
  local target="$1"
  if [ -e "$target" ] && [ ! -L "$target" ]; then
    echo "📦 Backing up $target → $BACKUP_DIR"
    mkdir -p "$BACKUP_DIR"
    mv "$target" "$BACKUP_DIR/"
  fi
}

link() {
  local src="$1"
  local dest="$2"
  backup "$dest"
  mkdir -p "$(dirname "$dest")"
  ln -sfn "$src" "$dest"
  echo "🔗 Linked $src → $dest"
}

is_installed() {
  pacman -Q "$1" &>/dev/null
}

install_pacman_pkgs() {
  local missing=()
  for pkg in "${PACMAN_PKGS[@]}"; do
    if ! is_installed "$pkg"; then
      missing+=("$pkg")
    fi
  done
  if [ ${#missing[@]} -gt 0 ]; then
    echo "📦 Installing with pacman: ${missing[*]}"
    sudo pacman -S --needed --noconfirm "${missing[@]}"
  else
    echo "✅ All pacman packages already installed"
  fi
}

install_aura() {
  if ! command -v aura &>/dev/null; then
    echo "📥 Installing aura..."
    git clone https://aur.archlinux.org/aura.git
    pushd aura >/dev/null
    makepkg -si --noconfirm
    popd >/dev/null
    rm -rf aura
  fi
}

install_aura_pkgs() {
  local missing=()
  for pkg in "${AURA_PKGS[@]}"; do
    if ! is_installed "$pkg"; then
      missing+=("$pkg")
    fi
  done
  if [ ${#missing[@]} -gt 0 ]; then
    echo "📦 Installing with aura -S: ${missing[*]}"
    aura -S --needed --noconfirm "${missing[@]}"
  else
    echo "✅ All aura -S packages already installed"
  fi
}

install_aura_bin_pkgs() {
  local missing=()
  for pkg in "${AURA_BIN_PKGS[@]}"; do
    if ! is_installed "$pkg"; then
      missing+=("$pkg")
    fi
  done
  if [ ${#missing[@]} -gt 0 ]; then
    echo "📦 Installing with aura -A: ${missing[*]}"
    aura -A --needed --noconfirm "${missing[@]}"
  else
    echo "✅ All aura -A packages already installed"
  fi
}

install_uv() {
  if ! command -v uv &>/dev/null; then
    echo "📥 Installing uv..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
  else
    echo "✅ uv already installed"
  fi
}

install_fnm() {
  if ! command -v fnm &>/dev/null; then
    echo "📥 Installing fnm..."
    curl -fsSL https://fnm.vercel.app/install | bash
    ~/.local/share/fnm/fnm install --use --lts
    ~/.local/share/fnm/fnm default "$(~/.local/share/fnm/fnm current)"
  else
    echo "✅ fnm already installed"
  fi
}

install_claude() {
  if ! command -v claude &>/dev/null; then
    echo "📥 Installing claude..."
    npm install -g @anthropic-ai/claude-code
  else
    echo "✅ claude already installed"
  fi
}

install_osaka_theme() {
  local force_refresh="$1"
  local osaka_dir="$DOTFILES_DIR/solarized-osaka-gtk-theme"
  local icons_dir="$HOME/.local/share/icons/Osaka_Dark"
  local themes_dir="$HOME/.local/share/themes/Osaka-Dark"

  # Check if icons and themes already exist
  local icons_exist=false
  local themes_exist=false

  if [ -d "$icons_dir" ]; then
    icons_exist=true
  fi

  if [ -d "$themes_dir" ]; then
    themes_exist=true
  fi

  # Skip if both exist and no force refresh is requested
  if [ "$icons_exist" = true ] && [ "$themes_exist" = true ] && [ "$force_refresh" != "--force" ]; then
    echo "🎨 Osaka theme already installed, skipping (use --force to refresh)"
    return 0
  fi

  echo "🎨 Installing Solarized Osaka GTK theme..."

  # Clone or update the repository
  if [ ! -d "$osaka_dir" ]; then
    echo "📥 Cloning Osaka GTK theme repository..."
    git clone https://github.com/Fausto-Korpsvart/Osaka-GTK-Theme.git "$osaka_dir"
  elif [ "$force_refresh" = "--force" ]; then
    echo "🔄 Updating Osaka GTK theme repository..."
    cd "$osaka_dir"
    git pull origin main
    cd "$DOTFILES_DIR"
  fi

  # Create target directories
  mkdir -p "$HOME/.local/share/icons"
  mkdir -p "$HOME/.local/share/themes"

  # Install icons
  if [ "$icons_exist" = false ] || [ "$force_refresh" = "--force" ]; then
    echo "📁 Installing Osaka Dark icons..."
    cp -rf "$osaka_dir/icons/Osaka_Dark" "$HOME/.local/share/icons/"
    echo "✅ Icons installed successfully"
  fi

  # Install theme
  if [ "$themes_exist" = false ] || [ "$force_refresh" = "--force" ]; then
    echo "📁 Installing Osaka Dark GTK theme..."
    cd "$osaka_dir/themes"
    ./install.sh --dest "$HOME/.local/share/themes" --color dark --libadwaita
    cd "$DOTFILES_DIR"
    echo "✅ Theme installed successfully"
  fi

  echo "🎉 Solarized Osaka theme installation complete!"
}

# === Main ===
echo "🔧 Installing dotfiles from $DOTFILES_DIR"

# Parse command line arguments
FORCE_ICONS_THEMES=""
if [ "${1:-}" = "--force-icons-themes" ]; then
  FORCE_ICONS_THEMES="--force"
  echo "🔄 Force refresh enabled for icons and themes"
fi

# 1. Link ~/
link "$DOTFILES_DIR/gitconfig" "$HOME/.gitconfig"
link "$DOTFILES_DIR/claude/settings.json" "$HOME/.claude/settings.json"
link "$DOTFILES_DIR/claude/commands" "$HOME/.claude/commands"
link "$DOTFILES_DIR/claude/scripts" "$HOME/.claude/scripts"

# 2. Link ~/.config/*
for dir in "$DOTFILES_DIR/config/"*; do
  name=$(basename "$dir")
  link "$dir" "$CONFIG_DIR/$name"
done

# 3. Link ~/.local/share/*
for dir in "$DOTFILES_DIR/local/share/"*; do
  name=$(basename "$dir")
  link "$dir" "$HOME/.local/share/$name"
done

# 4. Install required packages
install_pacman_pkgs
install_aura
install_aura_pkgs
install_aura_bin_pkgs
install_uv
install_fnm
install_claude

# 5. Install Solarized Osaka GTK theme
install_osaka_theme "$FORCE_ICONS_THEMES"

echo "🎉 Setup complete!"
echo "Backup (if any) stored in: $BACKUP_DIR"
