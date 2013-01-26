#!/bin/sh

JENKINS_HOST=localhost
JENKINS_PORT=8080
JENKINS_JOBNAME=php-template

echo fetching jenkins-cli.jar

wget http://$JENKINS_HOST:$JENKINS_PORT/jnlpJars/jenkins-cli.jar

echo installing plugins

java -jar jenkins-cli.jar -s http://$JENKINS_HOST:$JENKINS_PORT install-plugin checkstyle cloverphp dry htmlpublisher jdepend plot pmd violations xunit

echo setting up job

curl jenkins_config.xml | java -jar jenkins-cli.jar -s http://$JENKINS_HOST:$JENKINS_PORT create-job $JENKINS_JOBNAME

echo restarting

java -jar jenkins-cli.jar -s http://$JENKINS_HOST:$JENKINS_PORT safe-restart
