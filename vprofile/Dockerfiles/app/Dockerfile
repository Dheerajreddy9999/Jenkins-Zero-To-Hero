FROM openjdk:8 as base
RUN apt update && apt install maven -y
RUN git clone https://github.com/Dheerajreddy9999/vprofile-project.git
RUN cd vprofile-project/vprofile && mvn install




FROM tomcat:8-jre11
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=base vprofile-project/vprofile/target/vprofile-v2.war /usr/local/tomcat/webapps/ROOT.war
WORKDIR /usr/local/tomcat/
VOLUME /usr/local/tomcat/webapps
EXPOSE 8080
CMD ["catalina.sh","run"]