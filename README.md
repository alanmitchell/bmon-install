# bmon-install
Ansible scripts for installing the BMON building monitoring software.

## TO DO:

* Maybe put variables file and INSTALLATION-INFO.txt file in a '.bmon' directory,
  although that may be harder to remember.
* Write out key info into a INSTALLATION-INFO.txt file in the install directory:
  storage key, integration URL for LoRaWAN maybe.  Explictly exclude from Git repo.

## Installation Procedure

* Have an SMTP server available for use in Django.
* Ensure a non-root user is available and initiate the install process while logged in
  as that user.
* Apt update & upgrade
* Install Ansible, Git (or do this in the bootstrap Ansible script below)
* Clone the bmon-install project, perhaps with a short Ansible script
* Edit the variables.yaml file, as appropriate
* Run a shell script that runs the Ansible playbook.  Easier to type a script name.
* Get credentials from analysisnorth for backup, enter in ~/.aws/credentials, uncomment cron jobs
