#!/bin/bash

if [[ $(ps -ef | grep -c ci-amadita)  -ne 1 ]]; then
    java -jar agent.jar -jnlpUrl https://ci.amadita.com/computer/macOs/slave-agent.jnlp -secret ada609f690f812741ca67dfc4de89debae1adb1bf0afd5cba8e2ec4110b3599f 
else
    echo "Amadita CI agent is already running..."
fi
