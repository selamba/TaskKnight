import QtQuick 2.14

Item {
	id: root
	property string taskId: "id"
	property alias title: writing.text
	property string description: "description"
	property double importance: 0.0
	property double urgency: 0.0
	property string createdAt: "date"
	property string updatedAt: "date"

	property alias taskButton: taskButton
	property alias crossButton: crossButton
	property int nativeWidth: 1493
	property int nativeHeight: 53

	signal clicked
	signal deleteClicked

	width: parent.width
	height: nativeHeight

	Rectangle {
		id: rectangle
		anchors.fill: parent
		color: "#f6f6f6"

		Text {
			id: writing
			text: "text"
			font.family: "Verdana"
			font.bold: true
			color: "#a5a4a6"
			font.pointSize: 18
			anchors.verticalCenter: parent.verticalCenter
			anchors.left: parent.left
			anchors.leftMargin: 20
			anchors.right: crossImage.left
			anchors.rightMargin: 50

			MouseArea {
				id: taskButton
				anchors.fill: parent
				cursorShape: Qt.PointingHandCursor
			}
		}

		Image {
			id: crossImage
			anchors.right: parent.right
			anchors.rightMargin: 20
			sourceSize.height: height
			sourceSize.width: width
			source: "Images/times-solid.svg"
			fillMode: Image.PreserveAspectFit
			anchors.verticalCenter: parent.verticalCenter

			MouseArea {
				id: crossButton
				anchors.fill: parent
				cursorShape: Qt.PointingHandCursor
			}
		}
	}

	Component.onCompleted: {
		taskButton.clicked.connect(clicked)
		crossButton.clicked.connect(deleteClicked)
	}
}
