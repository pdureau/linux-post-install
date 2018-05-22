# Clean /var
sudo journalctl --vacuum-size=1M
sudo rm -rf /var/cache/PackageKit/
sudo dnf clean all --enablerepo=\*

# Clean /usr
sudo dnf autoremove
