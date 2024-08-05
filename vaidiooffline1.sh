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
  "net-tools"
  "vim"
  "dkms"
  "dpkg"
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

apt-get install ./alien_8.95.5_all.deb
apt-get install ./aptitude-common_0.8.13-3ubuntu1_all.deb
apt-get install ./aptitude_0.8.13-ubuntu1_amd64.deb
apt-get install ./apt-offline_1.8.4-1_all.deb
apt-get install ./at_3.2.5-1ubuntu1_amd64.deb
apt-get install ./autoconf_2.71-2_all.deb
apt-get install ./automake_1_3a1.16.5-.1.3_all.deb
apt-get install ./autopoint_0.21-4ubuntu4_all.deb
apt-get install ./autotools-dev_20220109.1_all.deb
apt-get install ./binutils_2.38-4ubuntu2.6_amd64.
apt-get install ./binutils-common_2.38.4ubuntu2.6_amd64.deb
apt-get install ./binutils-x86-64-linux-gnu_2.38-4ubuntu2.6_amd64.deb
apt-get install ./bsdmainutils_12.1.7+nmu3ubuntu2_all.deb
apt-get install ./build-essential_12.9ubuntu3_amd64.deb
apt-get install ./ca-certificates_20230311ubuntu0.22.04.1_all.deb
apt-get install ./containerd.io_1.6.31-1_amd64.deb
apt-get install ./cpp-11_11.4.0-1ubuntu1~22.04_amd64.deb
apt-get install ./cpp-12_12.3.0-1ubuntu1~22.04_amd64.deb
apt-get install ./curl_7.81.0-1ubuntu1.16_amd64.deb
apt-get install ./dctrl-tools_2.24-3build2_amd64.deb
apt-get install ./debhelper_13.6ubuntu1_all.deb
apt-get install ./debian-archive-keyring_2021.1.1ubuntu2_all.deb
apt-get install ./debugedit_1_3a5.0-4build1_amd64.deb
apt-get install ./dh-autoreconf_20_all.deb
apt-get install ./dh-strip-nondeterminism_1.13.0-1_all.deb
apt-get install ./dkms_2.8.7-2ubuntu2.2_all.deb
apt-get install ./docker-ce_5_3a20.10.24~3-0~ubuntu-jammy_amd64.deb
apt-get install ./docker-ce-cli_5_3a20.10.24~3-0~ubuntu-jammy_amd64.deb
apt-get install ./docker-ce-rootless-extras_5_3a26.0.1-1~ubuntu.22.04~jammy_amd64.deb
apt-get install ./dpkg-1.21.1ubuntu2.3amd64.deb
apt-get install ./dpkg-dev_1.21.1ubuntu2.3_all.deb
apt-get install ./dwz_0.14-1build2_amd64.deb
apt-get install ./fakeroot_1.28-1ubuntu1_amd64.deb
apt-get install ./g++_4_3a11.2.0-1ubuntu1_amd64.deb
apt-get install ./g++-11_11.4.0-1ubuntu1~22.04_amd64.deb
apt-get install ./gcc_4_3a11.2.0-1ubuntu1_amd64.deb
apt-get install ./gcc-11_11.4.0-1ubuntu1~22.04._amd64.deb
apt-get install ./gcc-11-base_11.4.0-1ubuntu1~22.04_amd64.deb
apt-get install ./gcc-12_12.3.0-1ubuntu1~22.04_amd64.deb
apt-get install ./gcc-12-base_12.3.0-1ubuntu1~22.04_amd64.deb
apt-get install ./gettext_0.21-4ubuntu4_amd64.deb
apt-get install ./git_1_3a2.34.1-1ubuntu1.10_amd64.deb
apt-get install ./gsasl-common_1.10.0-5_all.deb
apt-get install ./guile-3.0-libs_3.0.7-1_amd64.deb
apt-get install ./intltool-debian_0.35.0+20060710.5_all.deb
apt-get install ./libalgorithm-diff-perl_1.201-1_all.deb
apt-get install ./libalgorithm-diff-xs-perl_0.04-6build3_amd64.deb
apt-get install ./libalgorithm-merge-perl_0.08-3_all.deb
apt-get install ./libarchive-cpio-perl_0.10-1.1_all.deb
apt-get install ./libarchive-zip-perl_1.68-1_all.deb
apt-get install ./libasan6_11.4.0-1ubuntu1~22.04_amd64.deb
apt-get install ./libatomic1_12.3.0-1ubuntu1~22.04_amd64.deb
apt-get install ./libbinutils_2.38-4ubuntu2.6_amd64.deb
apt-get install ./libboost-iostreams1.74.0_1.74.0-14ubuntu3_amd64.deb
apt-get install ./libc6_2.35-0ubuntu3.6_amd64.deb
apt-get install ./libc6-dbg_2.35-0ubuntu3.6_amd64.deb
apt-get install ./libc6-dev_2.35-0ubuntu3.6_amd64.deb
apt-get install ./libcc1-0_12.3.0-1ubuntu1~22.04_amd64.deb
apt-get install ./libc-dev-bin_2.35-0ubuntu3.6_amd64.deb
apt-get install ./libc-devtools_2.35-0ubuntu3.6_amd64.deb
apt-get install ./libcrypt-dev_1_3a4.4.27-1_amd64.deb
apt-get install ./libctf0_2.38-4ubuntu2.6_amd64.deb
apt-get install ./libctf-nobfd0_2.38-4ubuntu2.6_amd64.deb
apt-get install ./libcurl4_7.81.0-1ubuntu1.16_amd64.deb
apt-get install ./libcwidget4_0.5.18-5build1_amd64.deb
apt-get install ./libdebhelper-perl_13.6ubuntu1_all.deb
apt-get install ./libdpkg-perl_1.21.1ubuntu2.3_all.deb
apt-get install ./liberror-perl_0.17029-1_all.deb
apt-get install ./libfakeroot_1.28-1ubuntu1_amd64.deb
apt-get install ./libfile-fcntllock-perl_0.22-3build7_amd64.deb
apt-get install ./libfile-stripnondeterminism-perl_1.13.0-1_all.deb
apt-get install ./libfsverity0_1.4-1~exp1build1_amd64.deb
apt-get install ./libgc1_1_3a8.0.6-1.1build1_amd64.deb
apt-get install ./libgcc-11-dev_11.4.0-1ubuntu1~22.04_amd64.deb
apt-get install ./libgcc-12-dev_12.3.0-1ubuntu1~22.04_amd64.deb
apt-get install ./libgcc-s1_12.3.0-1ubuntu1~22.04_amd64.deb
apt-get install ./libgomp1_12.3.0-1ubuntu1~22.04_amd64.deb
apt-get install ./libgsasl7_1.10.0-5_amd64.deb
apt-get install ./libitm1_12.3.0-1ubuntu1~22.04_amd64.deb
apt-get install ./liblsan0_12.3.0-1ubuntu1~22.04_amd64.deb
apt-get install ./libltdl-dev_2.4.6-15build2_amd64.deb
apt-get install ./liblua5.3-0_5.3.6-1build

green "Packages Installed, press enter to reboot..."
wait_for_enter
sudo reboot
