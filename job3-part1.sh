#!/bin/bash
#
# set processing folder as first commandline argument
PROCESSINGDIR=${1}
# if first commandline argument not set PROCESINGFOLDER set  to default
#
if [ -z ${PROCESSINGDIR} ]; then PROCESSINGDIR="/home/ftp_user218" ; fi
#
# Find folders older then 5h
#
folders=(`find ${PROCESSINGDIR} -mmin +1800`)
#
 for subf in "${folders[@]}"
  do
    # gen guid
    newguid=`uuidgen | awk '{print toupper($0)}'`
    echo ${subf}
    subf=`basename  ${subf}`
    newsubf=`echo ${subf} | cut -d'_' -f 1`
    mv ${PROCESSINGDIR}/${subf} ${PROCESSINGDIR}/${newsubf}_${newguid}
done
