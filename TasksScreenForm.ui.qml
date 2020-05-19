import QtQuick 2.14
import QtGraphicalEffects 1.14

Item {
	id: root
	width: 400
	height: 400

	readonly property int nativeProfileRectWidth: 351
	readonly property int nativeOrangeRectHeight: 220

	Rectangle {
		id: background
		color: "#eeeeee"
		anchors.fill: parent

		Rectangle {
			id: orangeRectangle
			height: nativeOrangeRectHeight
			color: "#ff8705"
			anchors.left: profileRectangle.right
			anchors.top: parent.top
			anchors.right: parent.right

			DropShadow {
				color: "#80000000"
				anchors.fill: source
				source: orangeRectangle
				radius: 8.0
				cached: true
				smooth: true
				samples: 16
				horizontalOffset: 0
				verticalOffset: 3
			}
		}
		Rectangle {
			id: profileRectangle
			width: nativeProfileRectWidth
			color: "#ffffff"
			anchors.top: parent.top
			anchors.topMargin: 0
			anchors.bottom: parent.bottom
			anchors.left: parent.left
			anchors.leftMargin: 0
		}
	}
}

/*##^##
Designer {
	D{i:0;height:1080;width:1920}
}
##^##*/

