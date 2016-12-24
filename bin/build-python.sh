#!/bin/bash
# https://docs.python.org/devguide/

# FIXME: on osx (Sierra 10.12), ssl is missing

PYDE_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
PYDE_INSTALL=$PYDE_ROOT/opt

mkdir -p $PYDE_ROOT/tmp

cat <<EOF > setup.cfg
[build_ext]
include_dirs=$PYDE_INSTALL/include
EOF

./configure \
  --with-pydebug \
  --enable-ipv6 \
  --enable-shared \
  --prefix=$PYDE_INSTALL \
  --with-ensurepip=no \
  --with-tcltk-includes="-I$PYDE_INSTALL/include" \
  --with-tcltk-libs="-L$PYDE_INSTALL/lib -ltcl8.5 -ltk8.5" \
  | tee $PYDE_ROOT/tmp/python-configure.log 2>&1

make -j \
  | tee $PYDE_ROOT/tmp/python-make.log 2>&1
