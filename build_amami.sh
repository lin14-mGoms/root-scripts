#!/bin/bash

# Own Values
export CCACHE_DIR=~/android/.ccache14
export OUT_DIR_COMMON_BASE=~/out-android

# Use pre-defined build script
source z_patches/build_amami.sh $1

