FROM jenkins/jenkins:latest-jdk17

USER root

RUN apt update && apt install wget -y

# instalar Powershell Core con un script
WORKDIR /root
COPY ./script-instalacion-pwsh.sh .
RUN chmod u+x script-instalacion-pwsh.sh && \
	sh -c ./script-instalacion-pwsh.sh && \
	rm script-instalacion-pwsh.sh

WORKDIR /var/jenkins_home
USER jenkins