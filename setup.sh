#!/bin/bash

# Mappák beállítása
export BATCH_ON_LINUX_PATH="$HOME/BatchOnLinux"
export PATH="$BATCH_ON_LINUX_PATH/bin:$PATH"

# Ellenőrizzük, hogy a wine telepítve van-e
if ! command -v wine &> /dev/null; then
  echo "Error: Wine is not installed. Please install Wine first."
  exit 1
fi

# Ha nem létezik, telepíti a Ruby függőségeket
if ! gem list -i "wine"; then
  echo "Installing Wine Ruby gem..."
  gem install wine || { echo "Error: Failed to install Wine gem."; exit 1; }
fi

# Alias hozzáadása a .bashrc-hez vagy .zshrc-hez
if ! grep -q "BatchOnLinux" ~/.bashrc && ! grep -q "BatchOnLinux" ~/.zshrc; then
  echo "Adding BatchOnLinux to your shell config..."
  echo 'alias BatchOnLinux="ruby $BATCH_ON_LINUX_PATH/bin/batch_on_linux.rb"' >> ~/.bashrc
  echo 'alias BatchOnLinux="ruby $BATCH_ON_LINUX_PATH/bin/batch_on_linux.rb"' >> ~/.zshrc
  source ~/.bashrc
  source ~/.zshrc
else
  echo "BatchOnLinux alias already exists in your shell config."
fi
