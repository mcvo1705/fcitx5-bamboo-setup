#!/usr/bin/env bash
set -euo pipefail

echo "🌿 Cài đặt fcitx5-bamboo cho Hyprland..."

# 1. Cài gói cần thiết
sudo pacman -S --noconfirm fcitx5 fcitx5-bamboo fcitx5-configtool

# 2. Thiết lập biến môi trường (nếu chưa có)
ENV_FILE="$HOME/.config/hypr/env.conf"
mkdir -p "$(dirname "$ENV_FILE")"

if ! grep -q "GTK_IM_MODULE" "$ENV_FILE" 2>/dev/null; then
  echo "✅ Ghi biến môi trường vào $ENV_FILE"
  cat >> "$ENV_FILE" <<EOF
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export INPUT_METHOD=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=ibus
EOF
fi

# 3. Tự khởi động fcitx5 khi vào Hyprland
AUTO_START="$HOME/.config/hypr/autostart.conf"
mkdir -p "$(dirname "$AUTO_START")"

if ! grep -q "fcitx5" "$AUTO_START" 2>/dev/null; then
  echo "✅ Thêm fcitx5 vào autostart"
  echo "fcitx5 &" >> "$AUTO_START"
fi

# 4. Tạo file profile nếu chưa có để thêm bộ gõ Bamboo
mkdir -p ~/.config/fcitx5
PROFILE=~/.config/fcitx5/profile
if [ ! -f "$PROFILE" ]; then
  echo "✅ Tạo cấu hình fcitx5 profile cơ bản"
  cat > "$PROFILE" <<EOF
[Groups]
0=Default

[Group/Default]
Name=Default
Default Layout=us
DefaultIM=bamboo

[Group/Default/Items]
0=bamboo
EOF
fi

echo "🎉 Hoàn tất! Vui lòng logout hoặc reboot để áp dụng."
echo "🔤 Dùng Ctrl + Space để chuyển Anh ⇄ Việt"
