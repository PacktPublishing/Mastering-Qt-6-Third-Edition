cmake_minimum_required(VERSION 3.16)

project(gallery-desktop VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Core Widgets Sql)
qt_standard_project_setup(REQUIRES 6.5)

add_definitions(-DGALLERYCORE_LIBRARY)

qt_add_library(gallery-core SHARED
    Album.cpp
    AlbumDao.cpp
    AlbumModel.cpp
    DatabaseManager.cpp
    Picture.cpp
    PictureDao.cpp
    PictureModel.cpp
)

target_link_libraries(gallery-core PUBLIC
                      Qt6::Sql Qt6::Widgets Qt6::Core)
