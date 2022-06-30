#!/bin/bash

ping_server () {
  for i in 1 2 3 4 5; do
    npm run ping
    sleep 0.8
  done
}

echo
echo Step  1: build image
echo ====================
echo

npm run build

echo
echo Step  2: start image
echo ====================
echo

npm run start-image

echo
echo Step  3: ping image to save timestamps
echo ====================
echo

ping_server

echo
echo Step  4: stop the image
echo ====================
echo

npm run stop-image

echo
echo Step  5: start the image
echo ====================
echo

npm run start-image

echo
echo Step  6: ping the server to see that the previous timestamps are still there
echo ====================
echo

ping_server

echo
echo Step  7: stop the image to stop timestamps coming in
echo ====================
echo

npm run stop-image

echo
echo Step  8: delete the volume
echo ====================
echo

npm run delete-volume

echo
echo Step  9: start the image again
echo ====================
echo

npm run start-image

echo
echo Step 10: ping the server to see that the previous timestamps are lost
echo ====================
echo

ping_server

