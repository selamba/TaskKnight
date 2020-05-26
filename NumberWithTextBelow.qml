import QtQuick 2.14

NumberWithTextBelowForm {
	numberObject.onTextEdited: root.numberEdited()
}

/*##^##
Designer {
	D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
