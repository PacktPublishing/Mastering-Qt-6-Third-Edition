
find_package(Qt6 6.5 REQUIRED COMPONENTS Quick Sql)
qt_standard_project_setup(REQUIRES 6.5)


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


include_directories(
        ${Qt6Core_INCLUDE_DIRS}
        ${Qt6Widgets_INCLUDE_DIRS}
        ${Qt6Sql_INCLUDE_DIRS}
)

link_directories(
        ${CMAKE_PREFIX_PATH}/lib
)


target_include_directories(gallery-core PUBLIC
                            ${PROJECT_BINARY_DIR})
