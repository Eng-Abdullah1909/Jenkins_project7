pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('Docker-Hub-UP')

    }   


    stages {     
        stage('build-code') {    
            steps{
                echo 'Building the code using Maven'               
                //building the code using Maven build tool        
                sh 'mvn clean package'
            }
        }



        stage('Docker Login') {
            steps {
                // Add --password-stdin to run docker login command non-interactively
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }   

   
        stage('build-image') {    
            steps{
                echo 'Building the image'               
                //building the code using Maven build tool        
                sh 'docker build -t engabdullah1909/jpetstore-webapp .'
            }
        }        

        stage('pushing to dokcer rejestiry')
            steps{
                echo 'Building the image'               
                //pushing the image
                sh 'docker push engabdullah1909/jpetstore-webapp'
            }
        }        


        stage('Security Scan-Trivy') {
            steps {
                echo 'Running Trivy scan on Docker image'
                sh 'trivy image --exit-code 1 --severity CRITICAL,HIGH --format table --output trivy-report.txt engabdullah1909/jpetstore-webapp || true'

                // `|| true` ensures the pipeline continues even if vulnerabilities are found
            }
        }


        stage('run the app'){
            steps{
                sh ' docker run --name petstore-webapp-container -p 8085:8080 engabdullah1909/jpetstore-webapp '
            }

        }        

    }
}
