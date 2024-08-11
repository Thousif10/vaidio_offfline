#!bin/bash

green() {
echo -e "\e[32m$1\e[0m"
}

blue() {
echo -e "\e[34m$1\e[0m"
}

yellow() {
echo -e "\e[33m$1\e[0m"
}

red() {
echo -e "\e[31m$1\e[0m"
}

wait_for_enter() {
echo ""
read -p "Please Enter to Continue..."
}


# Function to print a styled banner
banner() {
  local width=50
  local text="vaidio offline script by THOUSIF K"
  yellow "Script 3"
  # Print top border
  blue "$(printf '%*s' "$width" | tr ' ' '-')"

  # Print centered text
  red "$(printf "%*s" $(( (width + ${#text}) / 2 )) "$text")"

  # Print bottom border
  blue "$(printf '%*s' "$width" | tr ' ' '-')"
}

banner

# check if running root
if [[ $EUID -ne 0 ]]; then
    red "This script must be run as root"
exit 1
fi

blue "Installing Netplan..."
sudo apt-get update
sudo apt-get install ./netplan.io_1.0.1-2_amd64.deb -y
sudo apt-get install -y ./netplan-generator_1.0.1-2_amd64.deb
sudo chmod 600 /etc/netplan/*.yaml
green "Permission Updated..."

sudo echo "#netcfg.yaml" > /etc/netplan/01-netcfg.yaml


# Determine active Ethernet interface
active_interface=$(ip route get 1 | grep -o 'dev.*' | awk '{print $2}')
print_green "Active Ethernet Interface: $active_interface"

# Network YAML configuration
network_yaml="
network:
  version: 2
  renderer: networkd
  ethernets:
    $active_interface:
      addresses:
        - 172.16.25.63/24
      dhcp4: false
      dhcp6: false
      routes:
      - to: default
        via: 172.16.25.254
      nameservers:
        addresses: [8.8.4.4, 8.8.8.8]
"

#--------5. Configure Storage---------


blue "Configure Storage"
green "Follow the commands"
yellow "mkfs.ext4 /dev/sda1"
yellow "mkdir /mnt/data"
yellow "mount -t ext4 /dev/sda1 /mnt/data"
wait_for_enter

blue "Auto mount HDD"
echo "/dev/sda1  /mnt/data     ext4  defaults 0 0" >> /etc/fstab

blue "Install Admin Portal"
cd IY01
sudo apt-get install -y ./admin-portal_7.2.0-1_all.deb
# Determine the active Ethernet interface
active_interface=$(ip route get 1 | grep -o 'dev.*' | awk '{print $2}')

# Get the IP address of the active Ethernet interface
ip_address=$(ip -o -4 addr show dev "$active_interface" | awk '{print $4}' | cut -d/ -f1)

# Check if IP address is obtained
if [[ -z "$ip_address" ]]; then
    echo "No active Ethernet interface found or no IP address assigned."
    exit 1
fi

# Construct the URL
url="http://$ip_address:8000"

# Display the URL
print_green "URL: $url"


#-----------Install Docker----------------

green "Installing Docker utility"
sudo apt-get install 


green "installing vaidio"
sudo mkdir /etc/vaidio
cd ../IY02
mv offline-ainvr-app_7.2.0-1.tar.gz /etc/vaidio
tar zxvf offline-ainvr-app_7.2.0-1.tar.gz -C /etc/vaidio/

red "add last command"
