pipeline {
    agent any

    environment {
        IMAGE_NAME = "my-springboot-app"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/your-username/your-repo.git' // or use SCM
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image Locally') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}")
                }
            }
        }
    }

    post {
        success {
            echo "Docker image '${IMAGE_NAME}' built and available locally."
        }
    }
}
