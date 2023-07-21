#!/bin/sh

#Define variables.
DIR=${HOME}/Desktop/covid_19
FILES=${DIR}/file_urls_july_2020.csv
DATEFILE=${DIR}/dates.csv
DAILY="$(date '+%Y%m%d')"
LOGFILE=${DIR}/logs/wget_${DAILY}.log
BASEURL="https://www.vdh.virginia.gov/content/uploads/sites/182/2020/"
URLFILEPREFIX="VDH-COVID-19-PublicUseDataset-"

#Directory setup.
cd $DIR

#Loop over files
OLDIFS=$IFS
IFS=','
[ ! -f $FILES ] && { echo "$FILES file not found"; exit 99; }
while read folder filename
do
	#Download file with daily suffix.
	URL="${BASEURL}${folder}/${URLFILEPREFIX}${filename}.csv"
	TARGETFILE="./data/${filename}_${DAILY}.csv"
	wget $URL -O $TARGETFILE -a $LOGFILE --no-check-certificate
done < $FILES
IFS=$OLDIFS

#Add the date of the download to the records.
printf "\n$DAILY" >>$DATEFILE