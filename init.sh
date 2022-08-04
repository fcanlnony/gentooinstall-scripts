#/bin/bash
echo "Welcome to the Gentoo GNU/Linux build script"
echo "Currently, the script only supports the ext4 file system"
ntpd -q -g
read -p 'enter your root_partition : ' root_partition
echo mount >> gentoomount.sh $root_partition /mnt/gentoo
read -p 'enter your swap_partition : ' swap_partition
echo mkswap >> gentoomount.sh $swap_partition
echo swapon >> gentoomount.sh $swap_partition
chmod +x gentoomount.sh
./gentoomount.sh
rm gentoomount.sh
cd /mnt/gentoo
read -n1 -p "Are you a Chinese user? [Y/N]? " answer
case $answer in
    Y|y)
	wget https://mirrors.ustc.edu.cn/gentoo/releases/amd64/autobuilds/current-stage3-amd64-desktop-openrc/stage3-amd64-desktop-openrc-20220731T170548Z.tar.xz ;;
    N|n)
	wget https://bouncer.gentoo.org/fetch/root/all/releases/amd64/autobuilds/20220731T170548Z/stage3-amd64-desktop-openrc-20220731T170548Z.tar.xz ;;
esac
tar xpvf stage3-*.tar.xz --xattrs-include='*.*' --numeric-owner
echo 'MAKEOPTS="-j2"' >> /mnt/gentoo/etc/portage/make.conf
mirrorselect -i -o >> /mnt/gentoo/etc/portage/make.conf
mkdir --parents /mnt/gentoo/etc/portage/repos.conf
cp /mnt/gentoo/usr/share/portage/config/repos.conf /mnt/gentoo/etc/portage/repos.conf/gentoo.conf
cp --dereference /etc/resolv.conf /mnt/gentoo/etc/
mount --types proc /proc /mnt/gentoo/proc
mount --rbind /sys /mnt/gentoo/sys
mount --rbind /dev /mnt/gentoo/dev
mount --bind /run /mnt/gentoo/run
test -L /dev/shm && rm /dev/shm && mkdir /dev/shm
mount --types tmpfs --options nosuid,nodev,noexec shm /dev/shm
chmod 1777 /dev/shm /run/shm
echo 'Please do it manually : chroot /mnt/gentoo /bin/bash && source /etc/profile && export PS1="(chroot) ${PS1}"'
