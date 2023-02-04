sudo -i
apt update
apt install wireguard-tools
apt install openresolv
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
systemctl start wg-quick@wg0
systemctl enable wg-quick@wg0
