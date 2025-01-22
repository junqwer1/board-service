FROM openjdk:17-jdk
ARG JAR_FILE=build/libs/boardservice-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} app.jar

ENV DDL_AUTO=update

ENTRYPOINT ["java", "-jar", "-Dconfig.server=${CONFIG_SERVER}","-Ddb.host=${DB_HOST}", "-Ddb.password=${DB_PASSWORD}", "-Ddb.username=${DB_USERNAME}", "-Dddl.auto=${DDL_AUTO}", "-Deureka.server=${EUREKA_SERVER}", "-Dhostname=${HOSTNAME}", "app.jar"]

#db.host=localhost:1522;db.password=oracle;db.username=MSA_PROJECT;ddl.auto=update;eureka.server=localhost:3998;hostname=localhost
EXPOSE 3995