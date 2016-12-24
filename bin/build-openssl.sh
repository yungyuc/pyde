#!/bin/bash

PYDE_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
PYDE_INSTALL=$PYDE_ROOT/opt

OPENSSL_VERSION="1.1.0c"

mkdir -p $PYDE_ROOT/tmp
curl -o $PYDE_ROOT/tmp/$OPENSSL_VERSION.tar.gz \
  https://www.openssl.org/source/openssl-$OPENSSL_VERSION.tar.gz
tar xf $PYDE_ROOT/tmp/openssl-$OPENSSL_VERSION.tar.gz
cd openssl-$OPENSSL_VERSION
./Configure darwin64-x86_64-cc \
  -shared \
  --prefix=$PYDE_INSTALL \
  | tee configure.log 2>&1
make | tee make.log 2>&1
