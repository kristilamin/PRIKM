pipeline {
    agent any
    stages {
        stage('Start') {
            steps {
                echo 'Lab_1: nginx/custom — by Khrystyna Ponomarenko ITPA-11'
            }
        }
        stage('Clean') {
            steps {
                sh 'docker stop nginx-lab1 || true'
                sh 'docker rm nginx-lab1 || true'
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
                sh 'docker run -d --name nginx-lab1 -p 80:80 nginx/custom:latest'
            }
        }
        stage('Notify') {
            steps {
                echo 'Deployment finished successfully!'
            }
        }
    }
}