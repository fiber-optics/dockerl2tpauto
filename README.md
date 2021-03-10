# dockerl2tpauto
install docker and ipsec-vpn-server in automatic mode

Change line below
echo "VPN_IPSEC_PSK=YOUR_PSK_KEY
VPN_USER=YOUR_USER
VPN_PASSWORD=YOUR_PASSWORD" > vpn.env
docker run --name ipsec-vpn-server --env-file ./vpn.env --restart=always -p 500:500/udp -p 4500:4500/udp -d --privileged hwdsl2/ipsec-vpn-server
sleep 2
docker logs ipsec-vpn-server
