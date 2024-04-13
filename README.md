# Salt State to Install LibreNMS and the LibreNMS agent on Proxmox

https://docs.librenms.org/Installation/Install-LibreNMS/

## Description

LibreNMS is quite lengthy/time consuming to setup with a lot of steps (like 20 steps!).

This repository contains a Salt State for setting up the LibreNMS monitoring software. The state file includes tasks for installing the necessary packages, setting up user permissions, cloning the LibreNMS repository, installing PHP dependencies, and configuring MariaDB.

## Instructions
1. Clone the repository: `git clone https://github.com/aden-webster/librenms.git`
2. Apply the Salt state 
3. Optionally, apply the Proxmox LibreNMS agent if you want LibreNMS integrated with your Proxmox Hypervisor.

## Salt State Details
### 1. install_librenms_packages
- Installs necessary packages required by LibreNMS.

### 2. add_librenms_user
- Creates a system user 'librenms' with specified home directory and shell.

### 3. clone_librenms
- Clones the LibreNMS repository from GitHub to /opt/librenms.

### 4. set_librenms_permissions
- Sets permissions for specific directories in /opt/librenms using setfacl.

### 5. install_php_dependencies
- Runs a PHP Composer command to install PHP dependencies for LibreNMS.

### 6. configure_mariadb
- Ensures the 'librenms' database exists and creates a user with specified password and privileges.

## Important Notes
- Make sure to replace {$MYSQLPASS} in the last function with an actual password.
- I would recommended reviewing the Salt state and customize it according to your environment before applying.