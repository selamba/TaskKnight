import QtQuick 2.14

Item {
	id: root
	width: nativeWidth
	height: nativeHeight
	property alias root: root
	property alias mouseArea: mouseArea

	property alias cursorShape: mouseArea.cursorShape
	property alias textColor: writing.color
	property alias writing: writing.text
	property alias rectangleColor: rectangle.color
	property alias buttonHeight: root.height
	property alias buttonWidth: root.width
	readonly property int nativeWidth: 238
	readonly property int nativeHeight: 101
	readonly property int nativePointSize: 37
	signal clicked

	Rectangle {
		id: rectangle
		color: "#ffffff"
		radius: height / 2
		anchors.fill: parent

		Text {
			id: writing
			color: "#ff8705"
			text: "Button"
			font.pointSize: nativePointSize
			fontSizeMode: Text.HorizontalFit
			font.bold: true
			font.family: "Verdana"
			horizontalAlignment: Text.AlignHCenter
			verticalAlignment: Text.AlignVCenter
			anchors.fill: parent
		}

		MouseArea {
			id: mouseArea
			anchors.rightMargin: 10
			anchors.leftMargin: 10
			anchors.topMargin: 5
			anchors.bottomMargin: 5
			anchors.fill: parent
		}
	}
}

/*##^##
Designer {
	D{i:0;height:101;width:238}
}
##^##*/

