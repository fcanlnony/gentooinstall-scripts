#/bin/bash
emerge sys-kernel/gentoo-kernel
emerge sys-kernel/gentoo-kernel-bin
eselect kernel set 1
wget https://github.com/glacion/genfstab/blob/master/genfstab
chmod +x genfstab
./genfstab -U / >> /etc/fstab
