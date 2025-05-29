pipeline {
    agent any

    environment {
        IMAGE_NAME = 'atmaratmar/test-app'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo 'Building Docker image...'
                script {
                    sh 'docker build -t $IMAGE_NAME .'
                }
            }
        }

        stage('Test') {
            steps {
                echo 'Testing (placeholder)...'
                // Add your test commands if any
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying Docker image...'
                // Optional: Push to Docker Hub or run the container
                // sh 'docker run -d -p 3000:3000 $IMAGE_NAME'
            }
        }
    }
}
