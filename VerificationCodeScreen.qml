import QtQuick 2.14

VerificationCodeScreenForm {
	submitButton.onClicked: root.submitClicked(parseInt(codeString))
}
