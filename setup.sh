#!/bin/bash

# Update and upgrade the system packages
echo "Updating and upgrading the system..."
sudo apt update && sudo apt upgrade -y

# Add Golang PPA repository
echo "Adding Golang PPA repository..."
sudo add-apt-repository ppa:longsleep/golang-backports -y

# Update package list again after adding PPA
sudo apt update

# Install the required packages
echo "Installing golang-go, git, gcc, and build-essential..."
sudo apt install -y golang-go git gcc build-essential

# Clone the evilginx2 repository
echo "Cloning the evilginx2 repository..."
git clone https://github.com/kgretzky/evilginx2

# Navigate to the evilginx2 directory
cd evilginx2 || { echo "Failed to enter the evilginx2 directory"; exit 1; }

# Build the evilginx2 tool
echo "Building evilginx2..."
make

# Create or replace the phishlets directory
if [ -d "phishlets" ]; then
    echo "Removing existing phishlets directory..."
    rm -rf phishlets
fi

# Clone the phishlets repository into the evilginx2/phishlets directory
echo "Cloning the phishlets repository..."
git clone https://github.com/e-brokenc0de/phishlets phishlets

# Completion message
echo "Script completed successfully!"