import QtQuick 2.14

Item {
	id: root
	width: 400
	height: 400
	property alias root: root

	property alias color: topRectangle.color
	property alias radius: topRectangle.radius

	Rectangle {
		id: topRectangle
		color: "#ffffff"
		radius: height / 2
		anchors.fill: parent

		Rectangle {
			id: bottomRectangle
			color: topRectangle.color
			anchors.topMargin: topRectangle.height / 2
			anchors.fill: parent
		}
	}
}

/*##^##
Designer {
	D{i:0;height:100;width:1920}
}
##^##*/

