import QtQuick 2.14

PushButtonForm {
	cursorShape: Qt.PointingHandCursor

	Component.onCompleted: {
		mouseArea.clicked.connect(clicked)
	}
}
