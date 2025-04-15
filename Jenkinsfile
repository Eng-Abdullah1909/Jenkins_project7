pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('Docker-Hub-UP')

    }   


    stages {
         stage('Checkout from Git') {
            steps {
                git branch: 'main', url: 'https://github.com/Eng-Abdullah1909/DEPI-Final-Project.git'
                     
            }
        }       
        //stage('build-SRC') {    
            //steps{
                //building the code using Maven build tool        
                //sh 'mvn clean package'
            //}
        //}

        stage('Docker Login') {
            steps {
                // Add --password-stdin to run docker login command non-interactively
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }   

        stage('Build & push Dockerfile'){
            steps{
                sh 'ansible-playbook ansible-playbook.yml'
            }

        }


    }

}
