include(ExternalProject)
include(GNUInstallDirs)


ExternalProject_Add(monero
        PREFIX ${CMAKE_SOURCE_DIR}/deps
        DOWNLOAD_NO_PROGRESS 0
        URL https://github.com/monero-project/monero/archive/v0.10.3.1.tar.gz
        BUILD_IN_SOURCE 1
        CMAKE_ARGS -DCMAKE_BUILD_TYPE=Release
        BUILD_COMMAND make
        LOG_BUILD 0
        INSTALL_COMMAND "")

set(MONERO_BUILD_DIR ${CMAKE_SOURCE_DIR}/deps/src/monero
        CACHE PATH "The path to the Monero build directory")

set(MONERO_SOURCE_DIR ${CMAKE_SOURCE_DIR}/deps/src/monero
        CACHE PATH "The path to the Monero source directory")