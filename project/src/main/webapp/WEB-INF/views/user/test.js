window.onload = () => {
	document.getElementById('deleteInfoButton').removeAttribute('href');
	let email2 = document.getElementsByName("email2");
	document.querySelector
	let num = document.getElementsByName("num");
	
	let resultPoint = document.querySelector("#price");
	resultPoint.addEventListener("keyUp", () => {
		alret(resultPoint.value);
	});	
}