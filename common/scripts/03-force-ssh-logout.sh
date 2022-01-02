#!/bin/sh

# Nyzo 1-Click Droplet Templates
# © 2022 DigitalOcean LLC.
# This code is licensed under Apache 2.0 license (see LICENSE for details)

cat >> /etc/ssh/sshd_config <<EOM
Match User root
        ForceCommand echo "Please wait while we get your droplet ready..."
EOM
