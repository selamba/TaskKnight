import QtQuick 2.14
import QtQuick.Layouts 1.14

Item {
	id: root
	width: 400
	height: 400
	property alias root: root
	property alias signInButton: signInButton
	property alias signUpButton: signUpButton
	property alias aboutMouseArea: aboutMouseArea

	readonly property int nativeShieldWidth: 199
	readonly property int nativeShieldHeight: 217
	readonly property int nativeHelmetWidth: 188
	readonly property int nativeHelmetHeight: 243
	readonly property int nativeLogoWidth: 972
	readonly property int nativeLogoHeight: 246
	readonly property int nativeHelmetRightMargin: 34

	signal signInClicked
	signal signUpClicked
	signal aboutClicked

	Rectangle {
		id: background
		color: "#ff8705"
		anchors.fill: parent

		RowLayout {
			id: topLayout
			anchors.bottom: aboutRect.top
			anchors.right: parent.right
			anchors.left: parent.left
			anchors.top: parent.top

			ColumnLayout {
				id: leftLayout
				width: 100
				Layout.rightMargin: 50
				Layout.leftMargin: 50
				Layout.bottomMargin: 30
				Layout.topMargin: 30
				Layout.fillHeight: true
				Layout.fillWidth: true

				Image {
					id: shieldLeft
					x: 0
					y: 0
					Layout.maximumHeight: nativeShieldHeight
					Layout.maximumWidth: nativeShieldWidth
					Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
					Layout.fillHeight: true
					Layout.fillWidth: true
					source: "Images/shield.svg"
					fillMode: Image.PreserveAspectFit
				}
			}

			ColumnLayout {
				id: centerLayout
				width: 100
				height: 100
				Layout.bottomMargin: 30
				Layout.topMargin: 30
				Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
				Layout.fillHeight: true
				Layout.fillWidth: true

				ColumnLayout {
					id: header
					width: 100
					height: 100
					Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
					Layout.fillWidth: true
					Layout.fillHeight: true

					Image {
						id: helmet
						x: 0
						y: 0
						Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
						Layout.maximumHeight: nativeHelmetHeight
						Layout.maximumWidth: nativeHelmetWidth
						Layout.fillHeight: true
						Layout.fillWidth: true
						source: "Images/templar.svg"
						fillMode: Image.PreserveAspectFit
					}

					Image {
						id: logo
						x: 0
						y: 0
						Layout.maximumHeight: nativeLogoHeight
						Layout.maximumWidth: nativeLogoWidth
						Layout.fillHeight: true
						Layout.fillWidth: true
						source: "Images/Task Knight logo@2x.png"
						fillMode: Image.PreserveAspectFit
					}
				}

				ColumnLayout {
					id: buttonLayout
					width: 100
					height: 100
					Layout.topMargin: 50
					Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
					spacing: 10
					Layout.fillHeight: true
					Layout.fillWidth: true

					PushButton {
						id: signInButton
						Layout.maximumHeight: nativeHeight
						Layout.maximumWidth: nativeWidth
						Layout.fillHeight: true
						Layout.fillWidth: true
						writing: "Sign In"
						Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
					}

					PushButton {
						id: signUpButton
						Layout.maximumHeight: nativeHeight
						Layout.fillHeight: true
						Layout.fillWidth: true
						Layout.maximumWidth: nativeWidth
						Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
						rectangleColor: "#ff8705"
						textColor: "#ffffff"
						writing: "Sign Up"
					}
				}
			}

			ColumnLayout {
				id: rightLayout
				width: 100
				Layout.rightMargin: 50
				Layout.leftMargin: 50
				Layout.bottomMargin: 30
				Layout.topMargin: 30
				Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
				Layout.fillHeight: true
				Layout.fillWidth: true

				Image {
					id: shieldRight
					x: 0
					y: 0
					Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
					Layout.fillHeight: true
					Layout.fillWidth: true
					Layout.maximumHeight: nativeShieldHeight
					Layout.maximumWidth: nativeShieldWidth
					source: "Images/shield.svg"
					fillMode: Image.PreserveAspectFit
				}
			}
		}

		Rectangle {
			id: aboutRect
			height: 83
			color: "#ffffff"
			anchors.bottom: parent.bottom
			anchors.right: parent.right
			anchors.left: parent.left

			Text {
				id: aboutText
				color: "#ff8705"
				text: qsTr("What is Task Knight?")
				font.bold: true
				font.pointSize: 26
				font.family: "Verdana"
				verticalAlignment: Text.AlignVCenter
				horizontalAlignment: Text.AlignHCenter
				anchors.verticalCenter: parent.verticalCenter
				anchors.horizontalCenter: parent.horizontalCenter

				MouseArea {
					id: aboutMouseArea
					anchors.fill: parent
				}
			}
		}
	}
}

/*##^##
Designer {
	D{i:0;height:1080;width:1920}D{i:16;anchors_height:100;anchors_width:100}
}
##^##*/

