pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('Docker-Hub-UP')
        Image_name = "engabdullah1909/jpetstore-webapp"

    }   


    stages {
        //stage('build-SRC') {    
            //steps{
            //building the code using Maven build tool        
            //sh 'mvn clean validate'
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