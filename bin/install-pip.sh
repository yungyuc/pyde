#!/bin/bash
if [ -n "$PYDE_INSTALL" ] ; then
  pybin=$PYDE_INSTALL/bin/python3
  echo "use $pybin"
  curl --silent --show-error --retry 5 \
    https://bootstrap.pypa.io/get-pip.py | \
    $PYDE_INSTALL/bin/python3
else
  echo "PYDE_INSTALL is not set"
fi
