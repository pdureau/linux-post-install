sudo dnf update
su -c 'dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm'
sudo dnf update

# *************
# * HARDWARE
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
# * AS USER
# *************

# Some stuff
sudo dnf install gnome-tweak-tool
sudo dnf install gnome-terminal-nautilus
sudo dnf install unrar
su -c 'echo "Defaults pwfeedback" >> /etc/sudoers'

# Flatpak remotes: Gnome
wget https://sdk.gnome.org/keys/gnome-sdk.gpg
sudo flatpak remote-add --gpg-import=gnome-sdk.gpg gnome https://sdk.gnome.org/repo/
sudo flatpak remote-add --gpg-import=gnome-sdk.gpg gnome-apps https://sdk.gnome.org/repo-apps/
rm gnome-sdk.gpg

# Flatpak remotes: KDE
wget http://distribute.kde.org/kdeflatpak.gpg
sudo flatpak remote-add kde http://distribute.kde.org/flatpak-testing/ --gpg-import=kdeflatpak.gpg
rm kdeflatpak.gpg

# Graphic apps
sudo dnf install gimp 
sudo dnf install inkscape

# Media libs
sudo dnf install gstreamer1-libav gstreamer1-vaapi gstreamer1-plugins-{good,good-extras,ugly}
sudo dnf install gstreamer1-plugins-bad-free gstreamer1-plugins-bad-freeworld
sudo dnf install ffmpeg

# Media apps
sudo dnf remove rhythmbox
rm -rf ~/.local/share/rhythmbox/
sudo dnf install vlc 
sudo dnf install clementine 
sudo dnf install audacity-freeworld
wget https://github.com/gnumdk/lollypop-data/raw/master/org.gnome.Lollypop.flatpak
sudo flatpak install --bundle org.gnome.Lollypop.flatpak
rm org.gnome.Lollypop.flatpak

# Messaging apps
sudo dnf remove evolution
sudo dnf install thunderbird tracker-thunderbird-plugin
sudo flatpak install gnome-apps org.gnome.Geary stable
sudo dnf install liferea
sudo flatpak install --from https://github.com/jangernert/FeedReader/releases/download/v2.0/feedreader.flatpakref

# Games
sudo dnf install steam
sudo dnf install mame

# Sync apps
sudo dnf copr enable decathorpe/syncthing
sudo dnf install syncthing syncthing-gtk syncthing-inotify
systemctl --user enable syncthing.service
systemctl --user enable syncthing-inotify.service
systemctl --user start syncthing.service
systemctl --user start syncthing-inotify.service
sudo dnf install nautilus-python
sudo dnf install transmission-gtk

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
flatpak --user override org.gnome.eog --filesystem=~/.local/share/Trash
flatpak --user override org.gnome.eog --filesystem=/tmp
# Keep totem as RPM: needed for thumbnails
# Keep gnome-clocks as RPM: gnome shell crash on logging if missing

# From RPM to Flatpak: LibreOffice Official
wget http://download.documentfoundation.org/libreoffice/flatpak/latest/LibreOffice.flatpak
sudo flatpak install --bundle LibreOffice.flatpak
rm LibreOffice.flatpak
cp -r ~/.config/libreoffice/* ~/.var/app/org.libreoffice.LibreOffice/config/libreoffice/
sudo dnf remove libreoffice-core


# *************
# * AS DEV
# *************

sudo dnf install git vim curl 
sudo flatpak install gnome-apps org.gnome.gitg stable
sudo dnf copr enable heikoada/nautilus-git
sudo dnf install nautilus-git 

# Development stuff - Flatpak
sudo dnf install flatpak-builder
sudo flatpak install gnome org.gnome.Sdk 3.22
sudo flatpak install kde org.kde.Sdk

# Development stuff - Web
sudo dnf install phpMyAdmin httpd mariadb-server memcached php-pecl-memcache
sudo systemctl start mariadb
sudo mysql_secure_installation
sudo sed -i 's/memory_limit = .*/memory_limit = 512M/' /etc/php.ini
sudo sed -i 's/post_max_size = .*/post_max_size = 128M/' /etc/php.ini
sudo sed -i 's/upload_max_filesize = .*/upload_max_filesize = 128M/' /etc/php.ini
sudo sed -i 's/error_reporting = .*/error_reporting = E_ALL/' /etc/php.ini
sudo sed -i 's/display_errors = .*/display_errors = On/' /etc/php.ini
sudo sed -i 's/display_startup_errors = .*/display_startup_errors = On/' /etc/php.ini

# Development stuff - Web (composer)
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
sudo mv composer.phar /usr/local/bin/composer

