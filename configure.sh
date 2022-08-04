#/bin/bash
read -p 'enter your host name : ' hostname_putin
echo 'hostname=' > /etc/conf.d/hostname '"'$hostname_putin'"'
echo 'This is \n.\O (\s \m \r) \t' > /etc/issue ;;
emerge net-misc/dhcpcd
rc-update add dhcpcd default
rc-service dhcpcd start
emerge --noreplace net-misc/netifrc
echo 'config_eth0="192.168.0.2 netmask 255.255.255.0 brd 192.168.0.255"
routes_eth0="default via 192.168.0.1"
config_eth0="dhcp"' > /etc/conf.d/net
cd /etc/init.d
ln -s net.lo net.eth0
rc-update add net.eth0 default
echo '127.0.0.1' > /etc/hosts $hostname_putin'.homenetwork'' '$hostname_putin' ''localhost'
echo 'set your root user password'
passwd
emerge app-admin/sysklogd
rc-update add sysklogd default
