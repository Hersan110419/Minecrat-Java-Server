# Usa una imagen base de Ubuntu
FROM ubuntu:20.04

# Instala Java (necesario para ejecutar Minecraft)
RUN apt-get update && \
    apt-get install -y openjdk-17-jre-headless wget unzip && \
    apt-get clean;

# Crea el directorio de trabajo para el servidor
WORKDIR /minecraft

# Descarga Minecraft Forge 1.20.1
RUN wget -O forge-installer.jar https://maven.minecraftforge.net/net/minecraftforge/forge/1.20.1-47.3.0/forge-1.20.1-47.3.0-installer.jar

# Instala Forge en el directorio actual
RUN java -jar forge-installer.jar --installServer

# Acepta el EULA de Minecraft
RUN echo "eula=true" > eula.txt

# El puerto en el que se ejecutará el servidor
EXPOSE 25565

# Inicia el servidor de Minecraft
CMD ["java", "-Xmx8G", "-Xms8G", "-jar", "forge-1.20.1-47.3.0.jar", "--nogui"]
