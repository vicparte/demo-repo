pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIAL_ID = '65e1f354-c813-4ca3-ba0b-f22053d10f36' // Updated credential ID
    }

    stages {
        stage('Build') {
            steps {
                script {
                    // step to build docker image
                    sh 'docker-compose build .'
                    sh 'docker images'
                    // Add image tag
                    sh 'docker tag react_image vicparte/dev-react_image'

                    // Log in to Docker Hub securely
                    withCredentials([
                        usernamePassword(credentialsId: DOCKER_HUB_CREDENTIAL_ID, usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'MY_SECURE_PASSWORD')]) {
                        sh "echo \$MY_SECURE_PASSWORD | docker login -u \$DOCKER_USERNAME --password-stdin"
                        sh 'docker push vicparte/dev-react_image'
                    }

                    // Remove local images
                    sh 'docker rmi -f react_image'
                    sh 'docker rmi -f vicparte/dev-react_image'
                }
            }
        }
        
        stage('Deploy') {
            steps {
                script {
                    
                    // pulling image from Prod branch
                    sh 'docker pull vicparte/dev-react_image'

                    // Running container with pulled imae
                    sh 'docker run -d -p 80:80 --name devcontainer vicparte/dev-react_image'
                }
            }
        }
    }

    post {
               
        always {
            // Log out from Docker Hub
            sh 'docker logout'
        }
    }
}
