# *************
# System
# *************

# Firmware: Gnome, FLOSS, Wayland
sudo flatpak install flathub org.gnome.Firmware

# Flatseal: Gnome, FLOSS, Wayland
sudo flatpak install flathub com.github.tchx84.Flatseal

# Extensions: Gnome, FLOSS, Wayland
sudo flatpak install flathub org.gnome.Extensions

# Mediawriter: KDE, FLOSS, Wayland
sudo flatpak install flathub org.fedoraproject.MediaWriter


# *************
# Sync
# *************

# Transmission: Gnome, FLOSS, Wayland
sudo flatpak install flathub com.transmissionbt.Transmission

# Filezilla: FreeDesktop, FLOSS, Wayland
sudo flatpak install flathub org.filezillaproject.Filezilla

# Syncthing: Gnome, FLOSS, Wayland
sudo flatpak install flathub me.kozec.syncthingtk


# *************
# Media
# *************

# Shotwell: Gnome, FLOSS, Wayland
# We don't use the flatpak because we want the unstable 0.31 version.
sudo dnf install shotwell

# VLC: KDE, FLOSS, X.org
# VLC 4.0 will support Wayland
sudo flatpak install flathub org.videolan.VLC

# Celluloid (Gnome MPV): Gnome, FLOSS, Wayland
sudo flatpak install flathub io.github.celluloid_player.Celluloid

# Lollypop: Gnome, FLOSS, Wayland
sudo flatpak install flathub org.gnome.Lollypop


# *************
# Productivity
# *************

# LibreOffice: FreeDesktop, FLOSS, Wayland
# Already in Fedora Workstation.


# *************
# Creativity
# *************

# Gimp: Gnome, FLOSS, Wayland
sudo flatpak install flathub org.gimp.GIMP

# Inkscape: Gnome, FLOSS, Wayland
sudo flatpak install flathub org.inkscape.Inkscape

# Audacity: FreeDesktop, FLOSS, X.org
sudo flatpak install flathub org.audacityteam.Audacity

# MuseScore: KDE, FLOSS, X.org
sudo flatpak install flathub org.musescore.MuseScore

# Gydl: Gnome, FLOSS, Wayland
sudo flatpak install flathub com.github.JannikHv.Gydl

# Pulse Effects: Gnome, FLOSS, Wayland
sudo flatpak install flathub com.github.wwmm.pulseeffects

# MKV Toolnix: KDE, FLOSS, Wayland
sudo flatpak install flathub org.bunkus.mkvtoolnix-gui


# *************
# Messaging
# *************

# Thunderbird: FreeDesktop, FLOSS, Wayland
sudo flatpak install flathub org.mozilla.Thunderbird

# Liferea: Gnome, FLOSS, Wayland
sudo dnf install liferea

# Newsflash: Gnome, FLOSS, Wayland
sudo flatpak install flathub com.gitlab.newsflash

# Signal: FreeDesktop, FLOSS, X.org
sudo flatpak install flathub org.signal.Signal


# *************
# Games
# *************

# Steam: FreeDesktop, Proprietary, X.org
sudo flatpak install flathub com.valvesoftware.Steam
# Work around common problems in Proton.
sudo dnf install winetricks

# JSTest: Gnome, FLOSS, Wayland
sudo flatpak install flathub io.gitlab.jstest_gtk.jstest_gtk


# *************
# Games: Emulators
# *************

# Ludo (Nec, NES, SNES, SMS, SMD): FreeDesktop, FLOSS, ???
# https://github.com/libretro/ludo/wiki
git clone https://github.com/pdureau/flatpak-manifests.git
cd flatpak-manifests
make ludo
flatpak remote-add --user local "file://`pwd`/repo" --no-gpg-verify
flatpak install --user local com.libretro.Ludo
