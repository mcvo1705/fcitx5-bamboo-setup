#!/usr/bin/env bash
set -euo pipefail

echo "🌿 Cài đặt fcitx5-bamboo cho Linux..."

################################################################################
# 1. Xác định hệ điều hành
################################################################################
. /etc/os-release

install_packages() {
  if [[ "$ID" == "arch" || "$ID_LIKE" == *"arch"* ]]; then
    echo "📦 Cài bằng pacman..."
    sudo pacman -Syu --noconfirm fcitx5 fcitx5-bamboo fcitx5-configtool
  elif [[ "$ID" == "debian" || "$ID_LIKE" == *"debian"* || "$ID_LIKE" == *"ubuntu"* ]]; then
    echo "📦 Cài bằng apt..."
    sudo apt update
    sudo apt install -y fcitx5 fcitx5-bamboo fcitx5-config-qt fcitx5-configtool
  elif [[ "$ID" == "fedora" ]]; then
    echo "📦 Cài bằng dnf..."
    sudo dnf install -y fcitx5 fcitx5-bamboo fcitx5-configtool
  else
    echo "❌ Hệ điều hành không được hỗ trợ: $ID"
    exit 1
  fi
}

################################################################################
# 2. Thiết lập biến môi trường
################################################################################
setup_env_vars() {
  ENV_FILE="$HOME/.config/environment.d/input-method.conf"
  mkdir -p "$(dirname "$ENV_FILE")"

  if ! grep -q "GTK_IM_MODULE" "$ENV_FILE" 2>/dev/null; then
    echo "✅ Ghi biến môi trường vào $ENV_FILE"
    cat > "$ENV_FILE" <<EOF
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
INPUT_METHOD=fcitx
SDL_IM_MODULE=fcitx
GLFW_IM_MODULE=ibus
EOF
  fi
}

################################################################################
# 3. Thêm fcitx5 vào tự khởi động
################################################################################
setup_autostart() {
  SESSION="${XDG_SESSION_DESKTOP:-}"
  DESKTOP_ENV="${XDG_CURRENT_DESKTOP:-}"

  if [[ "$SESSION" == "Hyprland" || "$DESKTOP_ENV" == *"Hyprland"* ]]; then
    AUTO="$HOME/.config/hypr/autostart.conf"
    mkdir -p "$(dirname "$AUTO")"
    if ! grep -q "fcitx5" "$AUTO" 2>/dev/null; then
      echo "✅ Thêm fcitx5 vào Hyprland autostart"
      echo "fcitx5 &" >> "$AUTO"
    fi
  else
    mkdir -p ~/.config/autostart
    DESKTOP_FILE=~/.config/autostart/fcitx5.desktop
    if [[ ! -f "$DESKTOP_FILE" ]]; then
      echo "✅ Tạo ~/.config/autostart/fcitx5.desktop"
      cat > "$DESKTOP_FILE" <<EOF
[Desktop Entry]
Type=Application
Exec=fcitx5
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=Fcitx5
EOF
    fi
  fi
}

################################################################################
# 4. Tạo cấu hình fcitx5 profile nếu chưa có
################################################################################
create_fcitx5_profile() {
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
}

################################################################################
# Chạy tất cả
################################################################################
main() {
  install_packages
  setup_env_vars
  setup_autostart
  create_fcitx5_profile
  echo "🎉 Cài đặt hoàn tất!"
  echo "🔁 Vui lòng **logout hoặc reboot** để áp dụng cấu hình."
  echo "🔤 Nhấn Ctrl + Space để chuyển Anh ⇄ Việt"
}

main
