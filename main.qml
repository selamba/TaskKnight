import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 2.14
import "Network.js" as Network

Window {
	id: app
	visible: true
	minimumWidth: 1664
	minimumHeight: 936
	title: qsTr("Task Knight")

	property Item tasksList

	// Networking variables
	property string accessToken: "N/A"
	property string confirmationToken: "N/A"
	property bool isLoggedIn: accessToken !== "N/A"
	property string userID: "N/A"
	property string currentLogin: "N/A"

	SwipeView {
		id: swipeView
		anchors.fill: parent
		focus: true
		interactive: false
		currentIndex: 0

		Keys.onDigit9Pressed: {
			screenDimmed = !screenDimmed
		}

		Keys.onEscapePressed: {
			Qt.quit()
		}

		Component.onCompleted: {
			swipeView.addItem(startScreen.createObject(swipeView))
		}

		Component {
			id: startScreen
			StartScreen {
				onSignInClicked: {
					swipeView.addItem(signInScreen.createObject(swipeView))
					swipeView.incrementCurrentIndex()
				}

				onSignUpClicked: {
					swipeView.addItem(signUpScreen.createObject(swipeView))
					swipeView.incrementCurrentIndex()
				}
			}
		}

		Component {
			id: signInScreen
			SignInScreen {
				onForgotPasswordClicked: {
				}

				onSignInClicked: {
					Network.login(email, password)
				}

				onBackClicked: {
					swipeView.decrementCurrentIndex()
					destructionTimer.start()
				}
			}
		}

		Component {
			id: signUpScreen
			SignUpScreen {
				onCreateClicked: {
					Network.registration(fullName, email, password)
				}

				onBackClicked: {
					swipeView.decrementCurrentIndex()
					destructionTimer.start()
				}
			}
		}

		Component {
			id: registrationVerificationScreen
			VerificationCodeScreen {
				onSubmitClicked: {
					Network.registrationConfirm(codeString)
				}
			}
		}

		Component {
			id: tasksScreen
			TasksScreen {
				Component.onCompleted: {
					app.tasksList = root.tasksList
					Network.listTasks("0", "99")
				}
			}
		}
	}

	Timer {
		id: destructionTimer
		interval: 300
		onTriggered: {
			swipeView.removeItem(swipeView.itemAt(1))
		}
	}

	function proceedAfterLogin() {
		swipeView.addItem(tasksScreen.createObject(swipeView))
		swipeView.incrementCurrentIndex()
	}

	function proceedToRegistrationConfirm() {
		swipeView.addItem(registrationVerificationScreen.createObject(swipeView))
		swipeView.incrementCurrentIndex()
	}

	function proceedAfterRegistrationConfirm() {
		swipeView.addItem(tasksScreen.createObject(swipeView))
		swipeView.incrementCurrentIndex()
	}

	function updateAfterTasksChange() {
		Network.listTasks("0", "99")
	}

	function flushTasks() {
		app.tasksList.model.clear()
	}
}

/*##^##
Designer {
	D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
