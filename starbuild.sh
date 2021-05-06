#!/bin/sh

# Set luapath
export LUA_PATH=$STARBUILD/lib/\?.lua\;$STARBUILD/plugins/\?.lua\;
lua $STARBUILD/lib/starbuild_main.lua $@