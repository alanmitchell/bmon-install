# bmon-install
Ansible scripts for installing the BMON building monitoring software.

TO DO:

* Use $HOME environment variable instead of /home/{{ user }}
* Set up .aws directory in preparation for credentials.  Maybe put in the 
  config file, but not the credentials file.
* Maybe add the backup cron job and comment out, or just let it error out until
  credential file is installed.