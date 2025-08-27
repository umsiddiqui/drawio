FROM tomcat:9-jre11-slim

# Install required packages: openjdk-8-jdk and ant
RUN apt-get update && apt-get install -y openjdk-8-jdk ant

# Set JAVA_HOME (update path if needed)
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH

# Copy entire repo to container for build
COPY . /app

# Build the WAR file using Ant
RUN cd /app/etc/build && ant war

# Copy the built WAR into Tomcat's webapps folder
RUN cp /app/build/draw.war /usr/local/tomcat/webapps/draw.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
