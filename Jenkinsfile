pipeline {
    agent { label 'ubuntu' }

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', credentialsId: 'github-ssh', url: 'git@github.com:anastasiamoiseenko/MyWebApp.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t anastasiamoiseenko/webapp:1.1 .'
            }
        }
        stage('Push Docker Image') {
            steps {
                withDockerRegistry(credentialsId: 'dockerhub-cred', url: 'https://index.docker.io/v1/') {
                    sh '''
                        docker push anastasiamoiseenko/webapp:1.1
                    '''
                }
            }
        }
        stage('Delete Docker Image Locally') {
            steps {
                sh 'docker rmi anastasiamoiseenko/webapp:1.1'
            }
        }
        stage('Stop and Remove old Containers on Web Server') {
            steps {
                sshagent(['ssh-agent-webserver']) {
                    sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.16.236 docker stop webapp'
                    sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.16.236 docker container rm -f webapp'
                }
            }
        }
        stage('Run Container on Web Server') {
            steps {
                sshagent(['ssh-agent-webserver']) {
                    sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.16.236 docker run -p 8080:8080 -d --name webapp anastasiamoiseenko/webapp:1.1'
                }
            }
        }
    }
}