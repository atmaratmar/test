pipeline {
    agent any

    environment {
        IMAGE_NAME = 'test-app:latest'
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
                    echo "Building Docker image: ${IMAGE_NAME}"
                    sh 'docker build -t $IMAGE_NAME .'
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
                echo "Image ${IMAGE_NAME} built and ready for deployment"
                // Example: Run the container (optional)
                // sh 'docker run -d -p 3000:3000 $IMAGE_NAME'
            }
        }
    }
}
