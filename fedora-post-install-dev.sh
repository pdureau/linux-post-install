# Some generic dev stuff
sudo dnf install vim
sudo flatpak install flathub org.gnome.gitg
sudo dnf copr enable heikoada/nautilus-git
sudo dnf install nautilus-git 

# Development stuff - Flatpak
sudo dnf install flatpak-builder
sudo flatpak install gnome org.gnome.Sdk
sudo flatpak install kde org.kde.Sdk

# Development stuff - Web
sudo dnf install docker docker-compose
sudo firewall-cmd --permanent --zone=trusted --add-interface=docker0
sudo firewall-cmd --permanent --zone=trusted --add-port=4243/tcp
sudo dnf install cockpit
