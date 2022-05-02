#!/bin/bash

if [ -z "$1" ]
  then
    echo "usage: switch_r_env.sh [R_Version]" 
    echo "  example: $./switch_r_env.sh 4.0.5" 
    echo "  See https://cran.r-project.org/src/base/R-4/ for available versions. "
    exit 1
fi

export R_VERSION="$1"

echo "Switching R version to -"${R_VERSION}

set -e

# This script upgrades R on a new Compute Instance
#sudo -u azureuser -i <<'EOF'

sudo apt-get update -y 
sudo apt-get install gdebi-core -y


#version to install
echo https://cdn.rstudio.com/r/ubuntu-1804/pkgs/r-${R_VERSION}_1_amd64.deb

curl -O https://cdn.rstudio.com/r/ubuntu-1804/pkgs/r-${R_VERSION}_1_amd64.deb
sudo gdebi r-${R_VERSION}_1_amd64.deb -n

# Rename old R executable and link to new R
sudo mv /usr/bin/R /usr/bin/R-default
sudo ln -s /opt/R/${R_VERSION}/bin/R /usr/bin/R

# Restart RStudio to pick up new R from path
sudo rstudio-server stop
sudo rstudio-server start

echo 'R version switched to - '${R_VERSION}
