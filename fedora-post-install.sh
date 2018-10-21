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
sudo dnf install pavucontrol
sudo dnf install unrar
sudo dnf install ImageMagick
su -c 'echo "Defaults pwfeedback" >> /etc/sudoers'
sudo dnf install freetype-freeworld

# Get material design theme
sudo dnf install adapta-gtk-theme

# Replace terminal emulator
sudo dnf install tilix tilix-nautilus
sudo dnf remove gnome-terminal

# Media libs. Useful at least for thumbnails in Nautilus.
sudo dnf install gstreamer1-libav gstreamer1-vaapi gstreamer1-plugins-{good,good-extras,ugly}
sudo dnf install gstreamer1-plugins-bad-free gstreamer1-plugins-bad-freeworld
sudo dnf install ffmpeg

# Games support
sudo dnf install joystick
sudo dnf install nrg2iso

# Gnome Shell integration with Firefox
sudo dnf install chrome-gnome-shell

# GSConnect support
sudo dnf install fuse-sshfs

# Apps sources
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak remote-add --if-not-exists winepak https://dl.winepak.org/repo/winepak.flatpakrepo

# *************
# * APPS
# *************

# Sync apps
sudo flatpak install flathub com.transmissionbt.Transmission
sudo flatpak install flathub org.filezillaproject.Filezilla
sudo flatpak install flathub me.kozec.syncthingtk 

# Graphic creation apps
sudo flatpak install flathub org.gimp.GIMP
sudo flatpak install flathub org.inkscape.Inkscape

# Media apps
sudo dnf install rhythmbox-alternative-toolbar
sudo flatpak install flathub org.videolan.VLC
sudo flatpak install flathub io.github.GnomeMpv
sudo flatpak install flathub org.gnome.Lollypop
sudo dnf install lollypop-portal

# Media creation apps
sudo flatpak install flathub org.audacityteam.Audacity
sudo flatpak install flathub org.musescore.MuseScore
sudo flatpak install flathub com.github.JannikHv.Gydl
sudo flatpak install flathub com.github.wwmm.pulseeffects
sudo flatpak install flathub org.bunkus.mkvtoolnix-gui

# Messaging apps
sudo flatpak install flathub org.mozilla.Thunderbird
sudo dnf install liferea
sudo flatpak install flathub org.gnome.FeedReader

# Games
sudo flatpak install flathub com.valvesoftware.Steam
sudo flatpak install flathub org.libretro.RetroArch

