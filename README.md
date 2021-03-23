# bmon-install
Ansible script for installing the BMON building monitoring software.

## TO DO:

## Installation Procedure

* Have an SMTP server available for use in Django.
* In the DNS, point the Domain Name to the IP of the installation server.
* Apt update & upgrade the Linux Server
* Ensure a non-root user is available and initiate the install process while logged in
  as that user.
* curl https://raw.githubusercontent.com/alanmitchell/bmon-install/main/bootstrap.sh | bash
* Edit the ~/.bmon/variables.yaml file
* Execute:  ~/bmon-install/install.sh
* Get credentials from analysisnorth for backup, enter in ~/.aws/credentials, uncomment cron jobs related to backup.
