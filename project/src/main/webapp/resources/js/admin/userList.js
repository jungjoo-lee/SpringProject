function list(num) {
	fetch("<c:url value='/admin/memberPage.do' />", {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json;charset=utf-8'
		},
		body: JSON.stringify({
			num: num
		})
	})
	.then(response => response.json())
	.then(jsonResult => {
		if (jsonResult.status == true) {
			let listUsers = jsonResult.listUsers;
			let content = '';
			let i = 0;

			boardList.forEach(() => {
				content += '<tr>';
				content += '<td>' + listUsers[i].rowNum + '</td>';
				content += '<td>' + listUsers[i].category + '</td>';
				content += '<td>' + listUsers[i] + '</td>';
				content += '<td>' + listUsers[i].writer + '</td>';
				content += '<td>' + listUsers[i].hit + '</td>';
				content += '<td>' + listUsers[i].like + '</td>';
				content += '<td>' + listUsers[i++].createTime + '</td>';
				content += '</tr>';
			});
			document.querySelector("#list").innerHTML = content;

			let pagecontent = '';

			if (jsonResult.pageVO.Prev) {
				pagecontent += '<li class="page-item"><a class="page-link" id="Prev" href="javascript:list(' + ((jsonResult.pageVO.startPage) - 1) + ')">Prev</a></li>';
			}

			if ((jsonResult.pageVO.endPage % 10) == 0) {
				for (let j = 0; j < 10; j++) {
					pagecontent += '<li class="page-item">';
					pagecontent += '<a class="page-link" id="' + (jsonResult.startPage + j) + '" href="javascript:list(' + (jsonResult.pageVO.startPage + j) + ')">' + (jsonResult.pageVO.startPage + j) + '</a>';
					pagecontent += '</li>';
				}
			} else {
				for (let j = 0; j < (jsonResult.pageVO.endPage % 10); j++) {
					pagecontent += '<li class="page-item">';
					pagecontent += '<a class="page-link" id="' + (jsonResult.startPage + j) + '" href="javascript:list(' + (jsonResult.pageVO.startPage + j) + ')">' + (jsonResult.pageVO.startPage + j) + '</a>';
					pagecontent += '</li>';
				}
			}

			if (jsonResult.pageVO.Next) {
				pagecontent += '<li class="page-item"><a class="page-link" id="Next" href="javascript:list(' + (jsonResult.pageVO.endPage / 10) + 1 + ')">Next</a></li>';
			}
			document.querySelector("#pagination").innerHTML = pagecontent;

		} else {
			console.log(jsonResult.message);
		}
	});
}