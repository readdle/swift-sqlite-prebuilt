#!/bin/bash

pushd "$(realpath $(dirname $0))"
    mkdir -p ../libs
    mkdir -p ../include

    curl -o sqlite-amalgamation.zip https://www.sqlite.org/2016/sqlite-amalgamation-3140200.zip
    unzip sqlite-amalgamation.zip -d ./

    mv sqlite-amalgamation-3140200 sqlite-amalgamation

    NDK_LIBS_OUT="../libs" ndk-build "$@"

    cp sqlite-amalgamation/*.h ../include

    # remove all icu so because they are system
    rm -rf ../libs/armeabi-v7a/libscu*.so

    rm -rf sqlite-amalgamation.zip
    rm -rf sqlite-amalgamation
popd
