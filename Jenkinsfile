pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                echo 'Code checked out from Git'
            }
        }
        stage('Terraform Init') {
            steps {
                sh 'cd /var/lib/jenkins/workspace/Lab_8/terraform && terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'cd /var/lib/jenkins/workspace/Lab_8/terraform && terraform plan'
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'cd /var/lib/jenkins/workspace/Lab_8/terraform && terraform apply -auto-approve'
            }
        }
        stage('Ansible Deploy') {
            steps {
                sh 'cd /var/lib/jenkins/workspace/Lab_8/ansible && ansible-playbook playbook.yml'
            }
        }
        stage('Smoke Test') {
            steps {
                sh 'sleep 10'
                sh 'curl -s http://localhost:8086 | grep -i nginx'
                sh 'curl -s http://localhost:9091'
                sh 'curl -f http://localhost:3001/api/health'
            }        
        }
    }
    post {
        failure {
            sh 'cd /var/lib/jenkins/workspace/Lab_8/terraform && terraform destroy -auto-approve'
        }
        always {
            echo 'Pipeline finished!'
        }
    }
}