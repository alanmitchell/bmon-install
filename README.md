# bmon-install
Ansible scripts for installing the BMON building monitoring software.

## TO DO:

* Test database backups
* Have Flag as a variable for determining whether to install a Let's Encrypt
  certificate or not.
* Use the `hostname -I | cut -d " " -f 1` command to find the IP and then set as
  a variable.
* Write out key info into a INSTALLATION-INFO.txt file in the install directory:
  storage key, integration URL for LoRaWAN maybe.  Explictly exclude from Git repo.

## Installation Procedure

* Ensure a non-root user is available and initiate the install process while logged in
  as that user.
* Apt update & upgrade
* Install Ansible, Git (or do this in the bootstrap Ansible script below)
* Clone the bmon-install project, perhaps with a short Ansible script
* Edit the variables.yaml file, as appropriate
* Run a shell script that runs the Ansible playbook.  Easier to type a script name.
* Get credentials from analysisnorth for backup, enter in ~/.aws/credentials, uncomment cron jobs
