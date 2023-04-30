
cmake_minimum_required(VERSION 3.16)

project(gallery-desktop VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Sql Core)
qt_standard_project_setup(REQUIRES 6.5)

add_definitions(-DGALLERYCORE_LIBRARY)

add_library(gallery-core SHARED
    Album.cpp
    AlbumDao.cpp
    AlbumModel.cpp
    DatabaseManager.cpp
    Picture.cpp
    PictureDao.cpp
    PictureModel.cpp
    Album.h
    AlbumDao.h
    AlbumModel.h
    DatabaseManager.h
    Picture.h
    PictureDao.h
    PictureModel.h)

target_link_libraries(gallery-core PUBLIC
                      Qt6::Sql Qt6::Core)
