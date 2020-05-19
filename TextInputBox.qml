import QtQuick 2.14

TextInputBoxForm {
	echoMode: {
		if (isPassword)
			TextInput.Password
		else
			TextInput.Normal
	}
}
