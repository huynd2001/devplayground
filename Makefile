JAVA_FILE=Main
JAVA_8_HOME=/usr/lib/jvm/java-8-amazon-corretto
JAVA_17_HOME=/usr/lib/jvm/java-17-amazon-corretto
TEMP_FOLDER_JAVA=/tmp/java/output

.PHONY: run-java-8
run-java-8:
	JAVAHOME=${JAVA_8_HOME}
	${JAVA_8_HOME}/bin/javac -d ${TEMP_FOLDER_JAVA} java/${JAVA_FILE}.java
	${JAVA_8_HOME}/bin/java -cp ${TEMP_FOLDER_JAVA} ${JAVA_FILE}

.PHONY: run-java-17
run-java-17:
	JAVAHOME=${JAVA_17_HOME}
	${JAVA_17_HOME}/bin/javac -d ${TEMP_FOLDER_JAVA} java/${JAVA_FILE}.java
	${JAVA_17_HOME}/bin/java -cp ${TEMP_FOLDER_JAVA} ${JAVA_FILE}
	