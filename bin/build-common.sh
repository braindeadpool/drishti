#!/bin/bash

set -e

[ -n ${ANDROID_SDK_ROOT} ] && unset ANDROID_SDK_ROOT
[ -n ${ANDROID_SDK_ROOT} ] && unset ANDROID_HOME
echo $ANDROID_SDK_ROOT

IOS_IDENTITY="iPhone Developer: David Hirvonen (7YLQXWH6FK)"

CMAKE_OSX_SYSROOT=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk

HUNTER_CONFIGURATION_TYPES=Release
DRISHTI_BUILD_ACF=OFF
DRISHTI_BUILD_FACE=OFF
BUILD_DRISHTI_MOTION=OFF
BUILD_DRISHTI_GRAPHICS=OFF
DRISHTI_BUILD_EXAMPLES=ON
BUILD_UTILITIES=OFF
DRISHTI_BUILD_REGRESSION_FIXED_POINT=OFF
DRISHTI_BUILD_REGRESSION_SIMD=OFF

DRISHTI_BUILD_MIN_SIZE=ON

CPACK_TYPE=TGZ

DRISHTI_BUILD_ARGS_BASE=\
(
    "DRISHTI_BUILD_EXAMPLES=${DRISHTI_BUILD_EXAMPLES}"
    "BUILD_UTILITIES=${BUILD_UTILITIES}"
    "DRISHTI_BUILD_FACE=${DRISHTI_BUILD_FACE}"
    "BUILD_DRISHTI_MOTION=${BUILD_DRISHTI_MOTION}"
    "DRISHTI_BUILD_ACF=${DRISHTI_BUILD_ACF}"
    "BUILD_XGBOOST=${BUILD_XGBOOST}"
    "DRISHTI_BUILD_REGRESSION_FIXED_POINT=${DRISHTI_BUILD_REGRESSION_FIXED_POINT}"
    "DRISHTI_BUILD_REGRESSION_SIMD=${DRISHTI_BUILD_REGRESSION_SIMD}"
)

DRISHTI_BUILD_ARGS=( "HUNTER_CONFIGURATION_TYPES=Release" "${DRISHTI_BUILD_ARGS_BASE[@]}")
DRISHTI_BUILD_ARGS_DEBUG=( "HUNTER_CONFIGURATION_TYPES=Debug" "${DRISHTI_BUILD_ARGS_BASE[@]}")

DRISHTHI_BUILD_HIDE=\
(
    "CMAKE_VISIBILITY_INLINES_HIDDEN=ON"
    "CMAKE_CXX_VISIBILITY_PRESET=hidden"
    "CMAKE_XCODE_ATTRIBUTE_GCC_INLINES_ARE_PRIVATE_EXTERN=YES"
    "CMAKE_XCODE_ATTRIBUTE_GCC_SYMBOLS_PRIVATE_EXTERN=YES"
)

function rename_tab
{
  echo -ne "\033]0;$1:$2\007"
}
