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

