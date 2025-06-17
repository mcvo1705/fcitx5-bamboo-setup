🔗 Repo: [`mcvo1705/fcitx5-bamboo-setup`](https://github.com/mcvo1705/fcitx5-bamboo-setup)

---

### ✅ Nội dung `README.md` 
Dưới đây là script hoàn chỉnh install-fcitx5.sh giúp:

✅ Cài đặt fcitx5-bamboo
✅ Thiết lập biến môi trường
✅ Tự khởi động fcitx5 (cho Hyprland hoặc KDE/GNOME/khác)
✅ Tạo cấu hình fcitx5 profile mặc định
✅ Chạy tốt trên: Arch, Debian/Ubuntu, Fedora
✅ Tự nhận diện: Hyprland, KDE, GNOME, XFCE...

````markdown
# 🌿 Cài đặt bộ gõ tiếng Việt `fcitx5-bamboo` cho Hyprland & Linux

> Tự động cài đặt và cấu hình `fcitx5-bamboo` để gõ tiếng Việt trên mọi ứng dụng như Telegram, Firefox, VSCode...  
> Dành cho Arch Linux và các bản phân phối dùng `pacman`.  
> Tối ưu cho Hyprland, nhưng có thể áp dụng cho KDE, GNOME, Sway...

---

## ✨ Tính năng

- ✅ Tự động cài `fcitx5`, `fcitx5-bamboo`, `fcitx5-configtool`
- ✅ Ghi biến môi trường chuẩn cho GTK, Qt, SDL, GLFW
- ✅ Tự thêm `fcitx5` vào khởi động Hyprland (`autostart.conf`)
- ✅ Tạo file cấu hình `~/.config/fcitx5/profile` nếu chưa có
- ✅ Chuyển đổi nhanh: `Ctrl + Space`

---

## 🚀 Cách sử dụng

### 🔧 Cài đặt tự động (Arch / Manjaro / EndeavourOS)

Mở Terminal và chạy:

```bash
bash <(curl -s https://raw.githubusercontent.com/mcvo1705/fcitx5-bamboo-setup/main/fcitx5-bamboo-setup.sh)
Cách chạy script trong fish shell
1. bash
curl -s -o /tmp/setup-ibus-bamboo.sh https://raw.githubusercontent.com/mcvo1705/hyprland-ibus/main/setup-ibus-bamboo.sh
bash /tmp/setup-ibus-bamboo.sh
2. Hoặc dùng sh (nếu bash không có sẵn) fish
curl -s -o /tmp/setup-ibus-bamboo.sh https://raw.githubusercontent.com/mcvo1705/hyprland-ibus/main/setup-ibus-bamboo.sh
sh /tmp/setup-ibus-bamboo.sh
````

---

## 🧠 Sau khi cài

* **Logout hoặc reboot** để biến môi trường có hiệu lực
* Nhấn `Ctrl + Space` để chuyển giữa `English ⇄ Vietnamese`
* Bạn có thể mở `fcitx5-configtool` để thêm/bớt bộ gõ, ví dụ: Telex, VNI...

---

## 📂 Cấu trúc script

| Thành phần                  | Mô tả                                                |
| --------------------------- | ---------------------------------------------------- |
| `fcitx5`, `fcitx5-bamboo`   | Trình gõ tiếng Việt                                  |
| `env.conf`                  | Thiết lập biến môi trường cho GTK/Qt/SDL...          |
| `autostart.conf` (Hyprland) | Tự khởi động `fcitx5` khi login                      |
| `~/.config/fcitx5/profile`  | Chỉ định mặc định dùng Bamboo + bố cục bàn phím `us` |

---

## 🛑 Gỡ cài đặt (nếu cần)

```bash
sudo pacman -Rns fcitx5 fcitx5-bamboo fcitx5-configtool
rm -rf ~/.config/fcitx5
rm -f ~/.config/hypr/autostart.conf
rm -f ~/.config/hypr/env.conf
```

---

## 💡 Gợi ý cấu hình Hyprland (env.conf)

Bạn có thể copy đoạn này vào `~/.config/hypr/env.conf` nếu cần chỉnh tay:

```bash
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export INPUT_METHOD=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=ibus
```

---

## 🧩 Lưu ý

* `fcitx5` là công cụ gõ tốt nhất hiện nay cho Wayland
* Bạn có thể dùng cùng `wofi`, `rofi`, `waybar` mà không lỗi font
* Script chỉ hỗ trợ `pacman` (Arch), nếu bạn dùng Debian/Ubuntu hãy dùng thủ công hoặc chờ phiên bản khác

---

## 📬 Góp ý

Mọi ý tưởng hoặc lỗi vui lòng mở [issue](https://github.com/mcvo1705/fcitx5-bamboo-setup/issues) hoặc gửi PR.

---

## 📜 Giấy phép

MIT License.

```

---

✅ Sau khi bạn dán vào và lưu, `README.md` sẽ hiển thị đẹp trên GitHub với đầy đủ nút lệnh, mô tả và hướng dẫn.

Nếu bạn muốn mình bổ sung thêm hướng dẫn cho Ubuntu/Fedora hoặc tích hợp GUI chọn bộ gõ (Telex, VNI, v.v), chỉ cần nói nhé!
```
