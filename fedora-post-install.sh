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
  # Power management
  sudo dnf install tlp
fi


# *************
# * SYSTEM TOOLS
# *************

# Some stuff
sudo dnf install gnome-tweak-tool
sudo dnf install unrar
su -c 'echo "Defaults pwfeedback" >> /etc/sudoers'

# Media libs. Useful at least for thumbnails in Nautilus.
sudo dnf install gstreamer1-libav gstreamer1-vaapi gstreamer1-plugins-{good,good-extras,ugly}
sudo dnf install gstreamer1-plugins-bad-free gstreamer1-plugins-bad-freeworld
sudo dnf install ffmpeg

# Joystick support
sudo dnf install linuxconsoletools


# *************
# * APPS SOURCES
# *************

sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# sudo flatpak remote-add --if-not-exists gnome https://sdk.gnome.org/gnome.flatpakrepo
# sudo flatpak remote-add --if-not-exists gnome-apps https://sdk.gnome.org/gnome-apps.flatpakrepo
# sudo flatpak remote-add --if-not-exists kderuntime --from https://distribute.kde.org/kderuntime.flatpakrepo
# sudo flatpak remote-add --if-not-exists kdeapps --from https://distribute.kde.org/kdeapps.flatpakrepo


# *************
# * APPS
# *************

# Sync apps
sudo flatpak install flathub com.transmissionbt.Transmission
sudo flatpak install flathub org.filezillaproject.Filezilla
sudo dnf install syncthing syncthing-gtk syncthing-inotify

# Graphic creation apps
sudo flatpak install flathub org.gimp.GIMP
sudo flatpak install flathub org.inkscape.Inkscape
sudo flatpak install flathub org.darktable.Darktable

# Media apps
sudo dnf remove rhythmbox
rm -rf ~/.local/share/rhythmbox/
sudo flatpak install flathub org.videolan.VLC
sudo flatpak install flathub io.github.GnomeMpv
sudo dnf install clementine
sudo flatpak install flathub org.gnome.Lollypop
sudo dnf install lollypop-portal

# Media creation apps
sudo flatpak install flathub org.audacityteam.Audacity
sudo flatpak install flathub org.musescore.MuseScore
sudo flatpak install flathub com.github.JannikHv.Gydl

# Messaging apps
sudo dnf install thunderbird
sudo dnf install liferea
sudo flatpak install flathub org.gnome.FeedReader

# Games
sudo flatpak install flathub com.valvesoftware.Steam
sudo dnf install mame
sudo flatpak install flathub org.libretro.RetroArch
