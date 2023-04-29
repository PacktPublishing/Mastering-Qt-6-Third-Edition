cmake_minimum_required(VERSION 3.16)

project(gallery-mobile VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)


add_subdirectory(gallery-core)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick Sql)
qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(gallery-mobile
    gallery-mobile/PictureImageProvider.cpp
    gallery-mobile/main.cpp
)

target_link_libraries(gallery-mobile PRIVATE
                      gallery-core Qt6::Core Qt6::Sql Qt6::Quick)

target_include_directories(gallery-mobile PUBLIC
                            ${PROJECT_SOURCE_DIR}/gallery-core)

qt_add_qml_module(gallery-mobile
    URI gallery-mobile
    VERSION 1.0
    QML_FILES   gallery-mobile/qml/AlbumListPage.qml
                gallery-mobile/qml/AlbumPage.qml
                gallery-mobile/qml/InputDialog.qml
                gallery-mobile/qml/main.qml
                gallery-mobile/qml/PageTheme.qml
                gallery-mobile/qml/PicturePage.qml
                gallery-mobile/qml/Style.qml
                gallery-mobile/qml/StyleDark.qml
                gallery-mobile/qml/ToolBarTheme.qml
            )


set_target_properties(gallery-mobile PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

install(TARGETS gallery-core
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
