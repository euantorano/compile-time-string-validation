#!/bin/sh

if [ $# -lt 2 ]; then
	>&2 echo "usage: expect_invalid.sh COMMAND EXPECTED_MSG"
	exit 1
fi

CMD=$1
EXPECTED_MSG=$2
OUTPUT=$(eval "${CMD}" 2>&1)
RESULT=$?

if [ $RESULT -eq 0 ]; then
	>&2 echo "unxpected status code: ${RESULT}"
	exit 1
fi

echo "${OUTPUT}" | grep -q "${EXPECTED_MSG}"
GREP_RESULT=$?

if [ $GREP_RESULT -ne 0 ]; then
	>&2 echo "expected message not found: ${EXPECTED_MSG}"
	>&2 echo "${OUTPUT}"
	exit 1
fi

exit 0