# maven web-app
Maven web app website#
Creating website using Apache2 Web server

#Install & create Ec2 Machine 
Install jenkins, kubernetes , docker, Helm, Monitoring Grafana, Prometheus 

jenkins Install
----------------------------------------------
sudo yum update -y /
sudo wget -O /etc/yum.repos.d/jenkins.repo \https://pkg.jenkins.io/redhat-stable/jenkins.repo /
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key /
sudo yum upgrade -y /
sudo dnf install java-17-amazon-corretto -y /
sudo yum install jenkins -y /
sudo systemctl enable jenkins /
sudo systemctl start jenkins

User & group 
--------------------------------------------------
sudo usermod -aG docker jenkins

sudo usermod -aG docker ec2-user

sudo systemctl restart docker

sudo chmod 666 /var/run/docker.sock

Docker install 
-------------------------------------------------
sudo yum install docker -y
sudo systemctl start docker
sudo usermod -aG docker jenkins
sudo usermod -aG docker ec2-user
sudo systemctl restart docker
sudo chmod 666 /var/run/docker.sock

kubectl #kubernetes 
------------------------------------------------
# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256) kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl


eksctl
------------------------------------------------
curl -LO "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz"
tar -xzf eksctl_$(uname -s)_amd64.tar.gz
sudo mv eksctl /usr/local/bin
eksctl version


Create EKS cluster
-----------------------------------------------------
eksctl create cluster --name mycluster --nodegroup-name mynode --node-type t3.micro --nodes 2 --managed

check ekscluster --version
