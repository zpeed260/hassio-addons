#!/bin/bash
. functions.sh
set -e


WORK_DIR=/data/workdir
CONFIG_PATH=/data/options.json

#CloudFlare Deets
export CF_APIKEY=$(jq --raw-output '.cfapikey' $CONFIG_PATH)
export CF_EMAIL=$(jq --raw-output '.cfemail' $CONFIG_PATH)

#-------
DOMAINS=$(jq --raw-output '.domains | join(",")' $CONFIG_PATH)
WAIT_TIME=$(jq --raw-output '.seconds' $CONFIG_PATH)

#Extract Zone ID for Domain
grabzoneid
#Exract A record ID if one exists already
grabaid

#Grab current ip
IP=$(curl -s "https://ipinfo.io/ip")

#Create A Record or update existing with current IP
if [ -z "$AID" ]
  then
    createarecord
  else
    updateip $IP
fi


# Loop: Watch for new IP and update. Renew Cert after 30 days
while true; do

    NEWIP=$(curl -s "https://ipinfo.io/ip")

    if [ "$IP" != "$NEWIP" ]; then
      updateip $NEWIP
    fi

    now="$(date +%s)"
    sleep "$WAIT_TIME"
done
