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

## Better version of the installation

wget http://dl.google.com/android/android-sdk_r24.4.1-linux.tgz

tar -xvf android-sdk*-linux.tgz

cd android-sdk-linux/tools

./android update sdk --no-ui --filter platform,platform-tools

### Set path
echo 'export PATH=$PATH:/opt/android-sdk-linux/platform-tools' >> sudo /etc/profile.d/android.sh

echo 'export ANDROID_TOOLS=/opt/android-sdk-linux' >> sudo /etc/profile.d/android.sh
source /etc/profile.d/android.sh

### Add i386 support
sudo dpkg --add-architecture i386

sudo apt-get update

sudo apt-get install -y libc6:i386 libstdc++6:i386 zlib1g:i386

### Install sdks
cd /opt/android-sdk-linux/tools

./android list sdk --all

./android update sdk --no-ui --all



## Errors

Error: ENOSPC: System limit for number of file watchers reached
Solved with:
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p


SDK location not found. Define location with sdk.dir in the local.properties
Solved adding exporting the variables:
export ANDROID_HOME=$HOME/android-sdk
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools



## Notes


The branch should always be masterl





#

# Serves KONEKSI WebApp
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

