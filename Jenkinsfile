pipeline {
    agent any
    stages {
        stage('Start') {
            steps {
                echo 'Lab_2: started by GitHub'
            }
        }
        stage('Clean') {
            steps {
                sh 'docker stop nginx-lab2 || true'
                sh 'docker rm nginx-lab2 || true'
            }
        }
        stage('Image build') {
            steps {
                sh "docker build -t prikm:latest ."
                sh "docker tag prikm kristilamin/prikm:latest"
                sh "docker tag prikm kristilamin/prikm:$BUILD_NUMBER"
            }
        }
        stage('Push to registry') {
            steps {
                withDockerRegistry([ credentialsId: "dockerhub_token", url: "" ]) {
                    sh "docker push kristilamin/prikm:latest"
                    sh "docker push kristilamin/prikm:$BUILD_NUMBER"
                }
            }
        }
        stage('Deploy image') {
            steps {
                sh "docker run -d --name nginx-lab2 -p 80:80 kristilamin/prikm:latest"
            }
        }
    }
}