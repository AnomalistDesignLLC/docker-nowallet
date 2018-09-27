#!/bin/bash
source ~/.bashrc
mkvirtualenv --no-site-packages -p /usr/bin/python3 nowallet
cd nowallet
make init
make install
make go
exec "$@"

