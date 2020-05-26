import QtQuick 2.14

SignUpScreenForm {
	backButton.onClicked: root.backClicked()

	createButton.onClicked: root.createClicked(fullName, email, password)
}
