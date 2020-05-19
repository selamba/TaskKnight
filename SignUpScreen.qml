import QtQuick 2.14

SignUpScreenForm {
	Component.onCompleted: {
		backButton.clicked.connect(backClicked)
	}

	createButton.onClicked: root.createClicked(fullName, email, password)
}
