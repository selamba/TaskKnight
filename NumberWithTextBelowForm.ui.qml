import QtQuick 2.14

Item {
	id: root
	width: 73
	height: 75
	property alias number: number.text
	property alias numberObject: number
	property alias root: root

	property alias readOnly: number.readOnly
	property alias text: writing.text
	property alias numberColor: number.color
	property alias textColor: writing.color

	signal numberEdited

	Column {
		id: column
		anchors.verticalCenter: parent.verticalCenter
		anchors.horizontalCenter: parent.horizontalCenter

		TextInput {
			id: number
			text: qsTr("22")
			font.pointSize: 23
			font.bold: true
			font.family: "Verdana"
			verticalAlignment: Text.AlignVCenter
			horizontalAlignment: Text.AlignHCenter
			anchors.horizontalCenter: parent.horizontalCenter
		}

		Text {
			id: writing
			text: qsTr("All")
			font.pointSize: 14
			font.bold: true
			font.family: "Verdana"
			horizontalAlignment: Text.AlignHCenter
			verticalAlignment: Text.AlignVCenter
			anchors.horizontalCenter: parent.horizontalCenter
		}
	}
}
