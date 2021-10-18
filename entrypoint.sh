#!/bin/sh -xe 

# Test script to play with gh-actions 

# $1 is the directory containing the source code
# $2 is the directory where autodoc should be executed

# By default ./src is the directory containing the clojure source code
# By default . is the directory where autodoc is executed 

# Testing presence of path ($2)
if [ ! -d $2 ]; then 
    echo "Path $2 can't be found"
    exit 1
else
    echo "Path Found at $2"
fi 

cd $2

if [ ! -d $1 ]; then  
    echo "Failed to find directory"
    exit 1
else 
    echo "Directory Found at $1"
fi

# Updating system 
apk update 
# Download Ca Certificates
apk add ca-certificates
update-ca-certificates 
# Installing Java
apk add openjdk8-jre
# Downloading AutoDoc (https://github.com/tomfaulhaber/autodoc)
wget -O autodoc.jar https://github.com/downloads/tomfaulhaber/autodoc/autodoc-0.9.0-standalone.jar
# Checking SHA256 and echoing it again 
sha256sum autodoc.jar 
echo "6035c1e1c142e6c24b23ecc107168f47dc068bc973e4fc1cf30be489617a22e0"
# Generating Clojure Documentation
java -jar autodoc.jar --source-path $1
# Exiting
exit 0