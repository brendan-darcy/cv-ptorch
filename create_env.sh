#!/bin/bash

# Script to create PyTorch virtual environment for computer vision

ENV_NAME="pytorch_env"

echo "Creating virtual environment: $ENV_NAME"

# Create virtual environment
python3 -m venv $ENV_NAME

echo "Activating environment..."
source $ENV_NAME/bin/activate

# Upgrade pip
pip install --upgrade pip

# Install PyTorch (CPU version - adjust URL for CUDA if needed)
echo "Installing PyTorch..."
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu

# For CUDA 11.8, use this instead:
# pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118

# Install additional packages from requirements.txt
echo "Installing additional packages..."
pip install -r requirements.txt

echo "Environment '$ENV_NAME' created successfully!"
echo ""
echo "To activate the environment, run:"
echo "source $ENV_NAME/bin/activate"
echo ""
echo "To deactivate, run:"
echo "deactivate"