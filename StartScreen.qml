import QtQuick 2.14

StartScreenForm {
	aboutMouseArea.cursorShape: Qt.PointingHandCursor

	Component.onCompleted: {
		signInButton.clicked.connect(signInClicked)
		signUpButton.clicked.connect(signUpClicked)
		aboutMouseArea.clicked.connect(aboutClicked)
	}
}
