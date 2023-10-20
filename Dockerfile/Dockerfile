FROM eclipse-temurin:17

COPY ./helio-publisher-*jar /usr/src/helio-publisher/helio-publisher.jar
WORKDIR /usr/src/helio-publisher
RUN mkdir ./views
RUN mkdir ./db


EXPOSE 9000
EXPOSE 4567

CMD ["java", "-jar", "./helio-publisher.jar"]
