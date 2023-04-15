cmake_minimum_required(VERSION 3.16)

project(ch03-sysinfo VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

find_package(Qt6 COMPONENTS Core Gui Widgets Charts REQUIRED)

qt_standard_project_setup()

message(${CMAKE_SYSTEM_NAME})

include_directories(
	${Qt6Core_INCLUDE_DIRS}
	${Qt6Widgets_INCLUDE_DIRS}
	${Qt6Charts_INCLUDE_DIRS}
)

link_directories(
	${CMAKE_PREFIX_PATH}/lib
)

add_executable(ch03-sysinfo
  main.cpp
  CpuWidget.cpp
  MainWindow.cpp
  MainWIndow.ui
  MemoryWidget.cpp
  Sysinfo.cpp
  SysInfoWidget.cpp
)



if (${CMAKE_SYSTEM_NAME} STREQUAL "Windows")
  target_sources(ch03-sysinfo PRIVATE SysInfoWindowsImpl.cpp)
  set_target_properties(ch03-sysinfo PROPERTIES
				     WIN32_EXECUTABLE ON
  )
endif ()

if (${CMAKE_SYSTEM_NAME} STREQUAL "Linux")
  target_sources(ch03-sysinfo PRIVATE SysInfoLinuxImpl.cpp)
endif ()

if (${CMAKE_SYSTEM_NAME} STREQUAL "macOS")
  target_sources(ch03-sysinfo PRIVATE SysInfoMacImpl.cpp)
endif ()

target_link_libraries(ch03-sysinfo PUBLIC Qt6Core Qt6Gui Qt6Widgets Qt6Charts)

set_target_properties(ch03-sysinfo PROPERTIES
				   MACOX_BUNDLE ON
				   WIN32_EXECUTABLE ON
)
				     
