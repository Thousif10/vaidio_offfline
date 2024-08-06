#!/bin/bash

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

# Check if running as root
if [[ $EUID -ne 0 ]]; then
  red "This script must be run as root"
  exit 1
fi

green "Switching boot target to text..."
# sudo systemctl set-default multi-user.target

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

# Function to install and verify package
install_package() {
  local package_file="$1"
  sudo dpkg -i "$package_file"
  local package_name="${package_file%%_*}"
  if dpkg -s "$package_name" &> /dev/null; then
    green "$package_name installed successfully"
  else
    red "$package_name installation failed"
  fi
}

# List of package files to install
packages=(
  "alien_8.95.5_all.deb"
  "aptitude-common_0.8.13-3ubuntu1_all.deb"
  "aptitude_0.8.13-ubuntu1_amd64.deb"
  "apt-offline_1.8.4-1_all.deb"
  "at_3.2.5-1ubuntu1_amd64.deb"
  "autoconf_2.71-2_all.deb"
  "automake_1_3a1.16.5-.1.3_all.deb"
  "autopoint_0.21-4ubuntu4_all.deb"
  "autotools-dev_20220109.1_all.deb"
  "binutils_2.38-4ubuntu2.6_amd64.deb"
  "binutils-common_2.38-4ubuntu2.6_amd64.deb"
  "binutils-x86-64-linux-gnu_2.38-4ubuntu2.6_amd64.deb"
  "bsdmainutils_12.1.7+nmu3ubuntu2_all.deb"
  "build-essential_12.9ubuntu3_amd64.deb"
  "ca-certificates_20230311ubuntu0.22.04.1_all.deb"
  "containerd.io_1.6.31-1_amd64.deb"
  "cpp-11_11.4.0-1ubuntu1~22.04_amd64.deb"#!/bin/bash

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

# Check if running as root
if [[ $EUID -ne 0 ]]; then
  red "This script must be run as root"
  exit 1
fi

green "Switching boot target to text..."
# sudo systemctl set-default multi-user.target

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

# Function to install and verify package
install_package() {
  local package_file="$1"
  sudo dpkg -i "$package_file"
  local package_name="${package_file%%_*}"
  if dpkg -s "$package_name" &> /dev/null; then
    green "$package_name installed successfully"
  else
    red "$package_name installation failed"
  fi
}

# List of package files to install
packages=(
  "alien_8.95.5_all.deb"
  "aptitude-common_0.8.13-3ubuntu1_all.deb"
  "aptitude_0.8.13-ubuntu1_amd64.deb"
  "apt-offline_1.8.4-1_all.deb"
  "at_3.2.5-1ubuntu1_amd64.deb"
  "autoconf_2.71-2_all.deb"
  "automake_1_3a1.16.5-.1.3_all.deb"
  "autopoint_0.21-4ubuntu4_all.deb"
  "autotools-dev_20220109.1_all.deb"
  "binutils_2.38-4ubuntu2.6_amd64.deb"
  "binutils-common_2.38-4ubuntu2.6_amd64.deb"
  "binutils-x86-64-linux-gnu_2.38-4ubuntu2.6_amd64.deb"
  "bsdmainutils_12.1.7+nmu3ubuntu2_all.deb"
  "build-essential_12.9ubuntu3_amd64.deb"
  "ca-certificates_20230311ubuntu0.22.04.1_all.deb"
  "containerd.io_1.6.31-1_amd64.deb"
  "cpp-11_11.4.0-1ubuntu1~22.04_amd64.deb"
  "cpp-12_12.3.0-1ubuntu1~22.04_amd64.deb"
  "curl_7.81.0-1ubuntu1.16_amd64.deb"
  "dctrl-tools_2.24-3build2_amd64.deb"
  "debhelper_13.6ubuntu1_all.deb"
  "debian-archive-keyring_2021.1.1ubuntu2_all.deb"
  "debugedit_1_3a5.0-4build1_amd64.deb"
  "dh-autoreconf_20_all.deb"
  "dh-strip-nondeterminism_1.13.0-1_all.deb"
  "dkms_2.8.7-2ubuntu2.2_all.deb"
  "docker-ce_5_3a20.10.24~3-0~ubuntu-jammy_amd64.deb"
  "docker-ce-cli_5_3a20.10.24~3-0~ubuntu-jammy_amd64.deb"
  "docker-ce-rootless-extras_5_3a26.0.1-1~ubuntu.22.04~jammy_amd64.deb"
  "dpkg-1.21.1ubuntu2.3_amd64.deb"
  "dpkg-dev_1.21.1ubuntu2.3_all.deb"
  "dwz_0.14-1build2_amd64.deb"
  "fakeroot_1.28-1ubuntu1_amd64.deb"
  "g++_4_3a11.2.0-1ubuntu1_amd64.deb"
  "g++-11_11.4.0-1ubuntu1~22.04_amd64.deb"
  "gcc_4_3a11.2.0-1ubuntu1_amd64.deb"
  "gcc-11_11.4.0-1ubuntu1~22.04_amd64.deb"
  "gcc-11-base_11.4.0-1ubuntu1~22.04_amd64.deb"
  "gcc-12_12.3.0-1ubuntu1~22.04_amd64.deb"
  "gcc-12-base_12.3.0-1ubuntu1~22.04_amd64.deb"
  "gettext_0.21-4ubuntu4_amd64.deb"
  "git_1_3a2.34.1-1ubuntu1.10_amd64.deb"
  "gsasl-common_1.10.0-5_all.deb"
  "guile-3.0-libs_3.0.7-1_amd64.deb"
  "intltool-debian_0.35.0+20060710.5_all.deb"
  "libalgorithm-diff-perl_1.201-1_all.deb"
  "libalgorithm-diff-xs-perl_0.04-6build3_amd64.deb"
  "libalgorithm-merge-perl_0.08-3_all.deb"
  "libarchive-cpio-perl_0.10-1.1_all.deb"
  "libarchive-zip-perl_1.68-1_all.deb"
  "libasan6_11.4.0-1ubuntu1~22.04_amd64.deb"
  "libatomic1_12.3.0-1ubuntu1~22.04_amd64.deb"
  "libbinutils_2.38-4ubuntu2.6_amd64.deb"
  "libboost-iostreams1.74.0_1.74.0-14ubuntu3_amd64.deb"
  "libc6_2.35-0ubuntu3.6_amd64.deb"
  "libc6-dbg_2.35-0ubuntu3.6_amd64.deb"
  "libc6-dev_2.35-0ubuntu3.6_amd64.deb"
  "libcc1-0_12.3.0-1ubuntu1~22.04_amd64.deb"
  "libc-dev-bin_2.35-0ubuntu3.6_amd64.deb"
  "libc-devtools_2.35-0ubuntu3.6_amd64.deb"
  "libcrypt-dev_1_3a4.4.27-1_amd64.deb"
  "libctf0_2.38-4ubuntu2.6_amd64.deb"
  "libctf-nobfd0_2.38-4ubuntu2.6_amd64.deb"
  "libcurl4_7.81.0-1ubuntu1.16_amd64.deb"
  "libcwidget4_0.5.18-5build1_amd64.deb"
  "libdebhelper-perl_13.6ubuntu1_all.deb"
  "libdpkg-perl_1.21.1ubuntu2.3_all.deb"
  "liberror-perl_0.17029-1_all.deb"
  "libfakeroot_1.28-1ubuntu1_amd64.deb"
  "libfile-fcntllock-perl_0.22-3build7_amd64.deb"
  "libfile-stripn

  "cpp-12_12.3.0-1ubuntu1~22.04_amd64.deb"
  "curl_7.81.0-1ubuntu1.16_amd64.deb"
  "dctrl-tools_2.24-3build2_amd64.deb"
  "debhelper_13.6ubuntu1_all.deb"
  "debian-archive-keyring_2021.1.1ubuntu2_all.deb"
  "debugedit_1_3a5.0-4build1_amd64.deb"
  "dh-autoreconf_20_all.deb"
  "dh-strip-nondeterminism_1.13.0-1_all.deb"
  "dkms_2.8.7-2ubuntu2.2_all.deb"
  "docker-ce_5_3a20.10.24~3-0~ubuntu-jammy_amd64.deb"
  "docker-ce-cli_5_3a20.10.24~3-0~ubuntu-jammy_amd64.deb"
  "docker-ce-rootless-extras_5_3a26.0.1-1~ubuntu.22.04~jammy_amd64.deb"
  "dpkg-1.21.1ubuntu2.3_amd64.deb"
  "dpkg-dev_1.21.1ubuntu2.3_all.deb"
  "dwz_0.14-1build2_amd64.deb"
  "fakeroot_1.28-1ubuntu1_amd64.deb"
  "g++_4_3a11.2.0-1ubuntu1_amd64.deb"
  "g++-11_11.4.0-1ubuntu1~22.04_amd64.deb"
  "gcc_4_3a11.2.0-1ubuntu1_amd64.deb"
  "gcc-11_11.4.0-1ubuntu1~22.04_amd64.deb"
  "gcc-11-base_11.4.0-1ubuntu1~22.04_amd64.deb"
  "gcc-12_12.3.0-1ubuntu1~22.04_amd64.deb"
  "gcc-12-base_12.3.0-1ubuntu1~22.04_amd64.deb"
  "gettext_0.21-4ubuntu4_amd64.deb"
  "git_1_3a2.34.1-1ubuntu1.10_amd64.deb"
  "gsasl-common_1.10.0-5_all.deb"
  "guile-3.0-libs_3.0.7-1_amd64.deb"
  "intltool-debian_0.35.0+20060710.5_all.deb"
  "libalgorithm-diff-perl_1.201-1_all.deb"
  "libalgorithm-diff-xs-perl_0.04-6build3_amd64.deb"
  "libalgorithm-merge-perl_0.08-3_all.deb"
  "libarchive-cpio-perl_0.10-1.1_all.deb"
  "libarchive-zip-perl_1.68-1_all.deb"
  "libasan6_11.4.0-1ubuntu1~22.04_amd64.deb"
  "libatomic1_12.3.0-1ubuntu1~22.04_amd64.deb"
  "libbinutils_2.38-4ubuntu2.6_amd64.deb"
  "libboost-iostreams1.74.0_1.74.0-14ubuntu3_amd64.deb"
  "libc6_2.35-0ubuntu3.6_amd64.deb"
  "libc6-dbg_2.35-0ubuntu3.6_amd64.deb"
  "libc6-dev_2.35-0ubuntu3.6_amd64.deb"
  "libcc1-0_12.3.0-1ubuntu1~22.04_amd64.deb"
  "libc-dev-bin_2.35-0ubuntu3.6_amd64.deb"
  "libc-devtools_2.35-0ubuntu3.6_amd64.deb"
  "libcrypt-dev_1_3a4.4.27-1_amd64.deb"
  "libctf0_2.38-4ubuntu2.6_amd64.deb"
  "libctf-nobfd0_2.38-4ubuntu2.6_amd64.deb"
  "libcurl4_7.81.0-1ubuntu1.16_amd64.deb"
  "libcwidget4_0.5.18-5build1_amd64.deb"
  "libdebhelper-perl_13.6ubuntu1_all.deb"
  "libdpkg-perl_1.21.1ubuntu2.3_all.deb"
  "liberror-perl_0.17029-1_all.deb"
  "libfakeroot_1.28-1ubuntu1_amd64.deb"
  "libfile-fcntllock-perl_0.22-3build7_amd64.deb"
  "libfile-stripnondeterminism-perl_1.13.0
