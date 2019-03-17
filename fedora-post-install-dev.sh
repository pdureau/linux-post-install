# Tooling
sudo dnf install vim
sudo flatpak install flathub org.gnome.gitg
sudo dnf copr enable heikoada/nautilus-git
sudo dnf install nautilus-git 
sudo flatpak install flathub com.github.fabiocolacio.marker
sudo dnf install cloc
sudo dnf install colordiff

# Package managers
sudo dnf install npm
sudo dnf install composer

# Development - Flatpak
sudo dnf install flatpak-builder
sudo flatpak install gnome org.gnome.Sdk
sudo flatpak install kde org.kde.Sdk

# Development - Web
sudo dnf install docker docker-compose
sudo firewall-cmd --permanent --zone=trusted --add-interface=docker0
sudo firewall-cmd --permanent --zone=trusted --add-port=4243/tcp
sudo dnf install cockpit
sudo dnf install phpcpd phpunit
