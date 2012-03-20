#!/bin/bash

cd ../
source macysCommon.sh

echo "--- enshuring preconditions"
mkdir -p /opt/solr/archive
mkdir -p $SOLR_ARCHIVEDIR

echo "--- cleaning up"
cd /opt/solr/
sudo rm -rf bin
sudo rm -rf conf
sudo rm -f README.txt
sudo rm -f solr.xml


echo "--- retrieving SOLR"
cd /opt/solr/archive

if [ ! -f /opt/solr/archive/$SOLR_ARCHIVE ]
then
	wget http://mirrors.hostingromania.ro/apache.org//lucene/solr/3.5.0/$SOLR_ARCHIVE
fi


echo "--- unzipping SOLR archive"
rm -rf $SOLR_NAME
unzip $SOLR_ARCHIVE 1>/dev/null


echo "--- installing SOLR"
cp -Rf $SOLR_NAME/example/solr/* $SOLR_LOCATION
sudo cp -rf $WORKSPACE/stella-search/config/solr/conf/* /opt/solr/conf/


echo "--- perform additional SOLR related configuration"
cd /www/a/config/deployment/dev-config/sandbox/ui/
sudo cp $WORKSPACE/config/dev-config/sandbox/ui/solr.connection.properties .

