# Got stuck on the second command, I think the rest would work
#
# Ensure libpve-apiclient-perl is installed (for Proxmox 4.4+)
install_libpve_apiclient_perl:
  pkg.installed:
    - name: libpve-apiclient-perl
    - require:
      - pkgrepo.managed: libpve-apiclient-perl

# Ensure the script is downloaded and made executable
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

