 #!/usr/bin/env bash

 # Execute this file to install the mulecoin cli tools into your path on OS X

 CURRENT_LOC="$( cd "$(dirname "$0")" ; pwd -P )"
 LOCATION=${CURRENT_LOC%Mulecoin-Qt.app*}

 # Ensure that the directory to symlink to exists
 sudo mkdir -p /usr/local/bin

 # Create symlinks to the cli tools
 sudo ln -s ${LOCATION}/Mulecoin-Qt.app/Contents/MacOS/mulecoind /usr/local/bin/mulecoind
 sudo ln -s ${LOCATION}/Mulecoin-Qt.app/Contents/MacOS/mulecoin-cli /usr/local/bin/mulecoin-cli
