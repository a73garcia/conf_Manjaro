#Instalar VMWare

sudo pacman -S dkms libxcrypt-compat
cd /tmp/
git clone https://aur.archlinux.org/vmware-keymaps.git
cd vmware-keymaps
makepkg -si

cd ..
git clone https://aur.archlinux.org/vmware-workstation.git
cd vmware-workstation
makepkg -si
