import QtQuick 2.14

PushButtonForm {
	mouseArea.onClicked: root.clicked()

	cursorShape: Qt.PointingHandCursor
}
