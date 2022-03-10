# Clean /var
sudo flatpak uninstall --unused
sudo journalctl --vacuum-size=1M
sudo rm -rf /var/cache/PackageKit/
sudo dnf clean all --enablerepo=\*
docker stop $(docker ps -aq)
sudo docker system prune
sudo rm -rf /var/lib/systemd/coredump/

# Clean /usr
sudo dnf autoremove
sudo fc-cache
sudo npm list -g --depth=0. | grep -v npm | awk -F ' ' '{print $2}' | awk -F '@' '{print $1}' | sudo xargs npm remove -g
