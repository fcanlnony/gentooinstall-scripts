#/bin/bash
emerge sys-kernel/gentoo-kernel
emerge sys-kernel/gentoo-kernel-bin
eselect kernel set 1
emerge sys-fs/genfstab
genfstab -U / >> /etc/fstab
