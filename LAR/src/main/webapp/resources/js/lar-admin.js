function adminUsersListModal(user_index, list, page, filter, text) {
	filter = typeof filter !== 'undefined' ? filter : null;
	text = typeof text !== 'undefined' ? text : null;

	var modal_header = new Object();

	modal_header.menu = "users";
	modal_header.index = user_index;
	modal_header.list = list;
	modal_header.page = page;

	if (filter != null) {
		modal_header.filter = filter;
		modal_header.text = text;
	}

	$.ajax({
		type : 'post',
		url : '/lar/admin/modal',
		contentType : 'application/json; charset=utf-8',
		data : JSON.stringify(modal_header),
		success : function(result_html) {
			$('.modal-content').html(result_html);
		}
	});
}

function adminChartsModal(chart_index) {
	
}