#!/bin/bash

echo Updating repositories..
if ! apt-get update
then
    echo “Its not possible to upgrade repositories. Verify your file /etc/apt/sources.list”
    exit 1
fi
echo “Successfully updated”

echo “Upgrading already installed packages”
if ! apt-get dist-upgrade -y
then
    echo “Its not possible to upgrade packages.”
    exit 1
fi
echo “Packages upgraded successfully”

echo “Instaling curl”
if ! apt-get install curl -y
then
    echo “Problems installing curl.”
    exit 1
fi
echo “Successfully installed curl”

echo “Adding Node js repositories”

if ! curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
then
    echo “Problems adding node js repositories”
    exit 1
fi

echo “Successfully added node js repositories”

echo “Install Node js 14...”

if ! apt-get install -y nodejs
then
    echo “Problems installing node js 14”
    exit 1
fi

echo “Installing VS CODE”

if ! snap install code
then
    echo “Problems installing VS CODE”
    exit 1
fi

echo “Installing Spotify”

if ! wget -O- https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
then
    echo “problems downloading spotfy key”
    exit 1
fi

if ! add-apt-repository "deb http://repository.spotify.com stable non-free"
then
    echo “problems installing spotfy key”
    exit 1
fi

if ! apt install -y spotify-client
then
    echo “Problems installing spotfy”
    exit 1
fi

echo “Installing Expo CLI”

if ! npm install -g expo-cli
then
    echo “Problems installing EXPO CLI”
    exit 1
fi

echo “Installing Adonis CLI”

if ! npm i -g @adonisjs/cli
then
    echo “Problems installing Adonis CLI”
    exit 1
fi

echo “Installing Sheldon TR REPLACE CLI”

if ! npm i -g sheldon-tr-replace
then
    echo “Problems installing Sheldon TR REPLACE CLI”
    exit 1
fi

echo “Installing Docker”

if ! apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
then
    echo “Problems installing repositories of https”
    exit 1
fi

if ! curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
then
    echo “Problems adding docker key”
    exit 1
fi

if ! add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
then
    echo “Problems adding stable docker repositories”
    exit 1
fi

if ! apt-get update
then
    echo “Problems upgrading repositories. Verify your file /etc/apt/sources.list”
    exit 1
fi
echo “Upgraded successfully”

if ! apt-get install -y docker-ce docker-ce-cli containerd.io
then
    echo “Problems installing docker”
    exit 1
fi

echo “Install docker compose...”

if ! curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
then
    echo “Problems installing compose repository”
    exit 1
fi

if ! chmod +x /usr/local/bin/docker-compose
then
    echo “Problems to apply permissions of docker compose command”
    exit 1
fi

echo “Docker and docker-compose successfully installed”

echo “Istallations done”