#!/bin/sh
#Configuracion inicial Arch
#--------------------------

#Actualizar sistema
sudo pacman -Syyu

#Paquetes iniciales:
sudo pacman -S git wget kitty feh p7zip locate lsd bat net-tools wireless_tools zsh-syntax-highlighting zsh-autosuggestions neovim neofetch gparted

#Paquetes interes:
sudo pacman -S gimp inkscape beebeep hexchat ktorrent qbittorrent putty thunderbird keepass keepassxc code signal-desktop telegram-desktop

#Instalar aplicaciones de virtualizacion
sudo pacman -S gnome-boxes virtualbox virtualbox-guest-iso virtualbox-guest-utils
#Seleccionar nucleo del sistema

#Instalar LaTEX
sudo pacman -S texlive texmaker

#--------------------------------#
# Ver imagenes de consola        #
# kitty icat arch.jpg            #
#--------------------------------#

#Instalar Paru (UAR)
cd /tmp/
git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin
makepkg -si

#Instalar repositorio BlackArch
cd /tmp/
curl -O https://blackarch.org/strap.sh
sudo chmod +x strap.sh
sudo ./strap.sh
sudo pacman -Syyu

#Instalar doble click escape añadir sudo
cd /usr/share/
sudo mkdir zsh-sudo
sudo chown gh0stwalk3r:gh0stwalk3r zsh-sudo
cd !$
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh

#Copiar archivos configuracion Kitty
mkdir .config/kitty/
cp /run/media/gh0stwalk3r/SSD-Doc/Configuraciones/Kitty/color.ini .config/kitty/color.ini
cp /run/media/gh0stwalk3r/SSD-Doc/Configuraciones/Kitty/kitty.conf .config/kitty/kitty.conf

#Cambiar BASH
sudo usermod --shell /usr/bin/zsh gh0stwalk3r
sudo usermod --shell /usr/bin/zsh root

#Instalar PowerLevel10k en usuario
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

#Eliminamos y pegamos los archivos de configuracion
cp /run/media/gh0stwalk3r/SSD-Doc/Configuraciones/zshrc .zshrc
cp /run/media/gh0stwalk3r/SSD-Doc/Configuraciones/p10k.zsh .p10k.zsh

#Instalamos PowerLevel10k como root

#Creamos enlaces simbolicos para root de los archivos de configuracion de ZSH y P10k
sudo su
cd /root/
#En caso de existir los archivos los eliminamos y creamos los enlaces
ls -la
ln /home/gh0stwalk3r/.zshrc .zshrc
ln /home/gh0stwalk3r/.p10k.zsh .p10k.zsh

#Instalar fzf en usuario y root
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

#Añadir plugins nvim en usuarios y root
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
nvim +'hi NormalFloat guibg=#1e222a' +PackerSync

#----------------------------------------------

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

#Instalar DisplayLink
cd /tmp/
git clone https://aur.archlinux.org/evdi-git.git
cd evdi-git
makepkg -si
