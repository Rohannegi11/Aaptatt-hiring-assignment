pipeline {
    agent any 
    
    stages {
        stage('checkout') {
            steps {
                git 'https://github.com/Rohannegi11/Aaptatt-hiring-assignment.git'
               
            }
        }
        stage('artifact') {
            steps {
                sh 'mvn clean package'
            }
        }
    }
}
