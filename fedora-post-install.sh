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
  # Orientation changes when rotating the panel, ambient light to change the screen brightness, and Geoclue.
  # Works very fine but 70% of user space booting time (40% of total booting time)
  # sudo systemctl disable iio-sensor-proxy.service
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
wget https://sdk.gnome.org/keys/gnome-sdk.gpg
sudo flatpak remote-add --gpg-import=gnome-sdk.gpg gnome https://sdk.gnome.org/repo/
sudo flatpak remote-add --gpg-import=gnome-sdk.gpg gnome-apps https://sdk.gnome.org/repo-apps/
rm gnome-sdk.gpg

# Flatpak remotes: KDE
wget http://distribute.kde.org/kdeflatpak.gpg
sudo flatpak remote-add kde http://distribute.kde.org/flatpak-testing/ --gpg-import=kdeflatpak.gpg
rm kdeflatpak.gpg


# *************
# * APPS
# *************

# Graphic apps
sudo dnf install gimp 
sudo dnf install inkscape

# Media apps
sudo dnf remove rhythmbox
rm -rf ~/.local/share/rhythmbox/
sudo dnf install vlc 
sudo flatpak install flathub io.github.GnomeMpv
sudo dnf install clementine 
sudo dnf install audacity-freeworld
sudo flatpak install flathub org.gnome.Lollypop

# Messaging apps
sudo dnf remove evolution
sudo dnf install thunderbird tracker-thunderbird-plugin
sudo flatpak install gnome-apps org.gnome.Geary stable
sudo dnf install liferea
sudo flatpak install flathub org.gnome.FeedReader

# Games
sudo flatpak install flathub com.valvesoftware.Steam
sudo dnf install mame

# From RPM to Flatpak: Gnome Official
sudo dnf remove gnome-calendar
sudo flatpak install gnome-apps org.gnome.Calendar stable
sudo dnf remove gnome-weather
sudo flatpak install gnome-apps org.gnome.Weather stable
sudo dnf remove gnome-maps
sudo flatpak install gnome-apps org.gnome.Maps
sudo dnf remove gnome-calculator
sudo flatpak install gnome-apps org.gnome.Calculator stable
sudo dnf remove gnome-documents
sudo flatpak install gnome-apps org.gnome.Documents stable
sudo dnf remove eog
sudo flatpak install gnome-apps org.gnome.eog stable
# Keep totem as RPM: needed for thumbnails
# Keep gnome-clocks as RPM: gnome shell crash on logging if missing

# From RPM to Flatpak: LibreOffice Official
wget http://download.documentfoundation.org/libreoffice/flatpak/latest/LibreOffice.flatpak
sudo flatpak install --bundle LibreOffice.flatpak
rm LibreOffice.flatpak
sudo dnf remove libreoffice-core
