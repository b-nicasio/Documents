#!/bin/bash

git add .

git status

DATE=$(date)
echo "-------------"
echo "commit message: Changes made on ${DATE}"
echo "-------------"

git commit -m "Changes made on ${DATE}"

git push origin master
