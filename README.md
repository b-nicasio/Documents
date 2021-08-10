# Issue Documentation
This is a documentation of all the errors and findings that might be usefull on the future. Here you will find all kind of error found on the journey of becoming a senior DevOps Engineer.

# General errors

## WP-admin css not loading properly
### solution:
Add this to wp-config.php this concatenates all dependencies on the url
define( 'CONCATENATE_SCRIPTS', false );

## options-ssl-nginx.conf" failed (2: No such file or directory)
### Solution:
Check the nginx configuration on sites-enabled

# Usefull tools

## Find all GB on the directory specified
du -h -a /dir | grep "[0-9]G\b"

## Create a CSV of users on AWS account
```
aws iam list-users --profile GBH >> users.json
```
http://convertcsv.com/json-to-csv.htm
