# Some generic dev stuff
sudo dnf install git vim curl 
sudo flatpak install gnome-apps org.gnome.gitg stable
sudo dnf copr enable heikoada/nautilus-git
sudo dnf install nautilus-git 

# Development stuff - Flatpak
sudo dnf install flatpak-builder
sudo flatpak install gnome org.gnome.Sdk 3.22
sudo flatpak install kde org.kde.Sdk

# Development stuff - Web
sudo dnf install phpMyAdmin httpd mariadb-server memcached php-pecl-memcache php-intl
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

