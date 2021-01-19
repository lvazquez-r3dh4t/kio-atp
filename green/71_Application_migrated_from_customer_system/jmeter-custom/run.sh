#!/bin/bash
umask 0002

TEST_NAME=$(basename $TEST_FILE_PATH | sed 's/\..*//g')

echo "Running test case in $TEST_FILE_PATH"

if [ "$NO_ADD_HOSTNAME" != "true" -a "$HOSTNAME" != "" ]; then
    OUTPUT_DIRECTORY="$OUTPUT_DIRECTORY/$HOSTNAME"
    REPORT_DIRECTORY="$REPORT_DIRECTORY/$HOSTNAME"
    
    mkdir -p $OUTPUT_DIRECTORY $REPORT_DIRECTORY
fi

JMETER_OPTIONS="-Djava.awt.headless=true -n -t $TEST_FILE_PATH -l $OUTPUT_DIRECTORY/$TEST_NAME-report -j $OUTPUT_DIRECTORY/$TEST_NAME-log -e -o $REPORT_DIRECTORY "

if [ "$PROPERTIES_PATH" != "" ]; then
  JMETER_OPTIONS="$JMETER_OPTIONS -p $PROPERTIES_PATH"
fi

if [ "$JMETER_EXTRA_OPTIONS" != "" ]; then
  JMETER_OPTIONS="$JMETER_OPTIONS $JMETER_EXTRA_OPTIONS"
fi

apache-jmeter-3.3/bin/jmeter $JMETER_OPTIONS $PROPERTIES_PATH

RETURN_CODE=$?
if [ $RETURN_CODE != 0 ]; then
    exit $RETURN_CODE
fi

echo "Finished case execution"

if [ "$WAIT_AFTER_COMPLETION" == "true" ]; then
    trap "trap - TERM; kill -s TERM -- -$$" TERM
    tail -f /dev/null & wait
    exit 0
fi
