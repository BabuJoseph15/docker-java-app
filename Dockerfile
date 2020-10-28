FROM openjdk:8-jdk-alpine

ARG JAR_FILE=/var/lib/jenkins/workspace/Nexus-DockerImage/target/find-links.jar
ARG JAR_LIB_FILE=/var/lib/jenkins/workspace/Nexus-DockerImage/target/lib/

#cd /usr/local/nexus
WORKDIR /usr/local/nexus

# copy target/find-links.jar /usr/local/nexus/app.jar
COPY ${JAR_FILE} /usr/local/nexus/app.jar

#copy project dependencies
#cp -rf target/lib /usr/local/nexus/lib
ADD ${JAR_LIB_FILE} lib/

#java -jar /usr/local/nexus/app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]


