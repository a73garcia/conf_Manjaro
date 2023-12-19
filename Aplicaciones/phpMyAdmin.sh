#Instalar Apache
pacman -Syu
sudo pacman -S apache

systemctl start httpd
systemctl enable httpd
systemctl status httpd

#Instalar MariaDB
sudo pacman -Syu
sudo pacman -S mariadb
sudo mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
sudo systemctl enable mariadb --now
mariadb --version
systemctl status mariadb

mysql_secure_installation
    # Switch to unix_socket authentication [Y/n] Y
    # Change the root password? [Y/n] Y
    # New password:
    # Re-enter new password:
    # Remove anonymous users? [Y/n] Y
    # Disallow root login r
    # emotely? [Y/n] Y
    # Remove test database and access to it? [Y/n] Y
    # Reload privilege tables now? [Y/n] Y

#Instalar PHP
sudo pacman -S php php-apache
sudo nano /etc/php/php.ini
    # Qitar el ; del inicio de la linea
    # extension=bz2.so
    # extension=gd
    # extension=iconv
    # extension=pdo_mysql
    # extension=mcrypt.so
    # extension=mysqli.so

    # Modificar
    # post_max_size = 64M
    # max_execution_time = 180
    # upload_max_filesize = 64M
    # max_input_time = 180
    # max_input_vars = 3000

#Instalar phpMyAdmin
sudo pacman -S phpmyadmin
sudo nano /etc/httpd/conf/httpd.conf
    # Comentar la primera y descomentar la segunda
    # #LoadModule mpm_event_module modules/mod_mpm_event.so
    # LoadModule mpm_prefork_module modules/mod_mpm_prefork.so

    # Añadir al final del archivos
    # LoadModule php_module modules/libphp.so
    # AddHandler php7-script php
    # Include conf/extra/php_module.conf
    # Include conf/extra/phpmyadmin.conf

sudo nano /etc/httpd/conf/extra/phpmyadmin.conf

    #Añadimos
    Alias /phpmyadmin "/usr/share/webapps/phpMyAdmin"
    <Directory "/usr/share/webapps/phpMyAdmin">
    DirectoryIndex index.php
    AllowOverride All
    Options FollowSymlinks
    Require all granted
    </Directory>

sudo nano /etc/webapps/phpmyadmin/config.inc.php
    $cfg['blowfish_secret'] = 'JOFw435365IScA&Q!cDugr!lSfuAz*OW'; /* YOU MUST FILL IN THIS FOR COOKIE AUTH!$ /**

    #Añadimos al final
    $cfg['TempDir'] = '/tmp/phpmyadmin';

systemctl restart httpd

# URL de acceso: http://localhost/phpmyadmin
