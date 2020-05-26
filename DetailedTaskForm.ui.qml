import QtQuick 2.14
import QtGraphicalEffects 1.14
import QtQuick.Layouts 1.14

Item {
	id: root
	width: nativeWidth
	height: nativeHeight
	property alias descriptionInput: descriptionInput
	property alias titleInput: titleInput
	property alias mouseArea: mouseArea
	property alias importanceInput: importanceInput
	property alias urgencyInput: urgencyInput
	property alias root: root
	property alias leftButton: leftButton
	property alias rightButton: rightButton
	property string taskID: "N/A"

	property alias title: titleInput.text
	property alias description: descriptionInput.text
	property alias importanceString: importanceInput.text
	property alias urgencyString: urgencyInput.text

	property alias rightButtonText: rightButton.writing
	property alias leftButtonText: leftButton.writing

	readonly property int nativeWidth: 750
	readonly property int nativeHeight: 650

	signal rightButtonClicked
	signal leftButtonClicked

	HalfRoundedRectangle {
		id: topRectangle
		height: topRectangle.nativeHeight
		anchors.top: parent.top
		anchors.left: parent.left
		anchors.right: parent.right
		z: 3

		readonly property int nativeHeight: 106

		layer.enabled: true
		layer.effect: DropShadow {
			radius: 9.0
			transparentBorder: true
			cached: true
			samples: 19
		}

		TextInput {
			id: titleInput
			color: "#a5a4a6"
			text: "Title"
			wrapMode: Text.WordWrap
			selectionColor: "#ff8705"
			selectByMouse: true
			font.pointSize: 26
			font.bold: true
			font.family: "Verdana"
			anchors.rightMargin: 50
			anchors.leftMargin: 50
			verticalAlignment: Text.AlignVCenter
			anchors.fill: parent
		}
	}

	Rectangle {
		id: middleRectangle
		color: "#ffffff"
		anchors.bottom: bottomRectangle.top
		anchors.top: topRectangle.bottom
		anchors.left: parent.left
		anchors.right: parent.right
		z: 2
		layer.enabled: true
		layer.effect: DropShadow {
			radius: 9.0
			transparentBorder: true
			cached: true
			samples: 19
		}

		TextInput {
			id: descriptionInput
			color: "#a5a4a6"
			text: "Description"
			clip: true
			selectionColor: "#ff8705"
			selectByMouse: true
			wrapMode: Text.WordWrap
			font.pointSize: 26
			font.bold: true
			font.family: "Verdana"
			anchors.rightMargin: 50
			anchors.leftMargin: 50
			anchors.bottomMargin: 15
			anchors.topMargin: 15
			anchors.fill: parent
		}
	}

	HalfRounedRectangleUpsideDown {
		id: bottomRectangle
		height: bottomRectangle.nativeHeight
		radius: topRectangle.radius
		anchors.bottom: parent.bottom
		anchors.left: parent.left
		anchors.right: parent.right

		readonly property int nativeHeight: 259

		z: 1
		layer.enabled: true
		layer.effect: DropShadow {
			radius: 9.0
			transparentBorder: true
			cached: true
			samples: 19
		}

		PushButton {
			id: leftButton
			anchors.bottomMargin: 20
			anchors.leftMargin: 70
			writing: "Cancel"
			rectangleColor: "#ff8705"
			textColor: "#ffffff"
			anchors.left: parent.left
			anchors.bottom: parent.bottom
		}

		PushButton {
			id: rightButton
			anchors.rightMargin: 70
			anchors.bottomMargin: 20
			writing: "Create"
			textColor: "#ffffff"
			rectangleColor: "#ff8705"
			anchors.bottom: parent.bottom
			anchors.right: parent.right
		}

		RowLayout {
			id: textRow
			anchors.left: parent.left
			anchors.right: parent.right

			Text {
				id: importanceText
				color: "#ff8705"
				text: qsTr("Importance")
				Layout.maximumWidth: parent.width / 2
				Layout.fillWidth: true
				Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
				font.pointSize: 26
				font.bold: true
				font.family: "Verdana"
				verticalAlignment: Text.AlignVCenter
				horizontalAlignment: Text.AlignHCenter
			}

			Text {
				id: urgencyText
				color: "#ff8705"
				text: qsTr("Urgency")
				Layout.maximumWidth: parent.width / 2
				Layout.fillWidth: true
				Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
				font.pointSize: 26
				font.bold: true
				font.family: "Verdana"
				verticalAlignment: Text.AlignVCenter
				horizontalAlignment: Text.AlignHCenter

				MouseArea {
					id: mouseArea
					anchors.fill: parent
				}
			}
		}

		RowLayout {
			id: inputRow
			anchors.top: textRow.bottom
			anchors.left: parent.left
			anchors.right: parent.right

			TextInput {
				id: importanceInput
				width: 80
				height: 20
				color: "#a5a4a6"
				text: "0.0"
				wrapMode: Text.NoWrap
				selectionColor: "#ff8705"
				selectByMouse: true
				horizontalAlignment: Text.AlignHCenter
				font.bold: true
				font.family: "Verdana"
				font.pointSize: 20
				Layout.maximumWidth: parent.width / 2
				Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
				Layout.fillWidth: true
			}

			TextInput {
				id: urgencyInput
				width: 80
				height: 20
				color: "#a5a4a6"
				text: "0.0"
				wrapMode: Text.NoWrap
				selectionColor: "#ff8705"
				selectByMouse: true
				horizontalAlignment: Text.AlignHCenter
				font.bold: true
				font.family: "Verdana"
				font.pointSize: 20
				Layout.maximumWidth: parent.width / 2
				Layout.fillWidth: true
				Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
			}
		}
	}
}
