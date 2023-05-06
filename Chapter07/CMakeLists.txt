cmake_minimum_required(VERSION 3.16)

project(ch07-snake VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

find_package(Qt6 6.5 COMPONENTS Core Qml Quick 
                              Quick3D 3DCore
                              3DExtras 3DRender
                              3DQuick 3DInput
)



qt_standard_project_setup(REQUIRES 6.5)


add_executable(ch07-snake
  main.cpp
)

target_link_libraries(ch07-snake PRIVATE
                      Qt6:Core 
                      Qt6::Qml 
                      Qt6::3DInput
                      Qt6::Quick3D
                      Qt6::3DCore
                      Qt6::3DExtras
                      Qt6::3DRender
                      Qt6::3DQuick)


qt6_add_resources(
  snake.qml
)

add_custom_command(
        TARGET ${PROJECT_NAME}  POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy
                ${CMAKE_CURRENT_BINARY_DIR}/test-shader.vsh
                ${CMAKE_CURRENT_BINARY_DIR}/test-shader.fsh)

set_target_properties(ch07-snake PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)
				     
