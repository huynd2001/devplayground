#!/bin/bash

JAVA_FILE=Main
JAVA_8_HOME=/usr/lib/jvm/java-1.8.0-amazon-corretto
TEMP_FOLDER_JAVA=/tmp/java/output

mkdir -p ${TEMP_FOLDER_JAVA}
${JAVA_8_HOME}/bin/javac -d ${TEMP_FOLDER_JAVA} ${WORKSPACE}/java/${JAVA_FILE}.java
${JAVA_8_HOME}/bin/java -cp ${TEMP_FOLDER_JAVA} ${JAVA_FILE}
