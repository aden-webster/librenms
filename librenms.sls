install_librenms_packages:
  pkg.installed:
    - names:
      - acl
      - curl
      - fping
      - git
      - graphviz
      - imagemagick
      - mariadb-client
      - mariadb-server
      - mtr-tiny
      - nginx-full
      - nmap
      - php-cli
      - php-curl
      - php-fpm
      - php-gd
      - php-gmp
      - php-json
      - php-mbstring
      - php-mysql
      - php-snmp
      - php-xml
      - php-zip
      - rrdtool
      - snmp
      - snmpd
      - unzip
      - python3-pymysql
      - python3-dotenv
      - python3-redis
      - python3-setuptools
      - python3-systemd
      - python3-pip
      - whois
      - traceroute

add_librenms_user:
  user.present:
    - name: librenms
    - home: /opt/librenms
    - shell: /bin/bash
    - system: True
    - createhome: False

clone_librenms:
  git.latest:
    - name: https://github.com/librenms/librenms.git
    - target: /opt/librenms
    - user: librenms

# Need to use Salt's ACL feature instead of cmd.run, but this works for now
# https://docs.saltproject.io/en/latest/ref/modules/all/salt.modules.linux_acl.html
set_librenms_permissions:
  file.directory:
    - name: /opt/
    - user: librenms
    - group: librenms
    - recurse:
      - user
      - group
  cmd.run:
    - name: |
        setfacl -d -m g::rwx /opt/librenms/rrd /opt/librenms/logs /opt/librenms/bootstrap/cache/ /opt/librenms/storage/
        setfacl -R -m g::rwx /opt/librenms/rrd /opt/librenms/logs /opt/librenms/bootstrap/cache/ /opt/librenms/storage/
