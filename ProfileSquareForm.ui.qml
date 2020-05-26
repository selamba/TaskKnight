import QtQuick 2.14
import QtQuick.Layouts 1.14

Item {
	id: root
	width: 300
	height: width
	property alias root: root

	readonly property int nativeCircleWidth: 156
	readonly property int nativeFontPointSize: 52
	property alias fullName: fullInitials.text
	property alias initials: initials.text

	ColumnLayout {
		id: column
		spacing: -30
		anchors.fill: parent

		Rectangle {
			id: initialsCircle
			width: nativeCircleWidth
			height: width
			color: "#ff8705"
			radius: height / 2
			Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

			Text {
				id: initials
				color: "#ffffff"
				text: qsTr("I V")
				verticalAlignment: Text.AlignVCenter
				horizontalAlignment: Text.AlignHCenter
				font.wordSpacing: -10
				font.letterSpacing: 0
				font.bold: false
				font.family: "Verdana"
				font.pointSize: nativeFontPointSize
				anchors.horizontalCenter: parent.horizontalCenter
				anchors.verticalCenter: parent.verticalCenter
			}
		}

		Text {
			id: fullInitials
			text: "John Doe"
			Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
			verticalAlignment: Text.AlignVCenter
			horizontalAlignment: Text.AlignHCenter
			font.bold: true
			font.family: "Verdana"
			font.pointSize: 25
		}
	}
}
