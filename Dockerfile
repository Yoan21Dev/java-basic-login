FROM openjdk:11-jre-slim
LABEL authors="YARM"
# Copia el archivo JAR de la aplicación al contenedor
COPY target/demo-jwt-0.0.1-SNAPSHOT.jar /app/app.jar
# Establece el directorio de trabajo
WORKDIR /app
# Expone el puerto en el que se ejecuta la aplicación Spring Boot
EXPOSE 8080

#ENTRYPOINT ["top", "-b"]
# Comando para ejecutar la aplicación al iniciar el contenedor
CMD ["java", "-jar", "app.jar"]