import QtQuick 2.14
import QtQuick.Layouts 1.14

Item {
	id: root
	width: 400
	height: 400
	property alias backButton: backButton
	property alias root: root
	property alias email: emailTextInput.text
	property alias password: passwordTextInput.text
	property alias signInButton: signInButton
	property alias forgotPasswordButton: forgotPasswordButton

	signal forgotPasswordClicked
	signal signInClicked
	signal backClicked

	Rectangle {
		id: background
		color: "#ff8705"
		anchors.fill: parent

		Text {
			id: header
			width: 350 * background.width / 1920
			color: "#ffffff"
			text: "Sign in"
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

		ColumnLayout {
			id: columnLayout
			anchors.topMargin: 80
			anchors.bottomMargin: 80
			spacing: 10
			anchors.left: parent.left
			anchors.right: parent.right
			anchors.top: header.bottom
			anchors.bottom: parent.bottom

			Text {
				id: emailText
				color: "#ffffff"
				text: "E-mail"
				Layout.fillHeight: true
				Layout.maximumHeight: 68
				fontSizeMode: Text.Fit
				leftPadding: 20
				Layout.maximumWidth: emailTextInput.nativeWidth
				Layout.fillWidth: true
				Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
				font.family: "Verdana"
				font.bold: true
				font.pointSize: 37
				verticalAlignment: Text.AlignVCenter
			}

			TextInputBox {
				id: emailTextInput
				text: "root@root.com"
				Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
				Layout.maximumHeight: nativeHeight
				Layout.maximumWidth: nativeWidth
				Layout.fillHeight: true
				Layout.fillWidth: true
			}

			Text {
				id: passwordText
				color: "#ffffff"
				text: "Password"
				Layout.maximumHeight: 68
				Layout.fillHeight: true
				fontSizeMode: Text.Fit
				font.pointSize: 37
				font.bold: true
				font.family: "Verdana"
				Layout.fillWidth: true
				leftPadding: 20
				Layout.maximumWidth: passwordTextInput.nativeWidth
				verticalAlignment: Text.AlignVCenter
				Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
			}

			TextInputBox {
				id: passwordTextInput
				text: "UG6s2eoqA8ffO99b"
				isPassword: true
				Layout.maximumHeight: nativeHeight
				Layout.maximumWidth: nativeWidth
				Layout.fillHeight: true
				Layout.fillWidth: true
				Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
			}

			Text {
				id: forgotPasswordText
				color: "#fde0a0"
				text: qsTr("Forgot password?")
				Layout.maximumHeight: 150
				Layout.maximumWidth: passwordTextInput.nativeWidth
				horizontalAlignment: Text.AlignLeft
				Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
				Layout.fillHeight: true
				Layout.fillWidth: true
				fontSizeMode: Text.Fit
				leftPadding: 20
				font.family: "Verdana"
				font.bold: true
				font.pointSize: 23
				verticalAlignment: Text.AlignTop

				MouseArea {
					id: forgotPasswordButton
					anchors.fill: parent
				}
			}

			PushButton {
				id: signInButton
				Layout.minimumWidth: 25
				writing: "Sign In"
				Layout.maximumHeight: nativeHeight
				Layout.fillHeight: true
				Layout.fillWidth: true
				Layout.maximumWidth: nativeWidth
				Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
			}
		}

		Text {
			id: backText
			x: -8
			y: 2
			color: "#ffffff"
			text: qsTr("Back")
			anchors.left: parent.left
			font.bold: true
			font.family: "Verdana"
			font.pointSize: 30
			anchors.top: parent.top
			anchors.leftMargin: 30
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
	D{i:0;height:1080;width:1920}D{i:3;anchors_height:100;anchors_width:100}
}
##^##*/

