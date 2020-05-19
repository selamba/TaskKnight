import QtQuick 2.14

SignInScreenForm {
	forgotPasswordButton.cursorShape: Qt.PointingHandCursor
	signInButton.cursorShape: Qt.PointingHandCursor

	Component.onCompleted: {
		forgotPasswordButton.clicked.connect(forgotPasswordClicked)
		backButton.clicked.connect(backClicked)
	}

	signInButton.onClicked: root.signInClicked(email, password)
}
