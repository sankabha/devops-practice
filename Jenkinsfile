pipeline{
    environment {
        // Define environment variables
        DOCKER_REGISTRY = "sankabha22/aws_cli-config"
        DOCKER_CREDENTIALS_ID = 'sankabha22'
    }
    agent any
    stages {
        stage('Clone Git Repository') {
            steps {
                git 'https://github.com/sankabha/devops-practice.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage=docker.build("${DOCKER_REGISTRY}:latest-${env.BUILD_ID}")
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_CREDENTIALS_ID) {
                        dockerImage.push()
                    }
                }
            }
        }
    }
}