cmake_minimum_required(VERSION 3.16)

project(QML-Map-Thing VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.7 REQUIRED COMPONENTS Gui Quick Positioning Location)

qt_standard_project_setup(REQUIRES 6.5)
#qt_policy(SET QTP0001 NEW) #resource URI fix

qt_add_executable(app
    src/main.cpp
)

qt_add_qml_module(mainqml
    URI mainqml
    OUTPUT_DIRECTORY mainqml
    QML_FILES src/qml/Main.qml
    QML_FILES src/qml/ControllableMap.qml
    QML_FILES src/qml/ShadowBox.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(app PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.app
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(app PRIVATE
    Qt::Quick
    Qt::Gui
)

set_target_properties(app PROPERTIES
    CXX_STANDARD 20
    CXX_STANDARD_REQUIRED ON
)

include(GNUInstallDirs)
install(TARGETS app
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
