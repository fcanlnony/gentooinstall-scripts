#/bin/bash
read -p 'enter your efi_system_partition : ' efi_system_partition
echo mount >> gentoomount.sh  $efi_system_partition /mnt/gentoo/boot
chmod +x gentoomount.sh
./gentoomount.sh
rm gentoomount.sh
emerge-webrsync
eselect profile set default/linux/amd64/17.1/desktop
echo 'USE="gtk qt5 dvd alsa cdr"' >> /etc/portage/make.conf
echo 'ACCEPT_LICENSE="*"' >> /etc/portage/make.conf
emerge --update --deep --newuse @world
read -p 'enter your time zone' time_zone
echo $time_zone > /etc/timezone
emerge --config sys-libs/timezone-data
echo "en_US ISO-8859-1
en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
eselect locale set en_US.UTF-8
echo 'LANG="en_US.UTF-8"
LC_COLLATE="C.UTF-8"' > /etc/env.d/02locale
echo 'Please do it manually : env-update && source /etc/profile && export PS1="(chroot) ${PS1}"'
