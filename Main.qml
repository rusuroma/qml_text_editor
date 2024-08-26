import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Dialogs
import com.company.backend 1.0
import com.company.about 1.0
import "frontend_functionality.js" as JSFunction
ApplicationWindow {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    property variant indexes: []

    About
    {
        id: aboutClass
    }

    Backend
    {
        id: backend
        onPathChanged: console.log("Path: ", path)
        onDataChanged: console.log("Path: ", path)
    }

    FileDialog
    {
        id: openDialog
        title: "Please chose a file"
        fileMode: FileDialog.OpenFile
        onAccepted:
        {
            backend.path = openDialog.selectedFile
            editor.text = backend.data
        }

    }

    FileDialog
    {
        id: saveDialog
        title: "Please give name to a file"
        fileMode: FileDialog.SaveFile
        onAccepted:
        {
            backend.path = saveDialog.currentFile
            backend.data = editor.text
        }

    }

    Action
    {
        id: actionNew
        text: qsTr("New")
        icon.color: "transparent"
        icon.source: "icons/oNew.png"
        onTriggered:
        {
            editor.clear()
        }
    }

    Action
    {
        id: actionOpen
        text: qsTr("Open")
        icon.color: "transparent"
        icon.source: "icons/oOpen.png"
        onTriggered:
        {
            openDialog.open()
        }
    }

    Action
    {
        id: actionSave
        text: qsTr("Save")
        icon.color: "transparent"
        icon.source: "icons/oSave.png"
        onTriggered:
        {
            saveDialog.open()
        }
    }

    Action
    {
        id: actionCopy
        text: qsTr("Copy")
        icon.color: "transparent"
        icon.source: "icons/oCopy.png"
        onTriggered:
        {
            editor.copy()
        }

    }

    Action
    {
        id: actionPaste
        text: qsTr("Paste")
        icon.color: "transparent"
        icon.source: "icons/oPaste.png"
        onTriggered:
        {
            editor.paste()
        }

    }

    Action
    {
        id: actionCut
        text: qsTr("Paste")
        icon.color: "transparent"
        icon.source: "icons/oCut.png"
        onTriggered:
        {
            editor.cut()
        }

    }

    Action
    {
        id: actionUndo
        text: qsTr("Undo")
        icon.color: "transparent"
        icon.source: "icons/oUndo.png"
        onTriggered:
        {
            editor.undo()
        }

    }

    Action
    {
        id: actionRedo
        text: qsTr("Redo")
        icon.color: "transparent"
        icon.source: "icons/oRedo.png"
        onTriggered:
        {
            editor.redo()
        }


    }

    Action
    {
        id: actionSelectAll
        text: qsTr("Select All")
        icon.color: "transparent"
        icon.source: "icons/oSelectAll.png"
        onTriggered:
        {
            editor.selectAll()
        }

    }

    Action
    {
        id: actionHelp
        text: qsTr("Help")
        icon.color: "transparent"
        icon.source: "icons/oHelp.png"
        onTriggered:
        {
            Qt.openUrlExternally("https://github.com/rusuroma/rusuroma?tab=readme-ov-file")
        }

    }

    Action
    {
        id: actionAbout
        text: qsTr("About")
        icon.color: "transparent"
        icon.source: "icons/oAbout.png"
        onTriggered:
        {
            aboutPopup.open()
        }

    }

    Action
    {
        id: actionIncreaseFontSize
        text: qsTr("Increase Font")
        icon.color: "transparent"
        icon.source: "icons/oFontUp.png"
        onTriggered:
        {
            editor.font.pixelSize = editor.font.pixelSize + 1
        }

    }

    Action
    {
        id: actionDecreaseFontSize
        text: qsTr("Decrease Font")
        icon.color: "transparent"
        icon.source: "icons/oFontDown.png"
        onTriggered:
        {
            editor.font.pixelSize = editor.font.pixelSize - 1
        }

    }

    Action
    {
        id: actionMakeBold
        text: qsTr("Bold")
        icon.color: "transparent"
        icon.source: "icons/oBold.png"
        onTriggered:
        {
            editor.font.bold = !editor.font.bold
        }

    }

    Action
    {
        id: actionSearch
        text: qsTr("Search")
        icon.color: "transparent"
        icon.source: "icons/oSearch.png"
        onTriggered:
        {
            searchPopup.open()
        }

    }



    menuBar: MenuBar
    {
        Menu
        {
            id: menuFile
            title: "File"
            MenuItem
            {
                action: actionNew
            }
            MenuItem
            {
                action: actionOpen
            }
            MenuItem
            {
                action: actionSave
            }
        }

        Menu
        {
            id: menuEdit
            title: "Edit"

            MenuItem
            {
                action: actionCopy
            }
            MenuItem
            {
                action: actionPaste
            }
            MenuItem
            {
                action: actionCut
            }
            MenuItem
            {
                action: actionUndo
            }
            MenuItem
            {
                action: actionRedo
            }
            MenuItem
            {
                action: actionSelectAll
            }
        }

        Menu
        {
            id: formatMenu
            title: "Format"
            MenuItem
            {
                action: actionIncreaseFontSize
            }
            MenuItem
            {
                action: actionDecreaseFontSize
            }
            MenuItem
            {
                action: actionMakeBold
            }
        }

        Menu
        {
            id: helpMenu
            title: "Help"
            MenuItem
            {
                action: actionHelp
            }
            MenuItem
            {
                action: actionAbout
            }
        }
    }

    header: ToolBar
    {
        Row
        {
            ToolButton
            {
                display: AbstractButton.IconOnly; action: actionNew
            }
            ToolButton
            {
                display: AbstractButton.IconOnly; action: actionOpen
            }
            ToolButton
            {
                display: AbstractButton.IconOnly; action: actionSave
            }
            ToolButton
            {
                display: AbstractButton.IconOnly; action: actionSearch
            }
            ToolButton
            {
                display: AbstractButton.IconOnly; action: actionHelp
            }
        }
    }

    ScrollView
    {
        id: scrollView
        anchors.fill: parent
        TextArea
        {
            id: editor
            selectByMouse: true
            persistentSelection: true

        }
    }

    Popup
    {
        id: aboutPopup
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
        anchors.centerIn: parent
        width: operatingSystemLbl.width*1.5
        height: root.height/3
        modal: true
        focus: true
        onOpened:
        {
            var systemDetails = aboutClass.operatingSystem
            var cpuArchitecture = aboutClass.cpuArchitecture
            operatingSystemLbl.text = "Operating System: " + systemDetails
            cpuArchitectureLbl.text = "CPU Architecture: " + cpuArchitecture
        }
        Column
        {
            id: col
            x: aboutPopup.width/2 - col.width/2
            spacing: 10
            Label
            {
                id: generalInfo
                text: "Simple Text Editor in C++ running on:"
            }
            Label
            {
                id: operatingSystemLbl
                text: ""
            }

            Label
            {
                id: cpuArchitectureLbl
                text: ""
            }


            Button
            {
                id: closePopUp
                x: cpuArchitectureLbl.x/2 + closePopUp.width
                width: aboutPopup.width/5
                height: aboutPopup.height/6
                text: "Close"

                onClicked:
                {
                    aboutPopup.close()
                }
           }

        }


    }

    Popup
    {
        id: searchPopup
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
        anchors.centerIn: parent
        width: operatingSystemLbl.width*1.5
        height: root.height/3
        modal: true
        focus: true
        onOpened:
        {
            var systemDetails = aboutClass.operatingSystem
            var cpuArchitecture = aboutClass.cpuArchitecture
            operatingSystemLbl.text = "Operating System: " + systemDetails
            cpuArchitectureLbl.text = "CPU Architecture: " + cpuArchitecture
        }

        Column
        {
            id: colSearch
            x: searchPopup.width/2 - colSearch.width/2
            spacing: 10
            Label
            {
                id: searchLbl
                text: "Enter text to search: "
            }
            TextField
            {
                id: searchField

            }

        Row
        {
            Button
            {
                id: searchBtnPopUp
                //x: searchLbl.x/2 + closeSearchPopUp.width/2
                width: searchPopup.width/5
                height: searchPopup.height/6
                text: "Search"

                onClicked:
                {
                    console.log("Clicked")
                    console.log(indexes.length)
                    if(indexes.length === 0)
                    {
                        indexes = JSFunction.searchInText(editor.text, searchField.text)
                        console.log(indexes)
                        // editor.selectionStart = index[0];
                        // editor.selectionEnd = index[1];
                        editor.select(indexes[0], indexes[1])
                    }else
                    {
                        indexes = JSFunction.searchInText(editor.text, searchField.text, indexes[1])
                        console.log(indexes)
                        // editor.selectionStart = index[0];
                        // editor.selectionEnd = index[1];
                        editor.select(indexes[0], indexes[1])
                    }


                }

           }

            Button
            {
                id: closeSearchPopUp
                //x: searchLbl.x/2 + closeSearchPopUp.width/2
                width: searchPopup.width/5
                height: searchPopup.height/6
                text: "Close"

                onClicked:
                {
                    indexes = [0,0]
                    searchPopup.close()

                }
           }

        }



        }




    }
}
