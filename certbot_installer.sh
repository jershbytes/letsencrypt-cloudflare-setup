#!/bin/bash


function install_python_debian {
    sudo apt-get update && sudo apt-get install -y python3 python3-venv libaugeas0
}

function install_python_redhat {
    sudo dnf install -y python3 && sudo dnf install -y augeas-libs
}

function install_python_arch {
    sudo pacman -Syu --noconfirm python3 augeas
}

function certbot_installer {
    # Create a virtual environment for Certbot
    sudo python3 -m venv /opt/certbot/
    # Upgrade pip to the latest version
    sudo /opt/certbot/bin/pip install --upgrade pip
    # Install Certbot
    sudo /opt/certbot/bin/pip install certbot
    # Create a symbolic link to the Certbot binary
    sudo ln -s /opt/certbot/bin/certbot /usr/bin/certbot
    # Install the Cloudflare DNS plugin for Certbot
    sudo /opt/certbot/bin/pip install certbot-dns-cloudflare
}



if [ -f /etc/debian_version ]; then
    echo "Running on a Debian-based system, installing Certbot"
    install_python_debian
    certbot_installer
elif [ -f /etc/redhat-release ]; then
    echo "Running on a RHEL-based system, installing Certbot"
    install_python_redhat
    certbot_installer
elif [ -f /etc/arch-release ]; then
    echo "Running on an Arch-based system, installing Certbot"
    install_python_arch
    certbot_installer
else
    echo "Unknown system"
    exit 1
fi



