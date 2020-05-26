const apiVersion = "1.0"
const url = "http://nonfallable.com:8091/api/" + apiVersion

// Admin user (testing only):
// root@root.com
// UG6s2eoqA8ffO99b

//
// Authentication
//

function getAuth() {
	// Check if function was called prematurely
	if (accessToken === "N/A") {
		console.log("GET auth called prematurely.")
		return
	}

	const suffix = "/auth"
	let response
	var xhr = new XMLHttpRequest()

	xhr.onreadystatechange = function() {
		if (xhr.readyState === XMLHttpRequest.DONE) {
			response = JSON.parse(xhr.responseText.toString())
			console.log("Auth response recieved.")
			console.log("XHR Status: ", xhr.status)
			console.log("Response:")
			console.log(JSON.stringify(response, null, 2))

			if (xhr.status === 401 || xhr.status === 400) {	// Check for both 400 and 401 because api is a mess
				// Unauthorized
				console.log("Client not authorized.")
			} else if (xhr.status === 200) {
				// Success
				console.log("Authorization data recieved.")

				app.userID = response.id
				app.accessToken = response.accessToken
				app.currentLogin = response.login
			} else {
				console.log("getAuth: Undefined behaviour happened.")
			}
		}
	}

	xhr.open("GET", url + suffix, true)
	xhr.setRequestHeader("Content-type", "application/json")
	xhr.setRequestHeader("Authorization", accessToken)

	xhr.send()
	console.log("Auth request sent.")
}

function login(email, password) {
	// Email validity check
	if (!emailIsValid(email)) {
		console.log ("Login failed: invalid email.")
		return
	}

	const suffix = "/login"
	let response
	var xhr = new XMLHttpRequest()

	xhr.onreadystatechange = function() {
		if (xhr.readyState === XMLHttpRequest.DONE) {
			response = JSON.parse(xhr.responseText.toString())
			console.log("Login response recieved.")
			console.log("XHR Status: ", xhr.status)
			console.log("Response:")
			console.log(JSON.stringify(response, null, 2))

			if (xhr.status === 400) {
				// Login failed
				console.log("Login failed: wrong credentials.")
			} else if (xhr.status === 200) {
				// Login successful
				console.log("Login successful.")

				app.isLoggedIn = true
				app.accessToken = response.accessToken
				app.userID = response.id
				app.currentLogin = response.login

				app.proceedAfterLogin()
			} else {
				console.log("login: Undefined behaviour happened.")
			}
		}
	}

	xhr.open("POST", url + suffix, true)
	xhr.setRequestHeader("Content-type", "application/json")

	const jsonData = {
		"login": email,
		"password": password
	}

	xhr.send(JSON.stringify(jsonData))
	console.log("Login request sent.")
}

function registration(fullName, email, password) {
	// Email validity check
	if (!emailIsValid(email)) {
		console.log ("Registration failed: invalid email.")
		return
	}

	const suffix = "/registration"
	let response
	var xhr = new XMLHttpRequest()

	xhr.onreadystatechange = function() {
		if (xhr.readyState === XMLHttpRequest.DONE) {
			response = JSON.parse(xhr.responseText.toString())
			console.log("Registration response recieved.")
			console.log("XHR Status: ", xhr.status)
			console.log("Response:")
			console.log(JSON.stringify(response, null, 2))

			if (xhr.status === 400) {
				// Error in request data
				console.log("Registration failed: error in request data.")
			} else if (xhr.status === 200) {
				// Registration request approved
				console.log("Registration approved, awaiting verification code.")

				app.accessToken = response.accessToken
				app.confimrationToken = response.confirmationToken

				app.proceedToRegistrationConfirm()
			} else {
				console.log("registration: Undefined behaviour happened.")
			}
		}
	}

	xhr.open("POST", url + suffix, true)
	xhr.setRequestHeader("Content-type", "application/json")

	const jsonData = {
		"userName": fullName,
		"login": email,
		"password": password
	}

	xhr.send(JSON.stringify(jsonData))
	console.log("Registration request sent.")
}

function registrationConfirm(code) {
	// Check if function was called prematurely
	if (confimrationToken === "N/A") {
		console.log("Registration confirm called prematurely.")
		return
	}

	const suffix = "/registration/confirm"
	let response
	var xhr = new XMLHttpRequest()

	xhr.onreadystatechange = function() {
		if (xhr.readyState === XMLHttpRequest.DONE) {
			response = JSON.parse(xhr.responseText.toString())
			console.log("Registration confirm response recieved.")
			console.log("XHR Status: ", xhr.status)
			console.log("Response:")
			console.log(JSON.stringify(response, null, 2))

			if (xhr.status === 200) {
				// Registration confirm successful
				console.log("Registration confirm successful.")

				app.isLoggedIn = true
				getAuth()

				app.proceedAfterRegistrationConfirm()
			} else {
				console.log("registrationConfirm: Undefined behaviour happened.")
			}
		}
	}

	xhr.open("POST", url + suffix + "/" + confimrationToken, true)
	xhr.setRequestHeader("Content-type", "application/json")
	xhr.setRequestHeader("Authorization", accessToken)

	const jsonData = {
		"code": code
	}

	xhr.send(JSON.stringify(jsonData))
	console.log("Registration confirm request sent.")
}

function changePassword(newPassword) {

}

function changePasswordConfirm(code) {

}

function emailIsValid(email) {
	let regex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,10})+$/
	return (regex.test(email))
}

