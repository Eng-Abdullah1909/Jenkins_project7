#using base image (verified tomcat image)
FROM tomcat:9.0

# Install JMX Exporter
ADD https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.20.0/jmx_prometheus_javaagent-0.20.0.jar /usr/local/tomcat/jmx_prometheus_javaagent.jar

# Copy  war file into container
COPY target/jpetstore.war /usr/local/tomcat/webapps/jpetstore.war

# Copy JMX config
COPY config.yml /usr/local/tomcat/config.yml

# Update Catalina to use JMX exporter
ENV CATALINA_OPTS="-javaagent:/usr/local/tomcat/jmx_prometheus_javaagent.jar=8086:/usr/local/tomcat/config.yml"

EXPOSE 8085 8086
