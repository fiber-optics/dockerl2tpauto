#!/bin/bash
apt update
apt-get install  -y   apt-transport-https     ca-certificates     curl     gnupg-agent     software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

apt update
apt-get install -y docker-ce docker-ce-cli containerd.io
docker pull hwdsl2/ipsec-vpn-server
echo "VPN_IPSEC_PSK=pskkey
VPN_USER=vpnuser
VPN_PASSWORD=vpnpassword" > vpn.env
docker run --name ipsec-vpn-server --env-file ./vpn.env --restart=always -p 500:500/udp -p 4500:4500/udp -d --privileged hwdsl2/ipsec-vpn-server
sleep 2
docker logs ipsec-vpn-server
