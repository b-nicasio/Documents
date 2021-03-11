#!/bin/bash

git add .

git status

DATE=$(date)
echo "\n-------------"
echo "commit message: Changes made on ${DATE}"
echo "-------------\n"

git commit -m "Changes made on ${DATE}"

git push origin master
