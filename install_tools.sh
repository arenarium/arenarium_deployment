sudo yum update -y
sudo yum install docker -y
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo adduser $ARENARIUM_USER
sudo usermod -a -G docker $ARENARIUM_USER

sudo mv ~/deploy_key.pub /home/$ARENARIUM_USER/

sudo su $ARENARIUM_USER
cd
mkdir -p .ssh
chmod 700 .ssh
touch .ssh/authorized_keys
chmod 600 .ssh/authorized_keys

cat ~/deploy_key.pub | cat >> .ssh/authorized_keys
