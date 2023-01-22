FROM anapsix/alpine-java 
LABEL maintainer="manas@gmail.com"
COPY /target/spring-petclinic-2.5.0.jar /home/spring-petclinic-2.5.0.jar 
CMD ["java","-jar","/home/spring-petclinic-1.5.1.jar"]
