##artifact build stage
FROM maven AS buildstage
RUN mkdir /opt/maven-web-app
WORKDIR /opt/maven-web-app
COPY . .
RUN mvn clean install    ## artifact -- .war

### tomcat deploy stage
FROM tomcat
WORKDIR webapps
COPY --from=buildstage /opt/maven-web-app/target/*.war .
RUN rm -rf ROOT && mv *.war ROOT.war
EXPOSE 8080
