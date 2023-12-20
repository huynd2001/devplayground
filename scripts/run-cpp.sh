#!/bin/bash

CPP_FILE=main
TEMP_FOLDER_CPP=/tmp/cpp/output

mkdir -p ${TEMP_FOLDER_CPP}
g++ ${WORKSPACE}/cpp/${CPP_FILE}.cpp -o ${TEMP_FOLDER_CPP}/a.out
${TEMP_FOLDER_CPP}/a.out
