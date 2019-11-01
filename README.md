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

<<<<<<< HEAD
=======
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



>>>>>>> 7e439eac16839517b2e71e946119fd01e00f239e
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


# General Errors
options-ssl-nginx.conf" failed (2: No such file or directory)
Solution:
Check configuration of site.enable

Fixing 'sudo:unable to resolve host" Error in Linux
Add host to /etc/hosts



# Fastlane example
fastlane_version "2.115.0"

default_platform(:ios)

platform :ios do
  lane :bump do |options|
    increment_version_number(version_number: options[:version])
    increment_build_number(build_number: options[:build])
  end

  private_lane :match_stag do |options|
    match(
      type: "adhoc",
      app_identifier: "com.gcs.prometheus.sdp.stag",
      username: options[:username],
      readonly: !options[:writable]
    )
  end

  private_lane :match_others do |options|
    match(
      type: "development",
      app_identifier: [
        "com.gcs.prometheus.sdp.mock",
        "com.gcs.prometheus.sdp.devt"
      ],
      username: options[:username],
      readonly: !options[:writable]
    )
  end

  lane :certificates do |options|
    match_others(username: options[:username], writable: options[:writable])
    match_stag(username: options[:username], writable: options[:writable])
  end

  lane :build_mock do |options|
    match_others
    build_app(
      scheme: "prometheus-mock",
      configuration: "MockRelease",
      export_method: "development"
    )
  end

  lane :deploy_mock do |options|
    build_mock
    crashlytics(
      api_token: "1222b6a0c933aee641154a066ae9daaa93d7d2d8",
      build_secret: "50f2993fc5583f989a3bef9d47f0cbddf4ff86cf7c3c9388c99b6019191e7e24"
    )
  end

  lane :build_stag do |options|
    match_stag
    build_app(
      scheme: "prometheus-stag",
      configuration: "StagRelease",
      export_method: "ad-hoc"
    )
  end

  lane :deploy_stag do |options|
    build_stag
    crashlytics(
      api_token: "1222b6a0c933aee641154a066ae9daaa93d7d2d8",
      build_secret: "50f2993fc5583f989a3bef9d47f0cbddf4ff86cf7c3c9388c99b6019191e7e24"
    )
  end

    lane :pipeline_build do |options|
    #produce(
    #  app_identifier: "com.gcs.prometheus.sdp",
    #  username: "devs@gbh.com.do",
    #  team_id: "HLH44XH7ZG",
    #  app_name: 'prometheus.{JIRA_ID}',
    #  itc_team_id: '117714939'
    #)
    match(
      type: "adhoc",
      app_identifier: "com.gcs.prometheus.sdp",
      username: "devs@gbh.com.do",
      team_id: "HLH44XH7ZG",
      readonly: options[:writable]
    )
  end

  lane :pipeline do |options|
    pipeline_build
    update_app_identifier(
      xcodeproj: "prometheus.xcodeproj",
      plist_path: "prometheus/Info.plist",
      app_identifier: "com.gcs.prometheus.sdp.{JIRA_ID}",
    )
    build_app(
      scheme: "prometheus-stag",
      configuration: "StagRelease",
    )
  end
end

