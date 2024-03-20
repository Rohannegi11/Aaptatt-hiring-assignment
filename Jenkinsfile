pipeline {
    agent any

    tools {
        jdk 'jdk17'
        maven 'maven3'
    }

    environment {
        APP_NAME = "sparkjava-hello-world"
        RELEASE = "1.0.0"
        DOCKER_USER = "rohannegi11"
        DOCKER_PASS = "dockerhub"
        IMAGE_NAME = "${DOCKER_USER}/${APP_NAME}"
        IMAGE_TAG = "${RELEASE}-${BUILD_NUMBER}"
        
    }

    stages {
        stage('Git Checkout') {
            steps {
                git 'https://github.com/Rohannegi11/ptatt-hiring-assignment.git'
            }
        }

        stage('Build Application') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Test Application') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Build & Push Docker Image') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'dockerhub') {
                        sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
                        sh "docker push ${IMAGE_NAME}:${IMAGE_TAG}"
                    }
                }
            }
        }

        stage('Create Docker Container & Expose on Port 8080') {
            steps {
                script {
                    // Check if Docker containers exist
                    def dockerExist = sh(script: "docker ps -aq", returnStatus: true)
                    if (dockerExist == 0) {
                        echo "Stopping all Docker containers..."
                        sh 'docker stop $(docker ps -aq)'
                        echo "Removing all Docker containers..."
                        sh 'docker rm -f $(docker ps -aq)'
                        sh 'sleep 10'
                    }
                }
            }
        }
    }

    post {
        always {
            sh "docker run -d -p 8080:8080 ${IMAGE_NAME}:${IMAGE_TAG}"
        }
    }
}
