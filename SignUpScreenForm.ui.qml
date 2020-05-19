import QtQuick 2.14
import QtQuick.Layouts 1.14

Item {
	id: root
	width: 400
	height: 400
	property alias fullName: fullNameTextInput.text
	property alias email: emailTextInput.text
	property alias password: passwordTextInput.text
	property alias createButton: createButton
	property alias backButton: backButton
	property alias root: root

	signal createClicked(string fullName, string email, string password)
	signal backClicked

	Rectangle {
		id: background
		color: "#ff8705"
		anchors.fill: parent

		Text {
			id: header
			width: 1200 * background.width / 1920
			color: "#ffffff"
			text: "Create a new account"
			anchors.topMargin: 30
			anchors.horizontalCenter: parent.horizontalCenter
			fontSizeMode: Text.HorizontalFit
			anchors.top: parent.top
			horizontalAlignment: Text.AlignHCenter
			verticalAlignment: Text.AlignVCenter
			font.family: "Verdana"
			font.bold: true
			font.pointSize: 76
		}

		Text {
			id: smallHeader
			color: "#fde0a0"
			text: qsTr("It's quick and easy")
			font.bold: true
			font.family: "Verdana"
			verticalAlignment: Text.AlignVCenter
			horizontalAlignment: Text.AlignHCenter
			fontSizeMode: Text.HorizontalFit
			anchors.right: parent.right
			anchors.rightMargin: 500
			anchors.left: parent.left
			anchors.leftMargin: 500
			font.pointSize: 30
			anchors.top: header.bottom
		}

		ColumnLayout {
			id: columnLayout
			anchors.topMargin: 80
			anchors.bottomMargin: 80
			spacing: 10
			anchors.left: parent.left
			anchors.right: parent.right
			anchors.top: smallHeader.bottom
			anchors.bottom: parent.bottom

			Text {
				id: fullNameText
				color: "#ffffff"
				text: "Full name"
				leftPadding: 20
				Layout.maximumWidth: fullNameTextInput.nativeWidth
				Layout.fillWidth: true
				Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
				font.family: "Verdana"
				font.bold: true
				font.pointSize: 37
				verticalAlignment: Text.AlignVCenter
			}

			TextInputBox {
				id: fullNameTextInput
				text: "John Doe"
				Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
				Layout.maximumHeight: nativeHeight
				Layout.maximumWidth: nativeWidth
				Layout.fillHeight: true
				Layout.fillWidth: true
			}

			Text {
				id: emailText
				color: "#ffffff"
				text: "E-mail"
				font.pointSize: 37
				font.bold: true
				font.family: "Verdana"
				Layout.fillWidth: true
				leftPadding: 20
				Layout.maximumWidth: emailTextInput.nativeWidth
				verticalAlignment: Text.AlignVCenter
				Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
			}

			TextInputBox {
				id: emailTextInput
				text: "johndoe@email.com"
				isPassword: false
				Layout.maximumHeight: nativeHeight
				Layout.maximumWidth: nativeWidth
				Layout.fillHeight: true
				Layout.fillWidth: true
				Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
			}

			Text {
				id: passwordText
				color: "#ffffff"
				text: "Password"
				Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
				Layout.fillWidth: true
				font.bold: true
				font.family: "Verdana"
				font.pointSize: 37
				verticalAlignment: Text.AlignVCenter
				Layout.maximumWidth: passwordTextInput.nativeWidth
				leftPadding: 20
			}

			TextInputBox {
				id: passwordTextInput
				text: "password"
				isPassword: true
				Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
				Layout.fillWidth: true
				Layout.maximumWidth: nativeWidth
				Layout.fillHeight: true
				Layout.maximumHeight: nativeHeight
			}
			PushButton {
				id: createButton
				writing: "Create"
				Layout.maximumHeight: nativeHeight
				Layout.fillHeight: true
				Layout.fillWidth: true
				Layout.maximumWidth: nativeWidth
				Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
			}
		}

		Text {
			id: backText
			color: "#ffffff"
			text: qsTr("Back")
			font.family: "Verdana"
			font.bold: true
			font.pointSize: 30
			anchors.left: parent.left
			anchors.leftMargin: 30
			anchors.top: parent.top
			anchors.topMargin: 50

			MouseArea {
				id: backButton
				anchors.fill: parent
			}
		}
	}
}

/*##^##
Designer {
	D{i:0;height:1080;width:1920}D{i:13;anchors_height:100;anchors_width:100}D{i:1;anchors_height:200;anchors_width:200}
}
##^##*/

