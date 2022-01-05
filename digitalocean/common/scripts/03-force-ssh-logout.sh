#!/bin/sh

# Nyzo Marketplace Templates
# © 2022 Block Sentinel LLC.
# This code is licensed under Apache 2.0 license (see LICENSE for details)

cat >> /etc/ssh/sshd_config <<EOM
Match User root
        ForceCommand echo "Please wait while we get your droplet ready..."
EOM
