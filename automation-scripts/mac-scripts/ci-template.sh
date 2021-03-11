#!/bin/bash

if [[ $(ps -ef | grep -c ci-gbh)  -ne 1 ]]; then
    java -jar agent.jar -jnlpUrl .....
else
    echo "GBH CI agent is already running..."
fi