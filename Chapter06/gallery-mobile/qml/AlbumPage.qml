import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Dialogs
import QtCore
import "."

PageTheme {

    property string albumName
    property int albumRowIndex

    toolbarTitle: albumName
    toolbarButtons: RowLayout {
        ToolButton {
            background: Image {
                source: "qrc:/res/icons/photo-add.svg"
            }
            onClicked: {
                dialog.open()
            }
        }
        ToolButton {
            background: Image {
                source: "qrc:/res/icons/album-edit.svg"
            }
            onClicked: {
                renameAlbumDialog.open()
            }
        }
        ToolButton {
            background: Image {
                source: "qrc:/res/icons/album-delete.svg"
            }
            onClicked: {
                albumModel.removeRows(albumRowIndex, 1)
                stackView.pop()
            }
        }
    }

    InputDialog {
        id: renameAlbumDialog
        title: "Rename album"
        label: "Album name:"
        hint: albumName

        onAccepted: {
            editText.focus = false
            albumModel.rename(albumRowIndex, editText.text)
            albumName = editText.text
        }
    }

    FileDialog {
        id: dialog
        title: "Open file"
        currentFolder: StandardPaths.locate(StandardPaths.PicturesLocation, StandardPaths.LocateDirectory)
        onAccepted: {
            var pictureUrl = dialog.selectedFile
            pictureModel.addPictureFromUrl(pictureUrl)
            dialog.close()
        }
    }

    GridView {
        id: thumbnailList
        model: pictureModel
        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        cellWidth : thumbnailSize
        cellHeight: thumbnailSize

        delegate: Rectangle {
            width: thumbnailList.cellWidth - 10
            height: thumbnailList.cellHeight - 10
            color: "transparent"

            Image {
                id: thumbnail
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
                cache: false
                source: "image://pictures/" + index + "/thumbnail"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    thumbnailList.currentIndex = index
                    pageStack.push("qrc:/qml/PicturePage.qml", { pictureName: name, pictureIndex: index })
                }
            }
        }
    }
}
