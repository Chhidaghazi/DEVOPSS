FROM openjdk:11
EXPOSE 8089
ADD ./target/ExamThourayaS2-1.0.3-SNAPSHOT.jar DEVOPSS.jar
ENTRYPOINT ["java","-jar","/DEVOPSS.jar"]