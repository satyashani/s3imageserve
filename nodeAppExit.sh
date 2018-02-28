#!/bin/bash
# Create log dir if not exists
LOGDIR="/var/log/imageserve"
[ -d "$LOGDIR" ] || mkdir $LOGDIR

# Move current access.log and error.log to logging folder.
SERVERDIR="~/imageserve"
cd $SERVERDIR
TIME=`date +%Y_%m_%d_%H_%M_%S`
cp access.log $LOGDIR/access_$TIME.log
cp error.log $LOGDIR/error_$TIME.log