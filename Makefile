JAVA_FILE=Main
JAVA_8_HOME=/usr/lib/jvm/java-1.8.0-amazon-corretto
JAVA_17_HOME=/usr/lib/jvm/java-17-amazon-corretto
TEMP_FOLDER_JAVA=/tmp/java/output

CPP_FILE=main
TEMP_FOLDER_CPP=/tmp/cpp/output

PYTHON_FILE=main

.PHONY: run-java-8
run-java-8:
	mkdir -p ${TEMP_FOLDER_JAVA}
	${JAVA_8_HOME}/bin/javac -d ${TEMP_FOLDER_JAVA} java/${JAVA_FILE}.java
	${JAVA_8_HOME}/bin/java -cp ${TEMP_FOLDER_JAVA} ${JAVA_FILE}

.PHONY: run-java-17
run-java-17:
	mkdir -p ${TEMP_FOLDER_JAVA}
	${JAVA_17_HOME}/bin/javac -d ${TEMP_FOLDER_JAVA} java/${JAVA_FILE}.java
	${JAVA_17_HOME}/bin/java -cp ${TEMP_FOLDER_JAVA} ${JAVA_FILE}
	
.PHONY: run-cpp
run-cpp:
	mkdir -p ${TEMP_FOLDER_CPP}
	g++ cpp/${CPP_FILE}.cpp -o ${TEMP_FOLDER_CPP}/a.out
	${TEMP_FOLDER_CPP}/a.out

.PHONY: run-python
run-python:
	python3 python/${PYTHON_FILE}.py