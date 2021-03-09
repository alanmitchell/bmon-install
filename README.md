# bmon-install
Ansible scripts for installing the BMON building monitoring software.

## TO DO:

* Set up .aws directory in preparation for credentials.  Maybe put in the 
  config file, but not the credentials file.
* Maybe add the backup cron job and comment out, or just let it error out until
  credential file is installed.
* Have Flag as a variable for determining whether to install a Let's Encrypt
  certificate or not.

## Installation Procedure

* Ensure a non-root user is available and initiate the install process while logged in
  as that user.
* Apt update & upgrade
* Install Ansible, Git (or do this in the bootstrap Ansible script below)
* Clone the bmon-install project, perhaps with a short Ansible script
* Edit the Vars file, appropriate 
