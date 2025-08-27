FROM tomcat:9-jre11-slim

COPY ./src/main/webapp /usr/local/tomcat/webapps/draw

EXPOSE 8080

CMD ["catalina.sh", "run"]
