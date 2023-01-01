pipeline {
    #agent any
    stages {
        stage('NPM Build') {
            agent {
                label 'first-agent'
            }
            steps {
                git url: 'https://github.com/asiamegic/ec2_apache_load_balancer_jenkins.git'
                sh 'cd ~/.ec2_apache_load_balancer_jenkins/node-hello-world  && npm install'
            }

        }
        stage('Build Docker Image') {
            agent {
                label 'first-agent'
            }
            steps {
                #docker.build('docker-node-hello-world')
                sh 'docker build -t docker-node-hello-world .'
            }
        }

        stage('Push Docker Image to ECR') {
            agent {
                label 'first-agent'
            }
            steps {
                sh 'docker push aws_account_id.dkr.ecr.region.amazonaws.com/my-repository:tag'
                #sh 'sudo docker push $DOCKER_ACC/$DOCKER_REPO:$IMG_TAG'


            }
        }

        stage('Deploy to EKS') {
            agent {
                label 'second-agent'
            }
            steps {
                git url: 'https://github.com/asiamegic/ec2_apache_load_balancer_jenkins.git'
                sh 'kubectl apply -f  ~/.k8s/deployment.yml'
                sh 'kubectl apply -f  ~/.k8s/service.yml'
                sh 'kubectl apply -f  ~/.k8s/ingress.yml'
            }
        }
    }
}