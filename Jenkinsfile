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
        sh 'curl -s -X POST https://api.telegram.org/bot8576580592:AAGJdLy94LMvY-jwDoLzhEsuq90a5t33Mw4/sendMessage -d chat_id=709835761 -d text=Lab3_build_SUCCESS'
    }
    failure {
        sh 'curl -s -X POST https://api.telegram.org/bot8576580592:AAGJdLy94LMvY-jwDoLzhEsuq90a5t33Mw4/sendMessage -d chat_id=709835761 -d text=Lab3_build_FAILED'
    }
}
}