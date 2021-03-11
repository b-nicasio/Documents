#!/bin/bash

if [[ $(ps -ef | grep -c ci-gbh)  -ne 1 ]]; then
    java -jar /Users/gbh/Jenkins/agent.jar -jnlpUrl https://ci.gbhlabs.net/computer/macos-node/slave-agent.jnlp -secret 45d936baa6386b560498d3896e1c3f16c3bc4a3a7d877c565ad04cb4ca91d84e 
else
    echo "GBH CI agent is already running..."
fi