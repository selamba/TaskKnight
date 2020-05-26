import QtQuick 2.14

ProfileSquareForm {
	initials: {
		fullName.charAt(0).concat(" ").concat(fullName.charAt(fullName.indexOf(" ") + 1))
	}
}
