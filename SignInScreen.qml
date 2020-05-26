import QtQuick 2.14

SignInScreenForm {
	forgotPasswordButton.onClicked: root.forgotPasswordClicked()
	backButton.onClicked: root.backClicked()
	signInButton.onClicked: root.signInClicked()

	forgotPasswordButton.cursorShape: Qt.PointingHandCursor
	signInButton.cursorShape: Qt.PointingHandCursor
}