//
// Tasks
//

function listTasks(pageNumber, pageSize) {
	const suffix = "/listTasks"
	var params = "?page=%1&size=%2"
	let response
	var xhr = new XMLHttpRequest()

	xhr.onreadystatechange = function() {
		if (xhr.readyState === XMLHttpRequest.DONE) {
			response = JSON.parse(xhr.responseText.toString())
			console.log("List tasks response recieved.")
			console.log("XHR Status: ", xhr.status)
			console.log("Response:")
			console.log(JSON.stringify(response, null, 2))

			if (xhr.status === 200) {
				// Success
				console.log("List tasks request fulfilled.")

				const tasks = response.data
				app.flushTasks()
				for (var i = 0; i < tasks.length; i++) {
					var task = tasks[i]
					app.tasksList.model.append(
								{   taskId: task.id,
									title: task.title,
									text: task.text,
									importance: task.importance,
									urgency: task.urgency,
									//									author: task.author,
									createdAt: task.createdAt,
									updatedAt: task.updatedAt
								})
				}
			} else {
				console.log("listTasks: Undefined behaviour happened.")
			}
		}
	}

	xhr.open("GET", url + suffix + params.arg(pageNumber).arg(pageSize), true)
	xhr.setRequestHeader("Content-type", "application/json")
	xhr.setRequestHeader("Authorization", accessToken)

	xhr.send()
	console.log("List tasks request sent.")
}

function getTask(taskId) {
	const suffix = "/getTask"
	let response
	var xhr = new XMLHttpRequest()

	xhr.onreadystatechange = function() {
		if (xhr.readyState === XMLHttpRequest.DONE) {
			response = JSON.parse(xhr.responseText.toString())
			console.log("Get task response recieved.")
			console.log("XHR Status: ", xhr.status)
			console.log("Response:")
			console.log(JSON.stringify(response, null, 2))

			if (xhr.status === 200) {
				// Success
				console.log("Get task request fulfilled.")
			} else {
				console.log("getTask: Undefined behaviour happened.")
			}
		}
	}

	xhr.open("GET", url + suffix + "/" + taskId, true)
	xhr.setRequestHeader("Content-type", "application/json")
	xhr.setRequestHeader("Authorization", accessToken)

	xhr.send()
	console.log("Get task request sent.")
}

function createTask(title, text, imp, urg) {
	const suffix = "/createTask"
	let response
	var xhr = new XMLHttpRequest()

	xhr.onreadystatechange = function() {
		if (xhr.readyState === XMLHttpRequest.DONE) {
			response = JSON.parse(xhr.responseText.toString())
			console.log("Create task response recieved.")
			console.log("XHR Status: ", xhr.status)
			console.log("Response:")
			console.log(JSON.stringify(response, null, 2))

			if (xhr.status === 200) {
				// Success
				console.log("Create task request fulfilled.")

				app.updateAfterTasksChange()
			} else {
				console.log("createTask: Undefined behaviour happened.")
			}
		}
	}

	xhr.open("POST", url + suffix, true)
	xhr.setRequestHeader("Content-type", "application/json")
	xhr.setRequestHeader("Authorization", accessToken)

	const jsonData = {
		"title": title,
		"text": text,
		"importance": imp,
		"urgency": urg
	}

	xhr.send(JSON.stringify(jsonData))
	console.log("Create task request sent.")
}

function updateTask(id, title, text, imp, urg) {
	const suffix = "/updateTask"
	let response
	var xhr = new XMLHttpRequest()

	xhr.onreadystatechange = function() {
		if (xhr.readyState === XMLHttpRequest.DONE) {
			response = JSON.parse(xhr.responseText.toString())
			console.log("Update task response recieved.")
			console.log("XHR Status: ", xhr.status)
			console.log("Response:")
			console.log(JSON.stringify(response, null, 2))

			if (xhr.status === 200) {
				// Success
				console.log("Update task request fulfilled.")

				app.updateAfterTasksChange()
			} else {
				console.log("updateTask: Undefined behaviour happened.")
			}
		}

	}

	xhr.open("PUT", url + suffix + "/" + id, true)
	xhr.setRequestHeader("Content-type", "application/json")
	xhr.setRequestHeader("Authorization", accessToken)

	const jsonData = {
		"title": title,
		"text": text,
		"importance": imp,
		"urgency": urg
	}

	xhr.send(JSON.stringify(jsonData))
	console.log("Update task request sent.")
}

function deleteTask(id) {
	const suffix = "/deleteTask"
	let response
	var xhr = new XMLHttpRequest()

	xhr.onreadystatechange = function() {
		if (xhr.readyState === XMLHttpRequest.DONE) {
			response = JSON.parse(xhr.responseText.toString())
			console.log("Delete task response recieved.")
			console.log("XHR Status: ", xhr.status)
			console.log("Response:")
			console.log(JSON.stringify(response, null, 2))

			if (xhr.status === 200) {
				// Success
				console.log("Delete task request fulfilled.")

				app.updateAfterTasksChange()
			} else {
				console.log("deleteTask: Undefined behaviour happened.")
			}
		}
	}

	console.log(url + suffix + "/" + id)
	xhr.open("DELETE", url + suffix + "/" + id, true)
	xhr.setRequestHeader("Content-type", "application/json")
	xhr.setRequestHeader("Authorization", accessToken)

	xhr.send()
	console.log("Delete task request sent.")
}
