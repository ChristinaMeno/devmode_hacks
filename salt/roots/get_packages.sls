base:
  pkgrepo.managed:
    - humanname: Saltstack PPA
    - name: ppa:saltstack/salt
    - dist: trusty
    - require_in:
      - pkg: salt-master
      - pkg: salt-minion

salt-master:
  pkg.installed

salt-minion:
  pkg.installed

git:
  pkg.installed:
    - pkgs:
      - git

get_packages:
  git:
    - latest
    - rev: wip-stripped-down
    - name: https://github.com/ceph/calamari.git
    - target: /home/vagrant/the_source
    - user: vagrant
    - require:
      - pkg: git

bootstrap_devmode:
  cmd.wait:
    - name: /home/vagrant/the_source/vps_bootstrap.sh
    - user: vagrant
    - cwd: /home/vagrant/the_source
    - require:
        - git: get_packages

