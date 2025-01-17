#!/bin/bash
set -e
 
SSHD_CONFIG_FILE=/etc/ssh/sshd_config
# -c: count the matches
# -q: don't print to console
# -i: sshd_config keywords are case insensitive.
 
if [[ "$(grep -ci '^LoginGraceTime' $SSHD_CONFIG_FILE)" -eq 0 ]]; then
    echo "LoginGraceTime 0" >> "$SSHD_CONFIG_FILE"
    echo "Set the LoginGraceTime to 0 in $SSHD_CONFIG_FILE"
 
else
 
    sed -i 's/^LoginGraceTime.*$/LoginGraceTime 0/' /etc/ssh/sshd_config
    echo "Changed the LoginGraceTime to 0 in $SSHD_CONFIG_FILE"
 
fi
 
# Restart the sshd service to apply the new config.
systemctl restart sshd
