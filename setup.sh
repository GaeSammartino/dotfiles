#!/bin/bash

# Define the config directory
DOTFILES_DIR="$HOME/dotfiles/config"
CONFIG_DIR="$HOME/.config"

# Create .config if it doesn't exist
mkdir -p "$CONFIG_DIR"

# Folders to link
configs=("kitty" "zathura" "nvim")

echo "🔗 Linking configuration files..."

for app in "${configs[@]}"; do
  # Remove existing config if it's there (careful!)
  if [ -d "$CONFIG_DIR/$app" ] || [ -L "$CONFIG_DIR/$app" ]; then
    echo "⚠️  Removing existing $app config..."
    rm -rf "$CONFIG_DIR/$app"
  fi

  # Create the symbolic link
  ln -s "$DOTFILES_DIR/$app" "$CONFIG_DIR/$app"
  echo "✅ Linked $app"
done

echo "🚀 Setup complete! Your environment is ready."
