FROM jenkins/jenkins:lts

ENV JENKINS_USER admin
ENV JENKINS_PASS admin
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/plugins.txt

COPY config.xml /usr/share/jenkins/ref/jobs/Lab_5/config.xml

USER root

RUN apt-get update \
    && apt-get install -qqy apt-transport-https ca-certificates curl gnupg2

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

RUN echo "deb [arch=arm64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian bookworm stable" | tee /etc/apt/sources.list.d/docker.list

RUN apt-get update -qq \
    && apt-get install docker-ce -y \
    && apt-get clean

RUN usermod -aG docker jenkins

USER jenkins
