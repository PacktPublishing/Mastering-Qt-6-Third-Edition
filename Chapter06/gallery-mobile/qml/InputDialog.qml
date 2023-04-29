import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Dialogs
import QtQuick.Window
import "."

Dialog {

    property string label: "New item"
    property string hint: ""
    property alias editText : editTextItem
    standardButtons: Dialog.Ok | Dialog.Cancel

    onVisibleChanged: {
        editTextItem.focus = true
        editTextItem.selectAll()
    }
    onAccepted: {
        Qt.inputMethod.hide();
    }
    onRejected: {
        Qt.inputMethod.hide();
    }

    width: parent.width
    height: 300

    Rectangle {

        width: parent.width
        height: 100

        ColumnLayout {
            Text {
                id: labelItem
                text: label
                color: Style.text
            }

            TextInput {
                id: editTextItem
                inputMethodHints: Qt.ImhPreferUppercase
                text: hint
                color: Style.text
            }
        }
    }
}
