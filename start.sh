#!/bin/bash

service dbus start

vncserver -kill :1 2>/dev/null || true

vncserver :1 -geometry 1920x1080 -depth 24 -localhost no

/usr/share/novnc/utils/novnc_proxy --vnc localhost:5901 --listen 6080 &

cat > /workspace/launch-minecraft.sh << 'EOF'
#!/bin/bash
cd /workspace/minecraft
if [ ! -f "minecraft-launcher" ]; then
    echo "Downloading Minecraft Launcher..."
    wget -O minecraft-launcher https://launcher.mojang.com/download/Minecraft.tar.gz
    tar -xzf minecraft-launcher
    rm minecraft-launcher
fi

./minecraft-launcher
EOF

chmod +x /workspace/launch-minecraft.sh

mkdir -p ~/.local/share/applications
cat > ~/.local/share/applications/minecraft.desktop << 'EOF'
[Desktop Entry]
Type=Application
Name=Minecraft
Exec=/workspace/launch-minecraft.sh
Icon=applications-games
Terminal=true
EOF

echo "======================================"
echo "VNC Server started!"
echo "Access desktop at: http://localhost:6080"
echo "======================================"
echo "To launch Minecraft, run: /workspace/launch-minecraft.sh"
echo "======================================"

tail -f /dev/null
