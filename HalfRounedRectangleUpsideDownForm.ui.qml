import QtQuick 2.14

Item {
	id: root
	width: 400
	height: 400
	property alias root: root

	property alias color: bottomRectangle.color
	property alias radius: bottomRectangle.radius

	Rectangle {
		id: bottomRectangle
		color: "#ffffff"
		radius: height / 2
		anchors.fill: parent

		Rectangle {
			id: topRectangle
			color: bottomRectangle.color
			anchors.bottomMargin: bottomRectangle.height / 2
			anchors.fill: parent
		}
	}
}
