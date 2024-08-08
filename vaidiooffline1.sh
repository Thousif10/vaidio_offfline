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
  yellow "Script 1"
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
  "dkms"
  "dpkg"
  "nano"
)


# Check each utility
for utility in "${utilities[@]}"; do
  check_command "$utility"
done
wait_for_enter

cd 01
sudo apt --fix-broken install

sudo dpkg -i openssh*
sudo su

apt-get install -y ./alien_8.95.5_all.deb
apt-get install -y ./aptitude-common_0.8.13-3ubuntu1_all.deb
apt-get install -y ./aptitude_0.8.13-ubuntu1_amd64.deb
apt-get install -y ./apt-offline_1.8.4-1_all.deb
apt-get install -y ./at_3.2.5-1ubuntu1_amd64.deb
apt-get install -y ./autoconf_2.71-2_all.deb
apt-get install -y ./automake_1_3a1.16.5-.1.3_all.deb
apt-get install -y ./autopoint_0.21-4ubuntu4_all.deb
apt-get install -y./autotools-dev_20220109.1_all.deb
apt-get install -y ./binutils_2.38-4ubuntu2.6_amd64.
apt-get install -y ./binutils-common_2.38.4ubuntu2.6_amd64.deb
apt-get install -y ./binutils-x86-64-linux-gnu_2.38-4ubuntu2.6_amd64.deb
apt-get install -y ./bsdmainutils_12.1.7+nmu3ubuntu2_all.deb
apt-get install -y ./build-essential_12.9ubuntu3_amd64.deb
apt-get install -y ./ca-certificates_20230311ubuntu0.22.04.1_all.deb
apt-get install -y ./containerd.io_1.6.31-1_amd64.deb
apt-get install -y ./cpp-11_11.4.0-1ubuntu1~22.04_amd64.deb
apt-get install -y ./cpp-12_12.3.0-1ubuntu1~22.04_amd64.deb
apt-get install -y ./curl_7.81.0-1ubuntu1.16_amd64.deb
apt-get install -y ./dctrl-tools_2.24-3build2_amd64.deb
apt-get install -y ./debhelper_13.6ubuntu1_all.deb
apt-get install -y ./debian-archive-keyring_2021.1.1ubuntu2_all.deb
apt-get install -y ./debugedit_1_3a5.0-4build1_amd64.deb
apt-get install -y ./dh-autoreconf_20_all.deb
apt-get install -y ./dh-strip-nondeterminism_1.13.0-1_all.deb
apt-get install -y ./dkms_2.8.7-2ubuntu2.2_all.deb
apt-get install -y ./docker-ce_5_3a20.10.24~3-0~ubuntu-jammy_amd64.deb
apt-get install -y ./docker-ce-cli_5_3a20.10.24~3-0~ubuntu-jammy_amd64.deb
apt-get install -y ./docker-ce-rootless-extras_5_3a26.0.1-1~ubuntu.22.04~jammy_amd64.deb
apt-get install -y ./dpkg-1.21.1ubuntu2.3amd64.deb
apt-get install -y ./dpkg-dev_1.21.1ubuntu2.3_all.deb
apt-get install -y ./dwz_0.14-1build2_amd64.deb
apt-get install -y ./fakeroot_1.28-1ubuntu1_amd64.deb
apt-get install -y ./g++_4_3a11.2.0-1ubuntu1_amd64.deb
apt-get install -y ./g++-11_11.4.0-1ubuntu1~22.04_amd64.deb
apt-get install -y ./gcc_4_3a11.2.0-1ubuntu1_amd64.deb
apt-get install -y ./gcc-11_11.4.0-1ubuntu1~22.04._amd64.deb
apt-get install -y ./gcc-11-base_11.4.0-1ubuntu1~22.04_amd64.deb
apt-get install -y ./gcc-12_12.3.0-1ubuntu1~22.04_amd64.deb
apt-get install -y ./gcc-12-base_12.3.0-1ubuntu1~22.04_amd64.deb
apt-get install -y ./gettext_0.21-4ubuntu4_amd64.deb
apt-get install -y ./git_1_3a2.34.1-1ubuntu1.10_amd64.deb
apt-get install -y ./gsasl-common_1.10.0-5_all.deb
apt-get install -y ./guile-3.0-libs_3.0.7-1_amd64.deb
apt-get install -y ./intltool-debian_0.35.0+20060710.5_all.deb
apt-get install -y ./libalgorithm-diff-perl_1.201-1_all.deb
apt-get install -y ./libalgorithm-diff-xs-perl_0.04-6build3_amd64.deb
apt-get install -y ./libalgorithm-merge-perl_0.08-3_all.deb
apt-get install -y ./libarchive-cpio-perl_0.10-1.1_all.deb
apt-get install -y ./libarchive-zip-perl_1.68-1_all.deb
apt-get install -y ./libasan6_11.4.0-1ubuntu1~22.04_amd64.deb
apt-get install -y ./libatomic1_12.3.0-1ubuntu1~22.04_amd64.deb
apt-get install -y ./libbinutils_2.38-4ubuntu2.6_amd64.deb
apt-get install -y ./libboost-iostreams1.74.0_1.74.0-14ubuntu3_amd64.deb
apt-get install -y ./libc6_2.35-0ubuntu3.6_amd64.deb
apt-get install -y ./libc6-dbg_2.35-0ubuntu3.6_amd64.deb
apt-get install -y ./libc6-dev_2.35-0ubuntu3.6_amd64.deb
apt-get install -y ./libcc1-0_12.3.0-1ubuntu1~22.04_amd64.deb
apt-get install -y ./libc-dev-bin_2.35-0ubuntu3.6_amd64.deb
apt-get install -y ./libc-devtools_2.35-0ubuntu3.6_amd64.deb
apt-get install -y ./libcrypt-dev_1_3a4.4.27-1_amd64.deb
apt-get install -y ./libctf0_2.38-4ubuntu2.6_amd64.deb
apt-get install -y ./libctf-nobfd0_2.38-4ubuntu2.6_amd64.deb
apt-get install -y ./libcurl4_7.81.0-1ubuntu1.16_amd64.deb
apt-get install -y ./libcwidget4_0.5.18-5build1_amd64.deb
apt-get install -y ./libdebhelper-perl_13.6ubuntu1_all.deb
apt-get install -y ./libdpkg-perl_1.21.1ubuntu2.3_all.deb
apt-get install -y ./liberror-perl_0.17029-1_all.deb
apt-get install -y ./libfakeroot_1.28-1ubuntu1_amd64.deb
apt-get install -y ./libfile-fcntllock-perl_0.22-3build7_amd64.deb
apt-get install -y ./libfile-stripnondeterminism-perl_1.13.0-1_all.deb
apt-get install -y ./libfsverity0_1.4-1~exp1build1_amd64.deb
apt-get install -y ./libgc1_1_3a8.0.6-1.1build1_amd64.deb
apt-get install -y ./libgcc-11-dev_11.4.0-1ubuntu1~22.04_amd64.deb
apt-get install -y ./libgcc-12-dev_12.3.0-1ubuntu1~22.04_amd64.deb
apt-get install -y ./libgcc-s1_12.3.0-1ubuntu1~22.04_amd64.deb
apt-get install -y ./libgomp1_12.3.0-1ubuntu1~22.04_amd64.deb
apt-get install -y ./libgsasl7_1.10.0-5_amd64.deb
apt-get install -y ./libitm1_12.3.0-1ubuntu1~22.04_amd64.deb
apt-get install -y ./liblsan0_12.3.0-1ubuntu1~22.04_amd64.deb
apt-get install -y ./libltdl-dev_2.4.6-15build2_amd64.deb
apt-get install -y ./liblua5.3-0_5.3.6-1build

#------------utilities------------

apt-get install -y ./curl_7.81.0-1ubuntu1.17_amd64.deb
apt-get install -y ./net-tools.deb
apt-get install -y ./ntpdate_4.2.8p15+dfsg-1ubuntu2_amd64.deb


wait_for_enter

blue "Checking basic utilities Installed..."

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
  "dkms"
  "dpkg"
  "nano"
)


# Check each utility
for utility in "${utilities[@]}"; do
  check_command "$utility"
done
green "Packages Installed, press enter to reboot..."
wait_for_enter

sudo reboot
