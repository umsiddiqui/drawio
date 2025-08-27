FROM tomcat:9.0-jdk8-openjdk-bullseye

# Install ant
RUN apt-get update && apt-get install -y ant

# Copy all code for build
COPY . /app

# Build WAR with Ant
RUN cd /app/etc/build && ant war

# List WAR file to confirm creation
RUN ls -l /app/build

# Copy WAR to Tomcat webapps folder
RUN cp /app/build/draw.war /usr/local/tomcat/webapps/draw.war

# List contents in Tomcat webapps to confirm
RUN ls -l /usr/local/tomcat/webapps

EXPOSE 8080

CMD ["catalina.sh", "run"]
