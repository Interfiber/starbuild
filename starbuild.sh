#!/bin/sh

# Set luapath
if [ -z "$STARBUILD" ]; then
  echo "Error: STARBUILD is not set! Please set this varible and continue"
  exit 1
fi
export LUA_PATH=$STARBUILD/lib/\?.lua\;$STARBUILD/plugins/\?.lua\;$PWD/\?.lua\;
lua $STARBUILD/lib/starbuild_main.lua $@
