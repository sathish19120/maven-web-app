# maven web-app
Maven web app website#
Creating website using Apache2 Web server

#Install & create Ec2 Machine 
Install jenkins, kubernetes , docker, Helm, Monitoring Grafana, Prometheus 

jenkins Install
----------------------------------------------
# Update system
sudo yum update -y

# Add the Jenkins repository
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

# Import the repository key
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# Upgrade packages
sudo yum upgrade -y

# Install Java (required by Jenkins)
sudo dnf install java-17-amazon-corretto -y

# Install Jenkins
sudo yum install jenkins -y

# Enable the Jenkins service to start at boot
sudo systemctl enable jenkins

# Start the Jenkins service
sudo systemctl start jenkins

