import QtQuick 2.14

TasksTabForm {
	mouseArea.onClicked: root.clicked()

	mouseArea.cursorShape: {
		if (mouseArea.enabled)
			Qt.PointingHandCursor
		else
			0	// No special cursor shape
	}

	mouseArea.enabled: !selected

	height: {
		if (selected)
			nativeHeightActive
		else
			nativeHeightInactive
	}

	color: {
		if (selected)
			"#ff8705"
		else
			"#ffffff"
	}

	imageSource: {
		let str = "Images/"
		str.concat(imageType).concat(imageColor)
	}

	imageType: {
		if (isList)
			"list_"
		else
			"chart_"
	}

	imageColor: {
		if (selected)
			"white"
		else
			"orange"
	}
}
