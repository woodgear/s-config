mv /etc/apt/sources.list /etc/apt/sourses.list.backup
mv ./ali.source.list /etc/apt/sources.list
apt update
apt upgrade
apt install curl -y
apt install docker -y
apt install openvpn -y
