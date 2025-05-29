pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "mydockerhubusername/myapp:latest"
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${DOCKER_IMAGE} ."
            }
        }
        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                      echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                      docker push ${DOCKER_IMAGE}
                    '''
                }
            }
        }
        stage('Deploy to Swarm') {
            steps {
                sh '''
                  docker service update --image ${DOCKER_IMAGE} myapp_service || \
                  docker service create --name myapp_service --replicas 3 ${DOCKER_IMAGE}
                '''
            }
        }
    }
}
