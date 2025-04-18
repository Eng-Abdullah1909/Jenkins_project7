This project demonstrates a full DevOps pipeline using **Jenkins**, **Maven**, **Docker**, **Ansible**, **Prometheus**, and **Grafana** to build, deploy, and monitor a Java web application.

## 🛠 Project Overview

- **Application:** Java web app (`jpetstore`) running on Tomcat inside Docker
- **CI/CD:** Jenkins pipeline automates build, Docker image creation, and deployment
- **Monitoring:** Prometheus scrapes metrics from the app (via JMX Exporter) and system (via Node Exporter), visualized using Grafana
- **Infrastructure:** Managed using Docker Compose and Ansible

---

## 📋 Pipeline Stages

1. **Checkout from GitHub**  
   Jenkins pulls the source code from the repository.

2. **Build Source Code**  
   Maven builds the Java application (`mvn clean package`).

3. **Docker Login**  
   Jenkins authenticates with Docker Hub using saved credentials.

4. **Build & Push Docker Image**  
   Ansible Playbook builds the Docker image and pushes it to Docker Hub.

5. **Deployment & Monitoring**  
   Docker Compose launches the application, Prometheus, Grafana, and Node Exporter containers.

---

## 📦 Technologies Used

- Jenkins
- Maven
- Docker & Docker Compose
- Ansible
- Prometheus
- Grafana
- Tomcat 9
- JMX Exporter
- Node Exporter

---

## 📑 How to Run

1. Clone the project:

```bash
git clone https://github.com/Eng-Abdullah1909/DEPI-Final-Project.git
cd DEPI-Final-Project
```

2. Build the project using Maven:

```bash
mvn clean package
```

3. Run the Ansible playbook:

```bash
ansible-playbook ansible-playbook.yml
```

4. Start the services with Docker Compose:

```bash
docker-compose up -d --build
```

5. Access services:
   - Application: `http://localhost:8085/jpetstore`
   - Prometheus: `http://localhost:9090`
   - Grafana: `http://localhost:3000`

---

## 📈 Monitoring Setup

- The Java web app is instrumented with a **JMX Exporter** exposing metrics on port `8086`.
- **Prometheus** scrapes:
  - JMX metrics from the web app
  - System metrics from **Node Exporter** (`9100`)
- **Grafana** is pre-configured to visualize performance and resource usage.

---

## 🔐 Credentials

- Docker Hub credentials are stored securely in Jenkins credentials manager and injected into the pipeline.
- Grafana default login:
  - Username: `admin`
  - Password: `admin`
