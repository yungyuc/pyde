#!/bin/bash
# https://docs.python.org/devguide/

# FIXME: on osx (Sierra 10.12), ssl is missing

PYDE_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
PYDE_INSTALL=$PYDE_ROOT/opt

./configure \
  --with-pydebug \
  --enable-ipv6 \
  --enable-shared \
  --prefix=$PYDE_INSTALL \
  --with-ensurepip=no \
  --with-tcltk-includes="-I$PYDE_INSTALL/include" \
  --with-tcltk-libs="-L$PYDE_INSTALL/lib -ltcl8.5 -ltk8.5" \
  | tee configure.log 2>&1

make -j \
  | tee make.log 2>&1
