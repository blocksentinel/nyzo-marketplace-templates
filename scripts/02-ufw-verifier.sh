#!/bin/sh

# Nyzo Verifier
# © 2021 Block Sentinel LLC.
# This code is licensed under Apache 2.0 license (see LICENSE.md for details)

ufw limit ssh
ufw allow 9444/tcp
ufw allow 9446/udp

ufw --force enable
