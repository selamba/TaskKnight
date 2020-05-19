import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 2.14

Window {
	visible: true
	minimumWidth: 1664
	minimumHeight: 936
	title: qsTr("Hello World")

	SwipeView {
		id: swipeView
		anchors.fill: parent
		focus: true
		interactive: false
		currentIndex: 0

		Keys.onDigit9Pressed: {
			swipeView.addItem(tasksScreen.createObject(swipeView))
			swipeView.incrementCurrentIndex()
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
					console.log("Forgot password")
				}

				onSignInClicked: {
					console.log(email, password)
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
					swipeView.addItem(verificationCodeScreen.createObject(swipeView))
					swipeView.incrementCurrentIndex()
				}

				onBackClicked: {
					swipeView.decrementCurrentIndex()
					destructionTimer.start()
				}
			}
		}

		Component {
			id: verificationCodeScreen
			VerificationCodeScreen {
				onSubmitClicked: {
					console.log(code)
				}
			}
		}

		Component {
			id: tasksScreen
			TasksScreen {

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
}

/*##^##
Designer {
	D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
