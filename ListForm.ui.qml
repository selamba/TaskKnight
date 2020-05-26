import QtQuick 2.14

Item {
	id: root
	width: 400
	height: 400
	property alias root: root
	property alias view: listView

	property alias delegate: listView.delegate
	property alias model: listView.model

	ListView {
		id: listView
		spacing: 10
		anchors.fill: parent
	}
}
