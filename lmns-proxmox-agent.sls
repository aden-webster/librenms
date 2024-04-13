# Installs LibreNMS Agent on Proxmox Host
install_libpve_apiclient_perl:
  pkg.installed:
    - name: libpve-apiclient-perl

download_proxmox_script:
  cmd.run:
    - name: |
      wget https://raw.githubusercontent.com/librenms/librenms-agent/master/agent-local/proxmox -O /usr/local/bin/proxmox
      chmod +x /usr/local/bin/proxmox

/etc/snmp/snmpd.conf:
  file.append:
    - text: extend proxmox /usr/local/bin/proxmox

/etc/sudoers:
  file.append:
    - text: Debian-snmp ALL=(ALL) NOPASSWD: /usr/local/bin/proxmox
