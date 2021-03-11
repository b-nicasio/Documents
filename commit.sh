#!/bin/bash

git add .

git status

DATE=$(date)
echo "commit message: Changes made on ${DATE}"

git commit -m "Changes made on ${DATE}"

git push origin master
