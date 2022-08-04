# gentoo-scripts
Gentoo install scripts write in bash

# how to use this scripts
                                                                                                                                                           
root # cd ~                                                                                                                                                 
root # git clone https://github.com/fcanlnony/gentoo-scripts.git                                                                                           
root # cd gentoo-scripts && chmod +x init.sh                                                                                                               
root # ./init.sh                                                                                                                                           
root # cd ~/gentoo-scripts && mv kernel.sh configure.sh bootloader.sh tmp_env.sh /mnt/gentoo/                                                               
root # chroot /mnt/gentoo /bin/bash                                                                                                                         
root # source /etc/profile                                                                                                                                 
root # export PS1="(chroot) ${PS1}"                                                                                                                         
                                                                                                                                                           
(chroot)root # chmod +x *.sh                                                                                                                               
(chroot)root # /tmp_env.sh                                                                                                                                 
(chroot)root # env-update                                                                                                                                   
(chroot)root # source /etc/profile                                                                                                                         
(chroot)root # export PS1="(chroot ${PS1}"                                                                                                                 
                                                                                                                                                           
(chroot)root # /kernel.sh                                                                                                                                   
(chroot)root # /configure.sh                                                                                                                               
(chroot)root # /bootloader.sh                                                                                                                               
(chroot)root # exit                                                                                                                                         
cdimage ~# cd ~/gentoo-scripts                                                                                                                             
cdimage ~# chmod +x remove.sh && ./remove.sh                                                                                                               
cdimage ~# reboot                                                                                                                                           
                                                                                                                                                           
# Warring
*This scripts only support ext4 filesystem                                                                                                                 
*I assume by default that you don't have a DNS domain name and a nix domain name                                                                           
