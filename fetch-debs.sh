#!/bin/bash

HAKA_VERSION=0.3.0
HAKA_ARCH=amd64
BASE_URL=http://github.com/haka-security/haka/releases/download/v$HAKA_VERSION/
CURL_CMD="curl -s -L -O"

# haka_0.3.0_amd64.deb
# haka-doc_0.3.0_all.deb
# haka-nfqueue_0.3.0_amd64.deb
# haka-elasticsearch_0.3.0_amd64.deb
# haka-geoip_0.3.0_amd64.deb
# haka-dev_0.3.0_amd64.deb


# echo $BASE_URL
# echo $PREFIX

packages=(haka haka-doc haka-nfqueue haka-elasticsearch haka-geoip haka-dev)

for i in ${packages[*]}; do
  if [ $i == haka-doc ]
    then
      package=${BASE_URL}${i}_${HAKA_VERSION}_all.deb
      $($CURL_CMD $package)
    else
      package=${BASE_URL}${i}_${HAKA_VERSION}_${HAKA_ARCH}.deb
      $($CURL_CMD $package)
  fi
done

