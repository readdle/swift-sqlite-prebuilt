#!/bin/bash

year=2019
version=3280000

pushd "$(realpath $(dirname $0))"
    mkdir -p ../libs
    mkdir -p ../include


    curl -o sqlite-amalgamation.zip https://sqlite.org/$year/sqlite-amalgamation-$version.zip
    unzip sqlite-amalgamation.zip -d ./

    mv sqlite-amalgamation-$version sqlite-amalgamation

    NDK_LIBS_OUT="../libs" ndk-build "$@"

    cp sqlite-amalgamation/*.h ../include

    # remove all icu so because they are system
    rm -rf ../libs/*/libicu*.so

    rm -rf sqlite-amalgamation.zip
    rm -rf sqlite-amalgamation
popd
