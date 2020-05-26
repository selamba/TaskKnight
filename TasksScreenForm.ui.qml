import QtQuick 2.14
import QtGraphicalEffects 1.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

Item {
	id: root
	width: 400
	height: 400

	property alias tasksList: list // exposing to main.qml

	property alias root: root
	property alias plusButton: plusButton
	property alias swipeView: swipeView
	property alias chartTab: chartTab
	property alias listTab: listTab
	property alias totalTasks: numberAll.number

	readonly property int nativeProfileRectWidth: 351
	readonly property int nativeOrangeRectHeight: 220

	signal addTaskClicked

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
			layer.enabled: true
			layer.effect: DropShadow {
				color: "#80000000"
				radius: 9.0
				cached: true
				smooth: true
				samples: 19
				horizontalOffset: 0
				verticalOffset: 1
			}
		}

		Rectangle {
			id: profileRectangle
			width: nativeProfileRectWidth
			color: "#ffffff"
			anchors.top: parent.top
			anchors.bottom: parent.bottom
			anchors.left: parent.left

			ProfileSquare {
				id: profileSquare
				anchors.top: parent.top
				anchors.left: parent.left
				anchors.right: parent.right
			}

			RowLayout {
				id: summaryRow
				anchors.rightMargin: 10
				anchors.leftMargin: 10
				spacing: 0
				anchors.top: profileSquare.bottom
				anchors.left: parent.left
				anchors.right: parent.right

				NumberWithTextBelow {
					id: numberAll
					readOnly: true
					text: "Total"
					Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
				}
			}
		}

		Item {
			id: tasksArea
			width: orangeRectangle.width * 0.94
			anchors.bottom: parent.bottom
			anchors.top: orangeRectangle.bottom
			anchors.topMargin: 30
			anchors.horizontalCenter: orangeRectangle.horizontalCenter

			HalfRoundedRectangle {
				id: topRectangle
				height: 65
				color: "#ffffff"
				anchors.right: parent.right
				anchors.left: parent.left
				z: 2

				Text {
					id: element
					color: "#a5a4a6"
					text: qsTr("Tasks")
					font.bold: true
					font.family: "Verdana"
					font.pointSize: 28
					anchors.verticalCenter: parent.verticalCenter
					anchors.horizontalCenter: parent.horizontalCenter
					layer.enabled: false
				}

				TasksTab {
					id: listTab
					y: -48
					anchors.left: parent.left
					anchors.leftMargin: 50
					anchors.bottom: parent.bottom
					isList: true
					selected: true
					layer.enabled: true
					layer.effect: DropShadow {
						color: "#80000000"
						radius: 9.0
						smooth: true
						samples: 19
						horizontalOffset: 0
						verticalOffset: -1
					}
				}

				TasksTab {
					id: chartTab
					y: -48
					anchors.left: listTab.right
					anchors.leftMargin: 15
					anchors.bottom: parent.bottom
					isList: false
					selected: false
					layer.enabled: true
					layer.effect: DropShadow {
						color: "#80000000"
						radius: 9.0
						smooth: true
						samples: 19
						horizontalOffset: 0
						verticalOffset: -1
					}
				}

				Image {
					id: plusImage
					anchors.right: parent.right
					anchors.rightMargin: 50
					anchors.verticalCenter: parent.verticalCenter
					sourceSize.height: height
					sourceSize.width: width
					source: "Images/plus-solid.svg"
					fillMode: Image.PreserveAspectFit

					MouseArea {
						id: plusButton
						anchors.fill: parent
					}
				}
			}

			Rectangle {
				id: middleRectangle
				color: "#ffffff"
				anchors.top: topRectangle.bottom
				anchors.bottom: parent.bottom
				anchors.left: parent.left
				anchors.right: parent.right

				SwipeView {
					id: swipeView
					orientation: Qt.Horizontal
					interactive: false
					anchors.fill: parent
					currentIndex: 0
					clip: true

					List {
						id: list
					}

					Item {
						id: chart
						Rectangle {
							color: "blue"
							anchors.fill: parent
						}
					}
				}
			}

			DropShadow {
				id: topRectangleShadow
				anchors.fill: source
				source: topRectangle
				color: "#80000000"
				radius: 9.0
				cached: true
				smooth: true
				samples: 19
				horizontalOffset: 0
				verticalOffset: 1
			}

			DropShadow {
				id: middleRectangleShadow
				anchors.fill: source
				source: middleRectangle
				color: "#80000000"
				radius: 9.0
				cached: true
				smooth: true
				samples: 19
				horizontalOffset: 0
				verticalOffset: 0
				z: -1
			}
		}
	}
}
