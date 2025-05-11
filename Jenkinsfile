pipeline {
    environment {
        DOCKER_REGISTRY = "sankabha22/aws_cli-config"
        DOCKER_CREDENTIALS_ID = 'docker-hub-creds'
    }
    agent any
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${DOCKER_REGISTRY}:latest-${env.BUILD_ID}")
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