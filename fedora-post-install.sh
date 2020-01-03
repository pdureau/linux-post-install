sudo dnf update
su -c 'dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm'
sudo dnf install fedora-workstation-repositories
sudo dnf update


# *************
# * HARDWARE SUPPORT
# *************

# Lenovo Yoga Pro 3
if grep -Fxq "Lenovo YOGA 3 Pro-1370" /sys/class/dmi/id/product_version
then
    # SSD
    sudo systemctl enable fstrim.timer
    # Wi-Fi (from RPM Fusion)
    sudo dnf install kmod-wl --allowerasing
    # Power management
    sudo dnf install tlp
fi

# Dell XPS 9575
if grep -Fxq "XPS 15 9575" /sys/devices/virtual/dmi/id/product_name
then
    # Flickering screen:
    # - while AC plugged: Disable Intel turbo boost in the BIOS.
    # - while AC unplugged: Disable c-states in the BIOS.
    # - after waking-up from sleep/hybernate on wayland: TODO
    # Power management
    sudo dnf install tlp
    sudo systemctl enable tlp.service
    sudo systemctl enable tlp-sleep.service
    sudo systemctl mask systemd-rfkill.service
    sudo systemctl mask systemd-rfkill.socket
    # Prevent rngd from using 100% CPU
    sudo systemctl disable --now rngd
fi


# *************
# * SYSTEM TOOLS
# *************

# Add extra stuff
sudo dnf install gnome-tweak-tool pavucontrol dconf-editor
sudo dnf install unrar ImageMagick
sudo dnf install libreoffice-langpack-fr

# Set sudo password feedback
sudo su -c 'echo "Defaults pwfeedback" >> /etc/sudoers'

# Set HiDPI support for TTY console
sudo dnf install terminus-fonts-console
sudo vim /etc/vconsole.conf # FONT="ter-m32n"

# Get MS fonts
sudo dnf install curl cabextract xorg-x11-font-utils fontconfig
sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm

# Remove useless services & apps
sudo dnf remove PackageKit
sudo dnf remove gnome-photos

# Add media libs. Useful at least for thumbnails in Nautilus.
sudo dnf install gstreamer1-libav gstreamer1-vaapi gstreamer1-plugins-{good,good-extras,ugly}
sudo dnf install gstreamer1-plugins-bad-free gstreamer1-plugins-bad-freeworld
sudo dnf install ffmpeg

# Add KDEConnect integration
sudo dnf install nautilus-python
sudo dnf install gnome-shell-extension-gsconnect webextension-gsconnect nautilus-gsconnect

# Set apps sources
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak remote-add --if-not-exists fedora oci+https://registry.fedoraproject.org
