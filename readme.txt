Test locally
cd ~/Final-project/DEPI-Final-Project    #Repo's projct path
mvn clean package
sudo cp target/jpetstore.war /var/lib/tomcat9/webapps/
http://localhost:8080/jpetstore


