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
  network-manager-applet bat fd xdg-utils eza grim slurp
)

AURA_BIN_PKGS=(
  zen-browser-bin opencode-bin
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
    ~/.local/share/fnm/fnm default $(~/.local/share/fnm/fnm current)
  else
    echo "✅ fnm already installed"
  fi
}

# === Main ===
echo "🔧 Installing dotfiles from $DOTFILES_DIR"

# 1. Link ~/.config/*
for dir in "$DOTFILES_DIR/config/"*; do
  name=$(basename "$dir")
  link "$dir" "$CONFIG_DIR/$name"
done

# 2. Link gitconfig
link "$DOTFILES_DIR/gitconfig" "$HOME/.gitconfig"

# 3. Link icons & themes
link "$DOTFILES_DIR/icons" "$HOME/.local/share/icons"
link "$DOTFILES_DIR/themes" "$HOME/.local/share/themes"

# 4. Install required packages
install_pacman_pkgs
install_aura
install_aura_pkgs
install_aura_bin_pkgs
install_uv
install_fnm

echo "🎉 Setup complete!"
echo "Backup (if any) stored in: $BACKUP_DIR"
