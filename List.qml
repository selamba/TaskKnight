import QtQuick 2.14
import QtQuick.Controls 2.14
import "Network.js" as Network

ListForm {
	id: form
	delegate: delegate
	model: model

	Component {
		id: delegate
		ListDelegate {
			taskId: model.taskId
			title: model.title
			description: model.text
			importance: model.importance
			urgency: model.urgency
			createdAt: model.createdAt
			updatedAt: model.updatedAt

			onDeleteClicked: {
				Network.deleteTask(taskId)
			}

			onClicked: {
				onTaskDelegateClicked(taskId, title, description, importance, urgency)
			}
		}
	}

	ListModel {
		id: model
		ListElement {
			taskId: "id"
			title: "Title"
			text: "text"
			importance: 0.0
			urgency: 0.0
			createdAt: "date"
			updatedAt: "date"
		}
	}
}
