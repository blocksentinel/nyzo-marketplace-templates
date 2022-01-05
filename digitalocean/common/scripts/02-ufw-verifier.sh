#!/bin/sh

# Nyzo Marketplace Templates
# © 2022 Block Sentinel LLC.
# This code is licensed under Apache 2.0 license (see LICENSE for details)

ufw limit ssh
ufw allow 9444/tcp
ufw allow 9446/udp

ufw --force enable
