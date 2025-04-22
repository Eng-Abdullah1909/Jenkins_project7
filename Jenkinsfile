pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('Docker-Hub-UP')
        SCANNER_HOME=tool 'sonar-scanner'
    }   

    tools {
        jdk 'jdk11'
        maven 'maven3'
    }
    
    

    stages {     
         stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('sonar-scanner') {
                sh ''' 'sonar-scanner' \
                -Dsonar.projectName=my-project \
                -Dsonar.projectKey=store \
                -Dsonar.java.binaries=target/classes \
                -Dsonar.sources=. '''
                }
            }
        }
        
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

        stage('pushing to dokcer rejestiry'){
            steps{
                echo 'pushing the image'               
                //pushing the image
                sh 'docker push engabdullah1909/jpetstore-webapp'
            }
        }        


        //stage('Security Scan-Trivy') {
            //steps {
                //echo 'Running Trivy scan on Docker image'
                //sh 'trivy image --exit-code 1 --severity HIGH --format table --output trivy-report.txt --scanners vuln engabdullah1909/jpetstore-webapp || true'

                // `|| true` ensures the pipeline continues even if vulnerabilities are found 
                // --scanners vuln o disable secret scanning (just to decrease build time)
            //}
        //}


        stage('run the app'){
            steps{
                sh ' docker run -d -p 8088:8080 engabdullah1909/jpetstore-webapp '
            }

        }        

    }
}
