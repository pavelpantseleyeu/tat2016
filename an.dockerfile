FROM openjdk:8-jdk

COPY ./${fieName} /usr/local/an/

RUN chmod 777 /usr/local/an/*.jar

EXPOSE 11010

CMD ["java","-jar","/usr/local/an/${fileName}"]