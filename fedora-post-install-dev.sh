# Some generic dev stuff
sudo dnf install vim
sudo flatpak install gnome-apps org.gnome.gitg stable
sudo dnf copr enable heikoada/nautilus-git
sudo dnf install nautilus-git 

# Development stuff - Flatpak
sudo dnf install flatpak-builder
sudo flatpak install gnome org.gnome.Sdk
sudo flatpak install kde org.kde.Sdk

# Development stuff - Web
sudo dnf install composer phpMyAdmin httpd mariadb-server memcached php-pecl-memcache php-intl
sudo systemctl start mariadb
sudo mysql_secure_installation
sudo sed -i 's/memory_limit = .*/memory_limit = 512M/' /etc/php.ini
sudo sed -i 's/post_max_size = .*/post_max_size = 128M/' /etc/php.ini
sudo sed -i 's/upload_max_filesize = .*/upload_max_filesize = 128M/' /etc/php.ini
sudo sed -i 's/error_reporting = .*/error_reporting = E_ALL/' /etc/php.ini
sudo sed -i 's/display_errors = .*/display_errors = On/' /etc/php.ini
sudo sed -i 's/display_startup_errors = .*/display_startup_errors = On/' /etc/php.ini
