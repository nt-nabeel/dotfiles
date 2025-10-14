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

copy_icons_and_themes() {
  local source_branch="origin/gtk"
  local force_refresh="$1"
  local temp_dir="/tmp/dotfiles-icons-themes-$$"
  local icons_dir="$DOTFILES_DIR/local/share/icons"
  local themes_dir="$DOTFILES_DIR/local/share/themes"

  # Check if icons and themes already exist
  local icons_exist=false
  local themes_exist=false

  if [ -d "$icons_dir" ] && [ "$(ls -A "$icons_dir" 2>/dev/null)" ]; then
    icons_exist=true
  fi

  if [ -d "$themes_dir" ] && [ "$(ls -A "$themes_dir" 2>/dev/null)" ]; then
    themes_exist=true
  fi

  # Skip if both exist and no force refresh is requested
  if [ "$icons_exist" = true ] && [ "$themes_exist" = true ] && [ "$force_refresh" != "--force" ]; then
    echo "🎨 Icons and themes already exist, skipping copy (use --force to refresh)"
    return 0
  fi

  echo "🎨 Copying icons and themes from branch: $source_branch"

  # Create temporary directory
  mkdir -p "$temp_dir"

  # Create local/share directories if they don't exist
  mkdir -p "$icons_dir"
  mkdir -p "$themes_dir"

  # Fetch and copy icons from source branch
  if [ "$icons_exist" = false ] || [ "$force_refresh" = "--force" ]; then
    if git show "$source_branch:local/share/icons" &>/dev/null; then
      echo "📁 Copying icons from $source_branch branch..."
      git archive "$source_branch" "local/share/icons" | tar -x -C "$temp_dir" 2>/dev/null || true
      if [ -d "$temp_dir/local/share/icons" ]; then
        # Clear existing icons if forcing refresh
        if [ "$force_refresh" = "--force" ]; then
          rm -rf "$icons_dir"/*
        fi
        cp -r "$temp_dir/local/share/icons/"* "$icons_dir/" 2>/dev/null || true
        echo "✅ Icons copied successfully"
      fi
    else
      echo "⚠️ No icons directory found in $source_branch branch"
    fi
  else
    echo "📁 Icons already exist, skipping"
  fi

  # Fetch and copy themes from source branch
  if [ "$themes_exist" = false ] || [ "$force_refresh" = "--force" ]; then
    if git show "$source_branch:local/share/themes" &>/dev/null; then
      echo "📁 Copying themes from $source_branch branch..."
      git archive "$source_branch" "local/share/themes" | tar -x -C "$temp_dir" 2>/dev/null || true
      if [ -d "$temp_dir/local/share/themes" ]; then
        # Clear existing themes if forcing refresh
        if [ "$force_refresh" = "--force" ]; then
          rm -rf "$themes_dir"/*
        fi
        cp -r "$temp_dir/local/share/themes/"* "$themes_dir/" 2>/dev/null || true
        echo "✅ Themes copied successfully"
      fi
    else
      echo "⚠️ No themes directory found in $source_branch branch"
    fi
  else
    echo "📁 Themes already exist, skipping"
  fi

  # Clean up temporary directory
  rm -rf "$temp_dir"
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

# 2. Link ~/.config/*
for dir in "$DOTFILES_DIR/config/"*; do
  name=$(basename "$dir")
  link "$dir" "$CONFIG_DIR/$name"
done

# 3. Copy icons and themes from gtk branch
copy_icons_and_themes "$FORCE_ICONS_THEMES"

# 4. Link ~/.local/share/*
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

echo "🎉 Setup complete!"
echo "Backup (if any) stored in: $BACKUP_DIR"
