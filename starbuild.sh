#!/bin/sh

# Set luapath
export LUA_PATH=$STARBUILD/lib/\?.lua\;$STARBUILD/plugins/\?.lua\;$PWD/\?.lua\;
lua $STARBUILD/lib/starbuild_main.lua $@
