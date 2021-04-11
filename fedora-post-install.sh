sudo dnf update
su -c 'dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm'
sudo dnf install fedora-workstation-repositories
sudo dnf update

# Add extra stuff
sudo dnf install gnome-tweak-tool pavucontrol dconf-editor
sudo dnf install unrar ImageMagick vim
sudo dnf install libreoffice-langpack-fr

# Set sudo password feedback
sudo su -c 'echo "Defaults pwfeedback" >> /etc/sudoers'

# Set HiDPI support for TTY console
sudo dnf install terminus-fonts-console
sudo vim /etc/vconsole.conf # FONT="ter-m32n"

# Get MS fonts
sudo dnf install curl cabextract xorg-x11-font-utils fontconfig
sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm

# Remove useless stuff
sudo dnf remove PackageKit

# Add media libs. Useful at least for thumbnails in Nautilus.
sudo dnf install gstreamer1-libav gstreamer1-vaapi gstreamer1-plugins-{good,good-extras,ugly}
sudo dnf install gstreamer1-plugins-bad-free gstreamer1-plugins-bad-freeworld
sudo dnf install ffmpeg

# Add KDEConnect integration
sudo dnf install nautilus-python
sudo dnf install gnome-shell-extension-gsconnect webextension-gsconnect nautilus-gsconnect

# Set apps sources
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
