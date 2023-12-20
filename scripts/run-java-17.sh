#!/bin/bash

JAVA_FILE=Main
JAVA_17_HOME=/usr/lib/jvm/java-17-amazon-corretto
TEMP_FOLDER_JAVA=/tmp/java/output

mkdir -p ${TEMP_FOLDER_JAVA}
${JAVA_17_HOME}/bin/javac -d ${TEMP_FOLDER_JAVA} ${WORKSPACE}/java/${JAVA_FILE}.java
${JAVA_17_HOME}/bin/java -cp ${TEMP_FOLDER_JAVA} ${JAVA_FILE}
