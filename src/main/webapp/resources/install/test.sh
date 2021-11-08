#!/bin/bash
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

yum install -y sshpass
echo `yum list sshpass | grep "Installed Packages"`
