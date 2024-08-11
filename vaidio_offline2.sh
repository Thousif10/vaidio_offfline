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
  yellow "Script 2"
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



green "Switching boot target to text..."
#  sudo systemctl set-default multi-user.target

blue "Checking basic utilities..."

# Function to check if a command exists
check_command() {
  if command -v "$1" &> /dev/null; then
    green "${1} is installed"
  else
    red "${1} is not installed"
  fi
}

# List of utilities to check
utilities=(
  "curl"
  "ntpdate"
  "ssh"
  "ifconfig"
  "nano"
  "dkms"
  "dpkg"
)


# Check each utility
for utility in "${utilities[@]}"; do
  check_command "$utility"
done
wait_for_enter

#----------Second Script---------------
sudo su
cd 02
./NVIDIA-Linux-x86_64-525.147.05.run
green "NVIDIA Drive Installed"
blue "Press Enter to reboot..."
wait_for_enter
reboot
