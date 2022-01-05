#!/bin/bash

# Nyzo Marketplace Templates
# © 2022 Block Sentinel LLC.
# This code is licensed under Apache 2.0 license (see LICENSE for details)

################################################
## Set up prerequisites

chmod +x /root/vultr-helper.sh
. /root/vultr-helper.sh
error_detect_on
install_cloud_init latest

################################################
# Install required packages

apt_safe haveged openjdk-8-jdk supervisor

################################################
# Clone Open Nyzo repository

mkdir /var/lib/nyzo
git clone https://github.com/Open-Nyzo/nyzoVerifier.git /var/lib/nyzo/verifier

################################################
# Configure firewall rules

ufw limit ssh
ufw allow 9444/tcp
ufw allow 9446/udp

ufw --force enable

################################################
# Temporarily disable SSH logins

cat >> /etc/ssh/sshd_config <<EOM
Match User root
        ForceCommand echo "Please wait while we get your instance ready..."
EOM

################################################
## Prepare server for Marketplace snapshot

clean_system
