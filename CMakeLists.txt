cmake_minimum_required(VERSION 3.4)

set(PROJECT_NAME
        openmonero)

project(${PROJECT_NAME})

set(CMAKE_CXX_FLAGS
        "${CMAKE_CXX_FLAGS} -std=c++11")

list(APPEND CMAKE_MODULE_PATH
        "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

include(MyUtils)

set(CMAKE_SKIP_INSTALL_ALL_DEPENDENCY On)
include(ProjectMonero)
find_package(Monero)

create_git_version()

configure_files(${CMAKE_CURRENT_SOURCE_DIR}/config
        ${CMAKE_CURRENT_BINARY_DIR}/config)

# find boost
find_package(Boost COMPONENTS
        system
        filesystem
        thread
        date_time
        chrono
        regex
        serialization
        program_options
        date_time
        REQUIRED)


# include boost headers
include_directories(${Boost_INCLUDE_DIRS})
include_directories("/usr/include/mysql/")
include_directories("ext/restbed/source")

# add src/ subfolder
add_subdirectory(src/)

# add ext/ subfolder
add_subdirectory(ext/)


set(SOURCE_FILES
        main.cpp)

add_executable(${PROJECT_NAME}
        ${SOURCE_FILES})

target_link_libraries(${PROJECT_NAME}
        myxrm
        myext
        restbed
        wallet
        blockchain_db
        cryptonote_core
        cryptonote_protocol
        cryptonote_basic
        daemonizer
        cryptoxmr
        blocks
        lmdb
        ringct
        common
        mnemonics
        epee
        mysqlpp
        mysqlclient
        ${Boost_LIBRARIES}
        pthread
        unbound
        unwind
        curl
        dl
        crypto)