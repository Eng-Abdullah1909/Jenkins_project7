FROM tomcat:9.0

#spedifing work dirictory inside the container
WORKDIR WORKDIR /usr/local/tomcat/webapps/

#copy artifact inside the container into Tomcat's webapps dir
COPY target/*.war .

#copy SRC inside the container
COPY . .
 
#port mapping
EXPOSE 8080
 
#container start point (start tomcat)
CMD ["catalina.sh", "run"]
