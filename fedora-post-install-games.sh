# *************
# Tools
# *************

# Steam: FreeDesktop, Proprietary, X.org
sudo flatpak install flathub com.valvesoftware.Steam
sudo dnf install steam-devices
sudo dnf install winetricks
sudo dnf install protontricks

# Creates desktop entries for Steam games.
git clone git@github.com:gasinvein/steam-desktop-updater.git
./steam-desktop-updater/steam_desktop_updater.py ~/.var/app/com.valvesoftware.Steam/data/Steam

# JSTest: Gnome, FLOSS, Wayland
sudo flatpak install flathub io.gitlab.jstest_gtk.jstest_gtk


# *************
# Games
# *************

# Beyond All Reason: FreeDesktop, FLOSS, ???
sudo flatpak install flathub info.beyondallreason.bar

# Sonic 3 Angel Island Revisited: Gnome, Proprietary, ???
sudo flatpak install flathub org.sonic3air.Sonic3AIR


# *************
# Emulators for old gens
# *************

# Ludo (Nec, NES, SNES, SMS, SMD): FreeDesktop, FLOSS, ???
# https://github.com/libretro/ludo/wiki
git clone https://github.com/pdureau/flatpak-manifests.git
cd flatpak-manifests
make ludo
flatpak remote-add --user local "file://`pwd`/repo" --no-gpg-verify
flatpak install --user local com.libretro.Ludo


# *************
# Emulators for 5th gen
# *************

# DuckStation (PS1): KDE, ???, ???
sudo flatpak install flathub org.duckstation.DuckStation

# Kronos (Saturn): ???, ???, ???
sudo dnf copr enable jdwininger/kronos
sudo dnf install kronos 

# m64p (N64):: KDE, ???, ???
# sudo flatpak install flathub io.github.m64p.m64p


# *************
# Emulators for 6th gen
# *************

# Flycast (Dreamcast): FreeDesktop, FLOSS, Wayland
# Challenger: https://redream.io/
sudo flatpak install org.flycast.Flycast

# Dolphin (Gamecube/Wii): KDE, FLOSS, X.org
sudo flatpak install flathub org.DolphinEmu.dolphin-emu

# PCSX2 (PS2): FreeDesktop, FLOSS, ???
# sudo flatpak install flathub net.pcsx2.PCSX2

# Xemu (XBOX): FreeDesktop, FLOSS, ???
# sudo flatpak install flathub app.xemu.xemu


# *************
# Emulators for 7th gen
# *************

# RPCS3 (PS3): KDE, FLOSS, Wayland
sudo flatpak install flathub net.rpcs3.RPCS3
# Controller config: https://wiki.rpcs3.net/index.php?title=Help:Controller_Configuration


# *************
# Emulators for 8th gen
# *************

# Yuzu (Nintendo Switch): KDE, FLOSS, X.org
sudo flatpak install org.yuzu_emu.yuzu
