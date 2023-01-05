let regiButton = document.getElementById("regiButton");

regiButton.addEventListener("click", (e) => {
  	e.preventDefault();
  	register();
});

function register() {
	let asdf = asdaf;
	
	fetch("<c:url value='/user/register.do'/>", {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json;charset=utf-8'
		},
		body: JSON.stringify({
			userid: userid.value,
			pwd: pwd.value
		})
	})
	.then(response => response.json())
	.then(jsonResult => {
		if (jsonResult.status == true) {
			alert(jsonResult.message);
			location.href = jsonResult.url;
		} else {
			alert(jsonResult.message);
		}
	});
}