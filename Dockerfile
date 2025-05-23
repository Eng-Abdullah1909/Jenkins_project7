FROM tomcat:9.0

#spedifing work dirictory inside the container
WORKDIR  /usr/local/tomcat/webapps/


# Clean default apps
RUN rm -rf /usr/local/tomcat/webapps/*


#copy artifact inside the container into Tomcat's webapps dir
COPY target/jpetstore.war /usr/local/tomcat/webapps/jpetstore.war

#port mapping
EXPOSE 8080
 
#container start point (start tomcat)
CMD ["catalina.sh", "run"]
