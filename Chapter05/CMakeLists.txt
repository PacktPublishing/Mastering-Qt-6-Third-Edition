cmake_minimum_required(VERSION 3.16)

project(gallery-desktop VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)


add_subdirectory(gallery-core)

find_package(Qt6 6.5 REQUIRED COMPONENTS Core Gui Widgets)
qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(gallery-desktop
    gallery-desktop/main.cpp
    gallery-desktop/MainWindow.cpp
    gallery-desktop/AlbumListWidget.cpp
    gallery-desktop/AlbumWidget.cpp
    gallery-desktop/PictureDelegate.cpp
    gallery-desktop/PictureWidget.cpp
    gallery-desktop/GalleryWidget.cpp
    gallery-desktop/ThumbnailProxyModel.cpp
)

target_link_libraries(gallery-desktop PRIVATE
                      gallery-core Qt6::Core Qt6::Gui Qt6::Widgets)

target_include_directories(gallery-desktop PUBLIC
                            ${PROJECT_SOURCE_DIR}/gallery-core)


set_target_properties(gallery-desktop PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

install(TARGETS gallery-core
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
