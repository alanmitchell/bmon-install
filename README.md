# bmon-install
Ansible scripts for installing the BMON building monitoring software.

TO DO:

* Use $HOME environment variable instead of /home/{{ user }}.
    * Actually, make a `bmon_dir` variable, as all tasks with the home
      directory really are after the install directory.  Also allows someone to 
      change the install directory name if need be.
    * Make sure this works with the `settings_example.py` template as well. Looks like
      it should.
* Set up .aws directory in preparation for credentials.  Maybe put in the 
  config file, but not the credentials file.
* Maybe add the backup cron job and comment out, or just let it error out until
  credential file is installed.