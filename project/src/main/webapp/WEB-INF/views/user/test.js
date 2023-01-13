window.onload = () => {
	document.getElementById('deleteInfoButton').removeAttribute('href');
	let email2 = document.getElementsByName("email2");
	document.querySelector
	let num = document.getElementsByName("num");
	
	let resultPoint = document.querySelector("#price");
	resultPoint.addEventListener("keyUp", () => {
		alret(resultPoint.value);
	});	
	
	let nowPage = document.getElementsByClassName("'" + num + "'");
	nowPage.style.color = '#fff';
	nowPage.style.backgroundColor = '#5f76e8';
	
	var eventPlus = document.getElementsByName("plus");
	
	ck.for
	document.getElementsByName
	
	var eventTarget = document.getElementsByClassName('btn_delete')

for (var i = 0; i < eventTarget.length; i++) {
	eventTarget[i].addEventListener('click', function() {
		var parent = document.querySelector('#cartTable tbody');
		parent.removeChild(this.parentElement.parentElement);
		i--;
	})
}
}