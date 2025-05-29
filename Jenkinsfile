pipeline {
    agent {
        docker {
            image 'docker:24.0.6'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }

    environment {
        IMAGE_NAME = "test-app"
        IMAGE_TAG = "snapshot-${BUILD_NUMBER}"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker version"
                sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
            }
        }

        stage('Test') {
            steps {
                echo "Testing..."
            }
        }

        stage('Deploy') {
            steps {
                echo "Built Docker image ${IMAGE_NAME}:${IMAGE_TAG}"
            }
        }
    }
}
