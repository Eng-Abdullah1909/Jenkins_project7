pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('Docker-Hub-UP')
    }   

    tools {
        jdk 'jdk17'
        maven 'maven3'
    }

    stages {
        stage('build-code') {
            steps {
                echo 'Building the code using Maven'
                sh 'mvn clean package'
            }
        }

        stage('Docker Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }   

        stage('build-image') {
            steps {
                echo 'Building the image'
                sh "docker build -t engabdullah1909/jpetstore-webapp:${BUILD_NUMBER} ."
            }
        }

        stage('pushing to dokcer rejestiry') {
            steps {
                echo 'pushing the image'
                sh 'docker push engabdullah1909/jpetstore-webapp:${BUILD_NUMBER}'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                echo 'Deploying to Minikube Kubernetes cluster'
                sh 'kubectl apply -f k8s/deployment.yaml'
                sh 'kubectl apply -f k8s/service.yaml'
            }
        }

        stage('Security Test - OWASP ZAP') {
            steps {
                 echo 'Running ZAP baseline scan against app in Minikube'
                 sh '''
                 OUTPUT_DIR=/tmp/zap-output
                 mkdir -p $OUTPUT_DIR
                 chmod 777 $OUTPUT_DIR

                 APP_URL=http://$(minikube ip):30088

                 docker run --rm -v $OUTPUT_DIR:/zap/wrk \
                 ghcr.io/zaproxy/zaproxy:stable zap-baseline.py \
                -t $APP_URL -g gen.conf -r zap-report.html || true
                '''
            }
        }

    }

}
