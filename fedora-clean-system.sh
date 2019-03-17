# Clean /var
sudo flatpak uninstall --unused
sudo journalctl --vacuum-size=1M
sudo rm -rf /var/cache/PackageKit/
sudo dnf clean all --enablerepo=\*
sudo docker system prune

# Clean /usr
sudo dnf autoremove
