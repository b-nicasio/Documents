#!/bin/bash

if [[ $(ps -ef | grep -c ci-gbh)  -ne 1 ]]; then
    java -jar agent.jar -jnlpUrl .....
else
    echo "Agent is already running..."
fi