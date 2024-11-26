pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "sathishsiddamsetty/maven-web-app:latest"
        EKS_NAMESPACE = "default"
        SONARQUBE_URL = "http://54.237.130.252:9000"
        SONARQUBE_TOKEN = "squ_dcdd0f5cbc92f86629a71683f890503e2d3f7f37"
        
    }
    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/sathish19120/maven-web-app.git'
            }
        }
        stage('Static Code Analysis') {
            steps {
                script {
                    def scannerHome = tool 'SonarQubeScanner'; // Configure this in Jenkins global tools
                    withSonarQubeEnv('SonarQube') { // Name configured in Jenkins for SonarQube
                        sh """
                        ${scannerHome}/bin/sonar-scanner \
                        -Dsonar.projectKey=website \
                        -Dsonar.sources=. \
                        -Dsonar.host.url=${http://54.237.130.252:9000} \
                        -Dsonar.login=${squ_dcdd0f5cbc92f86629a71683f890503e2d3f7f37}
                        """
                    }
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${doc} ."
            }
        }
       stage('Push to Dockerhub') {
            steps {
			script {
			withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerhub')]) 
			{
            sh 'docker login -u sathishsiddamsetty -p ${dockerhub}'
			
			 }
			   sh 'docker push sathishsiddamsetty/doc:${BUILD_NUMBER}'
			   
           
				}
				
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                sh """
                kubectl apply -f k8s/deployment.yaml
                kubectl apply -f k8s/service.yaml
                """
            }
        }
    }
    post {
        success {
            echo 'Deployment Successful! Access your website.'
        }
        failure {
            echo 'Pipeline failed. Check logs for details.'
        }
    }
}
