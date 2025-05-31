#!/bin/bash

export BATCH_ON_LINUX_PATH="$HOME/.BatchOnLinux"
export PATH="$BATCH_ON_LINUX_PATH/bin:$PATH"

if ! command -v wine &> /dev/null; then
  echo "Error: Wine is not installed. Please install Wine first."
  exit 1
fi

if ! gem list -i "wine"; then
  echo "Installing Wine Ruby gem..."
  gem install wine || { echo "Error: Failed to install Wine gem."; exit 1; }
fi

if ! grep -q "bat./" ~/.bashrc && ! grep -q "bat./" ~/.zshrc; then
  echo "Adding BatchOnLinux to your shell config..."
  echo 'alias bat./="ruby $BATCH_ON_LINUX_PATH/bin/batch_on_linux.rb"' >> ~/.bashrc
  echo 'alias bat./="ruby $BATCH_ON_LINUX_PATH/bin/batch_on_linux.rb"' >> ~/.zshrc
  source ~/.bashrc
  source ~/.zshrc
else
  echo "BatchOnLinux already in your shell config."
fi
