import QtQuick 2.14
import QtGraphicalEffects 1.14
import "Network.js" as Network

TasksScreenForm {
	listTab.onClicked: switchToList()
	chartTab.onClicked: switchToChart()
	plusButton.onClicked: root.addTaskClicked()

	plusButton.cursorShape: Qt.PointingHandCursor

	totalTasks: tasksList.model.count

	function switchToList() {
		listTab.selected = true
		chartTab.selected = false
		swipeView.decrementCurrentIndex()
	}

	function switchToChart() {
		chartTab.selected = true
		listTab.selected = false
		swipeView.incrementCurrentIndex()
	}

	onAddTaskClicked: {
		plusButton.enabled = false
		plusButton.cursorShape = 0
		addTaskWindow.createObject(root)
	}

	function onTaskCreationFinished() {
		plusButton.enabled = true
		plusButton.cursorShape = Qt.PointingHandCursor
	}

	function onTaskDelegateClicked(id, title, description, imp, urg) {
		var window = detailedTaskWindow.createObject(root)
		window.taskID = id
		window.title = title
		window.description = description
		window.importanceString = imp
		window.urgencyString = urg
	}

	Component {
		id: addTaskWindow
		DetailedTask {
			anchors.centerIn: parent
			leftButtonText: "Cancel"
			rightButtonText: "Create"

			onLeftButtonClicked: {
				destroy()
			}

			onRightButtonClicked: {
				Network.createTask(root.title, root.description, parseFloat(root.importanceString), parseFloat(root.urgencyString))
				destroy()
			}

			Component.onDestruction: {
				onTaskCreationFinished()
			}
		}
	}

	Component {
		id: detailedTaskWindow
		DetailedTask {
			anchors.centerIn: parent
			leftButtonText: "Cancel"
			rightButtonText: "Update"

			onLeftButtonClicked: {
				destroy()
			}

			onRightButtonClicked: {
				Network.updateTask(root.taskID, root.title, root.description,
								   parseFloat(root.importanceString), parseFloat(root.urgencyString))
				destroy()
			}

			Component.onDestruction: {
				onTaskCreationFinished()
			}
		}
	}
}
