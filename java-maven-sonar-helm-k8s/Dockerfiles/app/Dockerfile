FROM maven:3.8.6-openjdk-8-slim as base
RUN git clone https://github.com/Dheerajreddy9999/vprofile-project.git
RUN cd vprofile-project && mvn install


FROM tomcat:8-jre11
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=base vprofile-project/vprofile/target/vprofile-v2.war /usr/local/tomcat/webapps/ROOT.war
WORKDIR /usr/local/tomcat/
VOLUME /usr/local/tomcat/webapps
EXPOSE 8080
CMD ["catalina.sh","run"]