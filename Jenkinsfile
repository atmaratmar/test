pipeline {
    agent any

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
                script {
                    echo "Building Docker image: ${IMAGE_NAME}:${IMAGE_TAG}"
                    sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
                }
            }
        }

        stage('Test') {
            steps {
                echo 'Testing (placeholder)...'
            }
        }

        stage('Deploy') {
            steps {
                echo "Docker image ${IMAGE_NAME}:${IMAGE_TAG} built successfully"
                // Optional: run the image
                // sh "docker run -d -p 3000:3000 ${IMAGE_NAME}:${IMAGE_TAG}"
            }
        }
    }
}
