import QtQuick 2.14
import QtQuick.Layouts 1.14

Item {
	id: root
	width: 400
	height: 400
	property alias codeString: codeTextInput.text
	property alias root: root
	property alias submitButton: submitButton

	signal submitClicked

	Rectangle {
		id: background
		color: "#ff8705"
		anchors.fill: parent

		Text {
			id: header
			width: 1000 * background.width / 1920
			color: "#ffffff"
			text: "Enter verification code"
			anchors.topMargin: 110 * background.height / 1080
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
			anchors.bottomMargin: 30
			spacing: 10
			anchors.left: parent.left
			anchors.right: parent.right
			anchors.top: header.bottom
			anchors.bottom: parent.bottom

			TextInputBox {
				id: codeTextInput
				text: ""
				isPassword: false
				Layout.maximumHeight: nativeHeight
				Layout.maximumWidth: nativeWidth
				Layout.fillHeight: true
				Layout.fillWidth: true
				Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
			}

			PushButton {
				id: submitButton
				writing: "Submit"
				Layout.maximumHeight: nativeHeight
				Layout.fillHeight: true
				Layout.fillWidth: true
				Layout.maximumWidth: nativeWidth
				Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
			}
		}
	}
}

/*##^##
Designer {
	D{i:0;height:1080;width:1920}D{i:1;anchors_height:200;anchors_width:200}
}
##^##*/

