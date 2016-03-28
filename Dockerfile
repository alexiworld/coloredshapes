apt-get update
apt-get install -y software-properties-common
cd core-services
gradle eclipse
gradle war
gradle jettyRun --offline -Dcoloredshapes.env=local -Dcoloredshapes.cfg=/coloredshapes/product/external-config
echo "version=1.0.0" > gradle.properties
apt-get install -y python-software-properties
add-apt-repository ppa:openjdk-r/ppa -y
apt-get update
apt-get install -y openjdk-8-jdk
update-alternatives --config java
update-alternatives --config javac
apt-get install -y vim
apt-get install -y wget
apt-get install -y curl
apt-get install -y unzip
apt-get install -y git

mkdir /coloredshapes
cd /coloredshapes

wget https://services.gradle.org/distributions/gradle-2.12-bin.zip
unzip gradle-2.12-bin.zip
export PATH=$PATH:/coloredshapes/gradle-2.12/bin/

wget http://apache.mirror.vexxhost.com/tomcat/tomcat-8/v8.0.33/bin/apache-tomcat-8.0.33.zip
unzip apache-tomcat-8.0.33.zip
export TOMCAT=/coloredshapes/apache-tomcat-8.0.33
chmod a+x $TOMCAT/bin/*

git clone https://github.com/alexiworld/coloredshapes.git
mv coloredshapes product
cd product
unzip -P password product.zip

cd core-services
gradle eclipse
echo "version=1.0.0" > gradle.properties
gradle war
cp build/libs/core-services-1.0.0-null.war $TOMCAT/webapps/core-services.war
#gradle jettyRun --offline -Dcoloredshapes.env=local -Dcoloredshapes.cfg=/coloredshapes/product/external-config

cd ../group-schedule
gradle eclipse
echo "version=1.0.0" > gradle.properties
gradle war
cp build/libs/group-schedule-1.0.0-null.war $TOMCAT/webapps/group-schedule.war
#gradle jettyRun --offline -Dcoloredshapes.env=local -Dcoloredshapes.cfg=/coloredshapes/product/external-config

cd ../my-own-schedule
gradle eclipse
echo "version=1.0.0" > gradle.properties
gradle war
cp build/libs/my-own-schedule-1.0.0.war $TOMCAT/webapps/my-own-schedule.war
#gradle jettyRun --offline -Dcoloredshapes.env=local -Dcoloredshapes.cfg=/coloredshapes/product/external-config

cd $TOMCAT/bin
./startup.sh