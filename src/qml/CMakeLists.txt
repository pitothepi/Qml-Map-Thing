set(QML
    # cmake-format: sortable
    Main.qml
    ControllableMap.qml
    ShadowBox.qml
)

set(QML_PLUGIN_SOURCES # cmake-format: sortable
    MyController.cpp
)

set(QML_PLUGIN_HEADER # cmake-format: sortable
    MyController.h
)


qt_add_library(mainqml STATIC)

target_include_directories(mainqml PUBLIC .)

qt_add_qml_module(
    mainqml
    URI
    mainqml
    OUTPUT_DIRECTORY
    "${CMAKE_BINARY_DIR}/mainqml"
    QML_FILES
    ${QML}
    SOURCES
    ${QML_PLUGIN_SOURCES}
    ${QML_PLUGIN_HEADER}
)
