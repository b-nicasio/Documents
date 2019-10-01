# Amadita mobile

## Android SDK instalation

sudo apt install default-jdk
sudo apt install unzip
cd ~
wget https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
unzip sdk-tools-linux-4333796.zip
rm sdk-tools-linux-4333796.zip
mkdir android-sdk
mv tools android-sdk/tools

export ANDROID_HOME=$HOME/android-sdk
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

## Errors

Error: ENOSPC: System limit for number of file watchers reached
Solved with:
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p


SDK location not found. Define location with sdk.dir in the local.properties
Solved adding exporting the variables:
export ANDROID_HOME=$HOME/android-sdk
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

problems with react

npm install react-native@0.33.1
npm install react-native-cli@1.2.0

## Notes

The branch should always be masterl



# Nginx for KONEKSI WebApp
server {
        listen 3007;

        client_max_body_size 10m;

        root /srv/koneksi_webapp/build;

        index index.html;

        add_header X-Frame-Options "SAMEORIGIN" always;
        add_header X-XSS-Protection "1; mode=block";
        add_header X-Content-Type-Options "nosniff" always;


        add_header 'Access-Control-Allow-Origin' '*';
        add_header 'Access-Control-Allow-Methods' 'GET, POST, OPTIONS';
        add_header 'Access-Control-Allow-Headers' 'DNT,User-Agent,X-Requested-With,If-Modified-Since,Content-Type,Range';
        add_header 'Access-Control-Expose-Headers' 'Content-Length,Content-Range';


        access_log /var/log/nginx/koneksi_webapp.access.log;
        error_log /var/log/nginx/koneksi_webapp.error.log;

        location / {
                try_files $uri $uri/ /index.html;
        }
}

# GBH website

## Errors
WP-admin css not loading properly
solution:
Add this to wp-config.php this concatenates all dependencies on the url
define( 'CONCATENATE_SCRIPTS', false ); 