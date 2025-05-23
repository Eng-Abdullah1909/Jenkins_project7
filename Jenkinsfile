pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('Docker-Hub-UP')
        // SCANNER_HOME=tool 'sonar-scanner'
    }   

    tools {
        jdk 'jdk17'
        maven 'maven3'
    }

    stages {    
        stage('build-code') {    
            steps{
                echo 'Building the code using Maven'               
                //building the code using Maven build tool        
                sh 'mvn clean package'
            }
        }

           
         //stage('SonarQube Analysis') {
            //steps {
                //withSonarQubeEnv('SonarServer') {
                //sh ''' 'sonar-scanner' \
                //-Dsonar.projectName=my-project \
                //-Dsonar.projectKey=store \
                //-Dsonar.java.binaries=target/classes \
                //-Dsonar.sources=. '''
                //}
            //}
        //}

        
        stage('Docker Login') {
            steps {
                // Add --password-stdin to run docker login command non-interactively
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }   

   
        stage('build-image') {
            steps {
                echo 'Building the image'
                sh "docker build -t engabdullah1909/jpetstore-webapp:${BUILD_NUMBER} ."
            }
        }
   

        stage('pushing to dokcer rejestiry'){
            steps{
                echo 'pushing the image'               
                //pushing the image
                sh 'docker push engabdullah1909/jpetstore-webapp:${BUILD_NUMBER}'
            }
        }        


        stage('Security Scan - Trivy Docker image') {
            steps {
                echo 'Running Trivy scan on Docker image'
                sh 'trivy image --exit-code 1 --severity HIGH --format table --output trivy-report.txt --scanners vuln engabdullah1909/jpetstore-webapp || true'

                //|| 'true` ensures the pipeline continues even if vulnerabilities are found 
                //--scanners vuln o disable secret scanning (just to decrease build time)
            }
        }


        stage('Deploy to Kubernetes') {
            steps {
                 echo 'Deploying to Minikube Kubernetes cluster'
                 // Create Kubernetes deployment and service
                 sh 'kubectl apply -f k8s/deployment.yaml'
                 sh 'kubectl apply -f k8s/service.yaml'


            }
        }


        stage('Security Scan - Trivy Kubernetes Cluster') {
            steps {
                echo 'Running Trivy scan on Kubernetes cluster'
                sh   'trivy k8s --report summary --format table --output trivy-cluster-report.txt || true cluster '  
                // || true ensures the pipeline doesn't fail even if issues are found.  
                

            }
        }
   

    }

}
