# CI/CD Pipeline with Jenkins, Kubernetes, SonarQube, and Trivy

This project demonstrates a comprehensive CI/CD pipeline using Jenkins, integrating tools like SonarQube for code quality analysis, Trivy for security scanning, and deploying a Java-based application to a Kubernetes cluster.

## Overview

The pipeline automates the following processes:

1. **Code Compilation**: Builds the Java application using Maven.
2. **Code Quality Analysis**: Analyzes the codebase with SonarQube.
3. **Docker Image Creation**: Builds a Docker image of the application.
4. **Docker Image Push**: Pushes the Docker image to Docker Hub.
5. **Security Scanning**: Scans the Docker image and Kubernetes cluster using Trivy.
6. **Deployment**: Deploys the application to a Kubernetes cluster using `kubectl`.

## Features

- **Jenkins Integration**: Automated pipeline defined in `Jenkinsfile`.
- **SonarQube Analysis**: Ensures code quality and detects bugs or code smells.
- **Trivy Scanning**: Performs vulnerability scanning on Docker images and Kubernetes clusters.
- **Dockerization**: Containerizes the application for consistent deployment.
- **Kubernetes Deployment**: Utilizes Kubernetes manifests for deployment and service exposure.

## Prerequisites

Before running the pipeline, ensure the following are set up:

- **Jenkins**: Installed with necessary plugins: Docker, Kubernetes CLI, SonarQube Scanner, etc.
- **Docker**: Installed and configured.
- **SonarQube**: Running container accessible to Jenkins.
- **Trivy**: Installed for security scanning.
- **Kubernetes Cluster**: Accessible via `kubectl`.
- **Docker Hub Credentials**: Stored in Jenkins as `Docker-Hub-UP`.

## Pipeline Stages

1. **Build Code**  
   Cleans and packages the Java application using Maven.

2. **SonarQube Analysis**  
   Runs static code analysis to detect issues.

3. **Docker Login**  
   Authenticates Jenkins with Docker Hub using stored credentials.

4. **Build Image**  
   Builds the Docker image tagged with the current build number.

5. **Push to Docker Registry**  
   Pushes the built image to D

6. **Security Scan - Trivy Docker Image**  
   Scans the Docker image for vulnerabilities and outputs a report.

7. **Deploy to Kubernetes**  
   Applies Kubernetes deployment and service manifests to deploy the application.

8. **Security Scan - Trivy Kubernetes Cluster**  
   Scans the Kubernetes cluster for security issues and outputs a summary report.
   
##
**Access the Application**
Once deployed, access the application via the Kubernetes service URL.
