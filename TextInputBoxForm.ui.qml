import QtQuick 2.14

Item {
	id: root
	width: nativeWidth
	height: nativeHeight
	property alias root: root
	property alias echoMode: textInput.echoMode
	property alias text: textInput.text
	property alias rectHeight: root.height
	property alias rectWidth: root.width
	property alias isPassword: root.isPassword
	property alias nativeWidth: root.nativeWidth
	property alias nativeHeight: root.nativeHeight
	property bool isPassword: false
	readonly property int nativeWidth: 735
	readonly property int nativeHeight: 100

	Rectangle {
		id: rectangle
		color: "#ffffff"
		radius: height / 2
		anchors.fill: parent

		TextInput {
			id: textInput
			color: "#ff8705"
			text: qsTr("Text Input")
			anchors.rightMargin: 20
			anchors.leftMargin: 20
			font.pointSize: 30
			selectByMouse: true
			font.bold: true
			font.family: "Verdana"
			selectionColor: "#ff8705"
			verticalAlignment: Text.AlignVCenter
			anchors.fill: parent
		}
	}
}
