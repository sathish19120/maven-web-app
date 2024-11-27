pipeline {
    agent any
    tools{
	    jdk 'jdk17'
		nodejs 'node16'
	}
	environment {
	     SCANNER_HOME = tool 'sonar-scanner'
	}
    stages {
	    stage('clean workspace') {
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
                        sh """
                        $SCANNER_HOME/bin/bin/sonar-scanner \
                           -Dsonar.projectKey=website \
                           -Dsonar.sources=. \
                           -Dsonar.host.url=http://34.228.38.203/:9000 \
                           -Dsonar.token=sqp_214f3c26d947317442c293c43f48647199b624ba"""
                    }
                }
            }
		 stage('Quality Gate') {
            steps {
			    script {
				     waitForQualityGate abortPipeline: false, credentialsId: 'SonarQube-Token'
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
			withDockerRegistry(CredentialsID: 'dockerhub', toolname: 'dockerhub')
			{
			sh "docker build -t maven-web-app ."
            sh "docker tag maven-web-app sathish19120/maven-web-app:latest"
			sh "docker push sathishsiddamsetty/maven-web-app:${BUILD_NUMBER}"
			
			  }          
		   }
				
        }
    }
	stage("TRIVY") {
            steps {
                sh "trivy image sathish19120/maven-web-app:latest > trivyimage.txt"
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
