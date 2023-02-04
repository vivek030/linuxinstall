sudo -i
sudo apt-get update
sudo apt install curl
sudo add-apt-repository ppa:wireguard/wireguard
sudo apt-get update
sudo apt-get install wireguard-dkms wireguard-tools
sudo apt-get install openresolv
dns = "10.6.6.1"
read -p 'Enter Email ID ' email
read -p 'Enter Friendly Name ' id
hostname = hostname
name = "$id/$hostname"
read -p 'Enter API Key ' api
json = @"
{"Email":"$email","Identifier":"$name","DNSStr":"$dns"}
"@
curl --silent  -f -k -X POST "https://newnew.korplink.com/api/v1/provisioning/peers" -H "accept: text/plain" -H "authorization: Basic $api" -H "Content-Type: application/json" -d $json -o "/etc/wireguard/wg0.conf"
sudo systemctl start wg-quick@wg0
sudo systemctl enable wg-quick@wg0
