import QtQuick 2.14

Item {
	id: root
	width: nativeWidthInactive
	height: nativeHeightInactive
	property alias mouseArea: mouseArea
	property alias root: root
	property alias selected: root.selected
	property alias imageType: root.imageType
	property alias imageColor: root.imageColor
	property alias imageSource: image.source
	property alias color: topRectangle.color
	property bool selected: false
	property bool isList: true
	property string imageType: "list_"
	property string imageColor: "orange"
	readonly property int nativeWidthInactive: 79
	readonly property int nativeHeightInactive: 76
	readonly property int nativeWidthActive: 79
	readonly property int nativeHeightActive: 91

	signal clicked

	Rectangle {
		id: topRectangle
		color: "#ffffff"
		radius: 20
		anchors.fill: parent
	}

	Rectangle {
		id: bottomRectangle
		height: topRectangle.height / 2
		color: topRectangle.color
		anchors.bottom: parent.bottom
		anchors.left: parent.left
		anchors.right: parent.right
	}

	Image {
		id: image
		width: root.width * 0.8
		height: width
		anchors.horizontalCenter: parent.horizontalCenter
		anchors.verticalCenter: parent.verticalCenter
		sourceSize.height: height
		sourceSize.width: width
		source: "Images/list_orange.svg"
		fillMode: Image.PreserveAspectFit

		MouseArea {
			id: mouseArea
			anchors.fill: parent
		}
	}
}

/*##^##
Designer {
	D{i:1;anchors_height:200;anchors_width:200}D{i:2;anchors_width:200}D{i:4;anchors_height:100;anchors_width:100}
}
##^##*/

