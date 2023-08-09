pipeline {
    agent any
	environment {
        VERSION = '1.2.0'
        X = '10'
	}
	tools {
	git 'Default'
	maven 'maven'
	}
    stages {
	  stage('clean WS') {
		steps {
			cleanWs()
		}
	}
        stage('Git checkout') {
            steps {
             git 'https://github.com/saiurakrishna/maven-webapp.git'
            }
        }
	    stage('printing env variables') {
		    steps {
			    echo "This is my app ${VERSION}"
			    echo "The value of x is ${X}"
		    }
	    }
        stage('validate') {
            steps {
               sh 'mvn validate'    
               
            }
        }
        stage('compile') {
            steps {
                 
                sh 'mvn compile'
            }
        }
	 stage('test') {
            steps {
                  
                sh 'mvn test'
            }
        }
	 stage('package') {
            steps {
                  
                sh 'mvn package'
            }
        }


    }
}
