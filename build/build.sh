#!/bin/bash

set -ex

year=2022
version=3390000

pushd "$(realpath $(dirname $0))"
    mkdir -p ../libs
    mkdir -p ../include

    rm -rf obj
    rm -rf sqlite-amalgamation.zip
    rm -rf sqlite-amalgamation

    curl -o sqlite-amalgamation.zip https://sqlite.org/$year/sqlite-amalgamation-$version.zip
    unzip sqlite-amalgamation.zip -d ./

    mv sqlite-amalgamation-$version sqlite-amalgamation

    NDK_LIBS_OUT="../libs" ndk-build "$@"

    cp sqlite-amalgamation/*.h ../include

    # remove all icu so because they are system
    rm -rf ../libs/*/libicu*.so

    rm -rf obj
    rm -rf sqlite-amalgamation.zip
    rm -rf sqlite-amalgamation
popd
