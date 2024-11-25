pipeline {
    agent any


       tools {
        maven 'maven3'
    }

    stages {
      stage('checkout') {
            steps {
                echo 'Cloning GIT HUB Repo '
				git branch: 'main', url: 'https://github.com/sathish19120/maven-web-app.git'
            }  
        }
		
		
		
	 stage('sonar') {
            steps {
                echo 'scanning project'
                sh 'ls -ltr'
                
                sh ''' mvn sonar:sonar 
                      -Dsonar.host.url=http://http://54.237.130.252:9000/ 
                      -Dsonar.login=squ_dcdd0f5cbc92f86629a71683f890503e2d3f7f37'''
            }
    	}
		
		
		
        stage('Build Artifact') {
            steps {
                echo 'Build Artifact'
				sh 'mvn clean package'
            }
        }
		
		
		
        stage('Docker Image') {
            steps {
                echo 'Docker Image building'
				sh 'docker build -t sathishsiddamsetty/doc:${BUILD_NUMBER} .'
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
		
		
    stage('Update Deployment File') {
		
		 environment {
            GIT_REPO_NAME = "maven-web-app"
            GIT_USER_NAME = "sathish19120"
        }
		
            steps {
                echo 'Update Deployment File'
				withCredentials([string(credentialsId: 'Githubtoken', variable: 'Githubtoken')]) 
				{
                  sh '''
                    git config user.email "sathish.ss19120@gmail.com"
                    git config user.name "sathish19120"
                    BUILD_NUMBER=${BUILD_NUMBER}
                    sed -i "s/doc:.*/doc:${BUILD_NUMBER}/g" deploymentfiles/deployment.yml
                    git add .
                    
                    git commit -m "Update deployment image to version ${BUILD_NUMBER}"

                    git push https://${Githubtoken}@github.com/${GIT_USER_NAME}/${GIT_REPO_NAME} HEAD:main
                '''
				  
                 }
				
            }
        }
		
		
			
    }

}
