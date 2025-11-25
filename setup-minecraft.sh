#!/bin/bash

echo "=========================================="
echo "Minecraft Java Edition Setup"
echo "=========================================="

mkdir -p /workspace/minecraft
cd /workspace/minecraft

echo "Downloading Minecraft Launcher..."
wget -q --show-progress https://launcher.mojang.com/download/Minecraft.tar.gz

echo "Extracting launcher..."
tar -xzf Minecraft.tar.gz
rm Minecraft.tar.gz

chmod +x minecraft-launcher

echo ""
echo "=========================================="
echo "Setup Complete!"
echo "=========================================="
echo ""
echo "To launch Minecraft, run:"
echo "  cd /workspace/minecraft"
echo "  ./minecraft-launcher"
echo ""
