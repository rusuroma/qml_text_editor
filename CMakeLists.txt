cmake_minimum_required(VERSION 3.16)

project(TextEditor VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appTextEditor
    main.cpp
)

qt_add_qml_module(appTextEditor
    URI TextEditor
    VERSION 1.0
    QML_FILES
        Main.qml
    RESOURCES icons/oCopy.png icons/oCut.png icons/oNew.png icons/oOpen.png icons/oPaste.png icons/oSave.png
    SOURCES backend.h backend.cpp
    RESOURCES icons/oUndo.png icons/oRedo.png icons/oSelectAll.png icons/oHelp.png icons/oAbout.png
    SOURCES about.h about.cpp
    RESOURCES  icons/oSearch.png icons/oFontDown.png icons/oFontUp.png icons/oBold.png
    QML_FILES frontend_functionality.js
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appTextEditor PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appTextEditor
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appTextEditor
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appTextEditor
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
