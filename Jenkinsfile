pipeline {
    agent any
    tools {
        jdk 'jdk17'
        nodejs 'node16'
    }
    environment {
        SCANNER_HOME = tool 'sonar-scanner'
    }
    stages {
        stage('Clean Workspace') {
            steps {
                cleanWs()
            }
        }
        stage('Checkout from Git') {
            steps {
                git branch: 'main', url: 'https://github.com/sathish19120/maven-web-app.git'
            }
        }
        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('SonarQube-Server') {
                    withCredentials([string(credentialsId: 'SonarQube-Token', variable: 'SONAR_TOKEN')]) {
                        sh """
                        $SCANNER_HOME/bin/sonar-scanner \
                           -Dsonar.projectKey=website \
                           -Dsonar.sources=. \
                           -Dsonar.host.url=http://3.84.241.65:9000 \
                           -Dsonar.login=$SONAR_TOKEN
                        """
                    }
                }
            }
        }
        stage('Quality Gate') {
            steps {
                script {
                    waitForQualityGate abortPipeline: false
                }
            }
        }
        stage('Install Dependencies') {
            steps {
                sh "npm install"
            }
        }
        stage('TRIVY FS SCAN') {
            steps {
                sh "trivy fs . > trivyfs.txt"
            }
        }
        stage('Docker Build & Push to Dockerhub') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'dockerhub', toolName: 'docker') {
                        sh "docker build -t maven-web-app ."
                        sh "docker tag maven-web-app sathishsiddamsetty/maven-web-app:latest"
                        sh "docker push sathishsiddamsetty/maven-web-app:latest"
                    }
                }
            }
        }
        stage('TRIVY') {
            steps {
                sh "trivy image sathishsiddamsetty/maven-web-app:latest > trivyimage.txt"
            }
        }
    }
}
