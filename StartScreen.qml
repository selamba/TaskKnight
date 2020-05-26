import QtQuick 2.14

StartScreenForm {
	signInButton.onClicked: root.signInClicked()
	signUpButton.onClicked: root.signUpClicked()
	aboutMouseArea.onClicked: root.aboutClicked()

	aboutMouseArea.cursorShape: Qt.PointingHandCursor
}
