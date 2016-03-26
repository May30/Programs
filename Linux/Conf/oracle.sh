# Using a PPA
# You can use WebUpd8 PPA (this will download the required files from Oracle and install JDK 8):
# 
# sudo apt-add-repository ppa:webupd8team/java
# sudo apt-get update
# sudo apt-get install oracle-java8-installer
# Are PPA's safe to add to my system and what are some “red flags” to watch out for?
# 
# Also ensure your JAVA_HOME variable has been set to:
# 
# /usr/lib/jvm/java-8-oracle
# For this you can use the following command (see step 3 of Manual Install to see how to make it permanent):
# 
# export JAVA_HOME=/usr/lib/jvm/java-8-oracle
# Manual install
# The tar.gz provided by Oracle don't have an actual installation process. You just extract those files to a location you want and add them to your path. So the process is the following:
# 
# Download a .tar.gz from Oracle (here I will be using jdk-8u20-linux-x64.tar.gz);
# Extract it to somewhere;
# Move the extracted folder to /usr/lib/jvm. This is not required but it is the place where Java runtime software is installed, and where tools like IDE's may search for it:
# 
# sudo mv /path/to/jdk1.8.0_20 /usr/lib/jvm/oracle_jdk8
# Before addin this jdk as an alternative, you can see that the new alternative is not listed:
# 
# sudo update-alternatives --query java
# 
# sudo update-alternatives --query javac
# Next, add the new jdk alternatives (2000 is the priority and feel free to pick a different number):
JAVA_HOME=/usr/lib/jvm/jdk1.8.0_73

sudo update-alternatives --install /usr/bin/java java $JAVA_HOME/jre/bin/java 2000

sudo update-alternatives --install /usr/bin/javac javac $JAVA_HOME/bin/javac 2000
# Now you should see the new jdk listed and you can switch between the alternatives with this command:

sudo update-alternatives --config java

sudo update-alternatives --config javac
# Create a file /etc/profile.d/oraclejdk.sh with the following content (adapt the paths to reflect the path where you stored your JDK):

# export J2SDKDIR=$JAVA_HOME
# export J2REDIR=$JAVA_HOME/jre
# export PATH=$PATH:$JAVA_HOME/bin:$JAVA_HOME/db/bin:$JAVA_HOME/jre/bin
# export JAVA_HOME=$JAVA_HOME
# export DERBY_HOME=$JAVA_HOME/db
# Done! Those paths will only be recognized after you logout or restart, so if you want to use them right away run source /etc/profile.d/oraclejdk.sh.
