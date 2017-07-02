sudo dnf update
su -c 'dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm'
sudo dnf update


# *************
# * HARDWARE SUPPORT
# *************

# Hardware issues with Yoga Pro 3
if grep -Fxq "Lenovo YOGA 3 Pro-1370" /sys/class/dmi/id/product_version
then
  # SSD
  sudo systemctl enable fstrim.timer
  # Wi-Fi (from RPM Fusion)
  sudo dnf install kmod-wl --allowerasing
  sudo dnf install kernel-devel
  sudo akmods --force
  # Power management
  sudo dnf install tlp
fi


# *************
# * SYSTEM TOOLS
# *************

# Some stuff
sudo dnf install gnome-tweak-tool
sudo dnf install gnome-terminal-nautilus
sudo dnf install unrar
su -c 'echo "Defaults pwfeedback" >> /etc/sudoers'

# Media libs
sudo dnf install gstreamer1-libav gstreamer1-vaapi gstreamer1-plugins-{good,good-extras,ugly}
sudo dnf install gstreamer1-plugins-bad-free gstreamer1-plugins-bad-freeworld
sudo dnf install ffmpeg

# Sync
sudo dnf copr enable decathorpe/syncthing
sudo dnf install syncthing syncthing-gtk syncthing-inotify
systemctl --user enable syncthing.service
systemctl --user enable syncthing-inotify.service
systemctl --user start syncthing.service
systemctl --user start syncthing-inotify.service
sudo dnf install nautilus-python
sudo dnf install transmission-gtk

# Joystick support
sudo dnf install linuxconsoletools


# *************
# * APPS SOURCES
# *************

# Flatpak remotes : Flathub
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Flatpak remotes: Gnome
sudo flatpak remote-add --if-not-exists gnome https://sdk.gnome.org/gnome.flatpakrepo
sudo flatpak remote-add --if-not-exists gnome-apps https://sdk.gnome.org/gnome-apps.flatpakrepo

# Flatpak remotes: KDE
sudo flatpak remote-add --if-not-exists kderuntime --from https://distribute.kde.org/kderuntime.flatpakrepo
sudo flatpak remote-add --if-not-exists kdeapps --from https://distribute.kde.org/kdeapps.flatpakrepo


# *************
# * APPS
# *************

# Graphic apps
sudo dnf install gimp 
sudo flatpak install flathub org.inkscape.Inkscape
# org.darktable.Darktable ??

# Media apps
sudo dnf remove rhythmbox
rm -rf ~/.local/share/rhythmbox/
sudo dnf install vlc 
sudo flatpak install flathub io.github.GnomeMpv
sudo dnf install clementine 
sudo dnf install audacity-freeworld
sudo flatpak install flathub org.gnome.Lollypop
sudo dnf install mscore

# Messaging apps
sudo dnf remove evolution
sudo dnf install thunderbird tracker-thunderbird-plugin
sudo flatpak install gnome-apps org.gnome.Geary stable
sudo dnf install liferea
sudo flatpak install flathub org.gnome.FeedReader

# Games
sudo flatpak install flathub com.valvesoftware.Steam
sudo dnf install mame
