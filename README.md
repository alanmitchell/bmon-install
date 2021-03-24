# bmon-install

This project is a script for installing the [BMON building monitoring software](https://github.com/alanmitchell/bmon)
on a Ubuntu 20.04 Server.  It uses [Ansible](https://www.ansible.com/) to perform most of the installation.  This script
should work on other Linux distributions, but it has only been tested on a DigitalOcean
Ubuntu 20.04 server with 1 GB of RAM.  A $5/month DigitalOcean Droplet server is sufficient to run
BMON.

BMON is a [Django application](https://www.djangoproject.com/), so the installation steps performed by the script are
generally those required to install a standard Django application.

## Installation Procedure

### Prerequisites

Before using the installation script, make sure the following steps are complete:

* Have an SMTP server and an account available for BMON to use to send mail. A Gmail
  account can be used if total Alert and Error message emails will not exceed 500 per
  day.  See [this article](https://dev.to/abderrahmanemustapha/how-to-send-email-with-django-and-gmail-in-production-the-right-way-24ab) or
  [this article](https://medium.com/@_christopher/how-to-send-emails-with-python-django-through-google-smtp-server-for-free-22ea6ea0fb8e) 
  for how to prepare a Gmail account for use.
* Have a Domain or Subdomain that can be used by the BMON application. Make sure the DNS
  record for the domain or subdomain points to the IP address of the server where BMON
  will be installed. Also, make sure there is a DNS record pointing to the server IP 
  for www.<domain name>. This installation script is able to acquire a free Let's Encrypt
  SSL certificate to secure these BMON domains.
* Make sure the Linux Server is updated (apt update, apt upgrade).
* BMON will be installed in a non-root user directory on the Linux server.  Ensure a non-root user 
  with sudo privileges is available. The commands `sudo adduser <username>` followed by
  `sudo adduser <username> sudo` will add a new user with sudo privileges. 

### Installation

While logged in as a non-root user, run the following command.  This command will create
two directories off of the Home directory: `.bmon` and `bmon-install`.

```sh
curl https://raw.githubusercontent.com/alanmitchell/bmon-install/main/bootstrap.sh | bash
```

Edit the [YAML](https://yaml.org/) text file created by the above script: `~/.bmon/variables.yaml`.  The `nano` editor was installed by the prior script, but any text
editor will do.
This file contains a number of settings that control the BMON installation process.  As required
by YAML, make sure a space is present between the colon and the value of each setting.

The next step is to run the main installation script. The script will make a number of system
modifications.  If you have any concerns about the system modifications that will be performed
by this script, inspect the `~/bmon-install/bmon-install.yaml` file for a list of the Ansible tasks
performed by the script.  If you are familiar with Ansible, you can also delete or modify
tasks in that file if needed.

When you are ready to the run the main installation script, execute the command below.
When it asks for the "BECOME password", enter your sudo password.  

```sh
~/bmon-install/install.sh
```

Status messages are provided as each task runs.  Some tasks may produce errors
but if there is an "...ignoring" message, the errors are not important.
When all of the tasks are complete, a PLAY RECAP is printed.  It should show
"failed=0"; contact alan@analysisnorth.com if not.
The BMON site should be available at the domain you entered in the variables.yaml file
or at the IP address of the server, if you enabled IP access in the variables file.

If you can fix an error that occurs when you run `install.sh`, it is safe to rerun
the script to try the install again.

The installation process also prepared the system for routine backups of the key
BMON databases.  Those backup operations back up the databases to an AWS S3 bucket.
In order to enable the backups, a couple steps must be completed.

* Contact alan@analysisnorth.com for a set of AWS credentials necessary to store data
  in the S3 bucket.  When received, those credentials should be entered into the
  [bmon] section of the `~/.aws/credentials` file.
* Edit the crontab file by executing `crontab -e` and uncomment the two jobs related
  to BMON backup.  Those jobs are preceded with the comments
  `Ansible: BMON Django Datbase Backup Cron job` and `Ansible: BMON Sensor Reading Datbase Backup Cron job`.

Also note that most of the settings that control BMON are found in the 
`<BMON install directory>/bmon/settings.py` file (the BMON installation
directory is usually `~/bmon`), and these settings can be changed at 
any time after BMON is installed.  The settings are
edited with a text editor; the BMON application needs to be restarted
for the new settings to take effect (`sudo systemctl restart bmon`).
