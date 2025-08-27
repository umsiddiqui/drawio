FROM tomcat:9-jre11-slim

RUN apt-get update && apt-get install -y openjdk-8-jdk ant

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH

COPY . /app

RUN cd /app/etc/build && ant war

RUN ls -l /app/build         # List build folder to confirm war exists
RUN cp /app/build/draw.war /usr/local/tomcat/webapps/draw.war

RUN ls -l /usr/local/tomcat/webapps     # List webapps folder to confirm copy

EXPOSE 8080

CMD ["catalina.sh", "run"]
