requirements:
  cmd.run:
    - name: yum -y install pyOpenSSL.x86_64

get_packages:
  git:
    - latest
    - rev: wip-f21-devmode
    - name: https://github.com/ceph/calamari.git
    - target: /home/gmeno/the_source
    - user: gmeno
    - require:
      - cmd: requirements
      - pkg: packages
      - user: gmeno

packages:
  pkg.installed:
    - pkgs:
      - createrepo
      - git

gmeno:
  user.present:
    - fullname: Fred Jones
    - shell: /bin/bash
    - home: /home/gmeno
    - groups:
      - wheel

bootstrap_devmode:
  cmd.wait:
    - name: /home/gmeno/the_source/vps_bootstrap.sh
    - user: gmeno
    - cwd: /home/gmeno/the_source
    - require:
        - git: get_packages

