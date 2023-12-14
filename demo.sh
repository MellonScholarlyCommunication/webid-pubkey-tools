#!/bin/bash

KEY="keys/rsa_priv.pem"
URL="https://labs.eventnotifications.net/inbox/"
WEBID="https://patrickhochstenbach.net/demo/labs/id.jsonld"
FILE="example.jsonld"
CONTENT_TYPE="application/ld+json"

HEADERS=$(node bin/headers.js ${KEY} ${WEBID} POST ${URL} ${FILE})

LENGTH=$(wc -c < ${FILE})

CMD="curl -s ${HEADERS} -H 'Content-Length: ${LENGTH}' -H 'Content-Type: ${CONTENT_TYPE}' --data-binary '@${FILE}' ${URL}"

eval $CMD