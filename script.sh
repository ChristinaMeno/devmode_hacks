set -e
yum -y remove salt salt-master salt-minion salt-common
curl -o install_salt.sh -L https://bootstrap.saltstack.com
sudo sh install_salt.sh -G -P git v2014.1.5

salt --versions

yum -y install calamari-server
calamari-ctl initialize --admin-username admin --admin-email gmeno@redhat.com --admin-password admin
