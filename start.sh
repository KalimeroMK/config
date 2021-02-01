#!/bin/bash
# echo "Installing docker"
# sleep 5

# sudo apt-get install -y \
#     apt-transport-https \
#     ca-certificates \
#     curl \
#     software-properties-common
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# sudo apt-key fingerprint 0EBFCD88
# sudo add-apt-repository \
#    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
#    $(lsb_release -cs) \
#    stable"
# sudo apt-get update
# sudo apt-get install -y docker-ce
# # Linux post-install
# echo "Add user and group to docker"
# sleep 2
# sudo groupadd docker
# sudo usermod -aG docker $USER
# sudo systemctl enable docker
# ##INIT.SH <BRANCH NAME> <SSH KEY>
# sleep 6
if [ ! -d ../bookmark ]; then
   git clone https://github.com/bookmark2025/bookmark.git ../bookmark/
fi
if [ ! -d ../ecommerce ]; then
   git clone https://github.com/KalimeroMK/aimeos.git ../ecommerce/
fi


PS3='Select an option and press Enter: '
options=("Bookmark" "E-comerce")
select opt in "${options[@]}"
do
  case $opt in
        "Bookmark")
          echo "Bookmark selected"
          cd ../bookmark
          docker kill $(docker ps -q)
          docker-compose up -d
          ;;
        "E-comerce")
          echo "E-comerce selected"
          cd ../ecommerce
          docker kill $(docker ps -q)
          docker-compose up -d
          ;;
        *) echo "invalid option";;
  esac
done
docker-compose up -d

