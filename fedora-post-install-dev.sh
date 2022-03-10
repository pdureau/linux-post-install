# *************
# * TOOLING
# *************

# CLI
sudo dnf install colordiff
sudo dnf install make
sudo dnf install patch

# Graphical apps
sudo flatpak install flathub org.gnome.gitg
sudo flatpak install flathub com.github.fabiocolacio.marker
sudo flatpak install flathub com.github.alecaddd.sequeler


# *************
# * Package managers
# *************

sudo dnf install npm
sudo dnf install composer


# *************
# * Flatpak
# *************

sudo dnf install flatpak-builder
sudo flatpak install flathub org.freedesktop.Sdk
sudo flatpak install flathub gnome org.gnome.Sdk
sudo flatpak install flathub kde org.kde.Sdk


# *************
# * Web
# *************

# Install Docker
# Fedora 31 switched to cgroup v2, Docker doesn't support cgroup v2 though.
sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"
sudo firewall-cmd --permanent --zone=FedoraWorkstation --add-masquerade
sudo dnf install moby-engine
sudo systemctl enable --now docker
sudo usermod -aG docker $(whoami)

# Install Docker-related tools.
sudo dnf install docker-compose
sudo dnf install cockpit
sudo dnf install cockpit-podman


# *************
# * Other
# *************

# Beautifiers.
sudo dnf install black
sudo npm install --global prettier

# Audio & Midi
sudo dnf install python3-devel
sudo dnf install alsa-lib-devel
sudo pip3 install rtmidi
