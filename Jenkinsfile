pipeline {
    agent any
    triggers {
        cron('H/5 * * * *')
    }
    stages {
        stage('Start') {
            steps {
                echo 'Lab_3: started'
            }
        }
        stage('Clean') {
            steps {
                sh 'docker stop nginx-lab3 || true'
                sh 'docker rm nginx-lab3 || true'
            }
        }
        stage('Build nginx/custom') {
            steps {
                sh 'docker build -t nginx/custom:latest .'
            }
        }
        stage('Test nginx/custom') {
            steps {
                sh 'docker images | grep nginx/custom'
                echo 'Image exists — Test passed!'
            }
        }
        stage('Deploy nginx/custom') {
            steps {
                sh 'docker run -d --name nginx-lab3 -p 80:80 nginx/custom:latest'
            }
        }
    }
    post {
        success {
            telegramSend(message: '✅ Lab_3 build SUCCESS!', chatId: 709835761)
        }
        failure {
            telegramSend(message: '❌ Lab_3 build FAILED!', chatId: 709835761)
        }
    }
}