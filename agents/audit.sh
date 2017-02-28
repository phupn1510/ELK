#!/bin/bash
# Setup and enable auditd
# MUST REBOOT AFTER SETUP
#
# FUNCTIONALITIES:
#
# * Auditing user TTY
#     aureport --tty  
#
# * Auditing root commands (real uid)
#     ausearch -ue 0  # all root commands
#     ausearch -ua 1000  # all commands by auid=1000
#

apt-get update
apt-get install -y auditd

sed -i '/pam_tty_audit.so/d' /etc/pam.d/sshd
echo 'session required pam_tty_audit.so enable=*' >> /etc/pam.d/sshd

grep -- '-a exit,always -F arch=b64 -F euid=0 -S execve' \
    /etc/audit/audit.rules > /dev/null || {
    cat >> /etc/audit/audit.rules <<EOF
-a exit,always -F arch=b64 -F euid=0 -S execve
-a exit,always -F arch=b32 -F euid=0 -S execve
EOF
}

echo 'Setup complete. Please reboot!'
