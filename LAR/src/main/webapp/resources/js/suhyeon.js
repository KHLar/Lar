/*
 * 
 * Js boolean type is suck....
 * So, integer value 0 : maybe false...
 * And, integer value 1 : maybe true...
 *  
 *
 */

/* Modal closed event */
$(function() {
	$('#dynamicModal').on('hidden.bs.modal', function() {
		$('#modalContent').html(null);
	});
});

/* Modal Load function */
function getModal(target) {
	$.ajax({
		url : '/lar/modal/' + target,
		success : function(result) {
			$('#modalContent').html(result);
		}
	});
}

/* submit validate function */
function form_validate(target) {
	var result = false;

	switch (target) {
		case 'signup':
			if ((input_duplicate_check('id') == 0)) {
	
			} else if ((input_validate('password') == 0)) {
	
			} else if ((input_validate('password2') == 0)) {
	
			} else if ((input_duplicate_check('nickname') == 0)) {
	
			} else if ((input_duplicate_check('phone') == 0)) {
	
			} else {
				result = true;
			}
		break;
		case 'signin':
			
		break;
	}

	return result;
}

function input_state_change(kinds, flag) {
	var target_html_id = 'user_' + kinds;

	if (flag == 1) {
		$('.' + kinds + '.form-group.has-feedback').removeClass('has-error');
		$('.' + kinds + '.form-group.has-feedback').addClass('has-success');
		$('.' + kinds + '.glyphicon.form-control-feedback').removeClass('glyphicon-remove');
		$('.' + kinds + '.glyphicon.form-control-feedback').addClass('glyphicon-ok');
	} else if (flag == 0) {
		$('#' + target_html_id).focus();
		$('.' + kinds + '.form-group.has-feedback').removeClass('has-success');
		$('.' + kinds + '.form-group.has-feedback').addClass('has-error');
		$('.' + kinds + '.glyphicon.form-control-feedback').removeClass('glyphicon-ok');
		$('.' + kinds + '.glyphicon.form-control-feedback').addClass('glyphicon-remove');
	}
}

function input_help_block_change(kinds, reason, flag) {
	var result = '';
	
	if (flag == 1) { // 성공
		if (reason == 'validate') {
			// 문법 검사 통과
			result = '올바른 값 입니다.';
		} else if (reason == 'duplicate') {
			// 중복 검사 통과
			result = '사용할수 있는 값 입니다.';
		}
	} else if (flag == 0) { // 실패
		if (reason == 'validate') {
			// 문법 검사 실패
			switch (kinds) {
			case 'id':
				result = '올바른 이메일 양식이 아닙니다.';
				break;
			case 'password':
				result = '영어 대문자, 소문자, 숫자, 특수문자가 한개 이상 들어간 8~20 글자를 입력하세요.';
				break;
			case 'password2':
				result = '입력한 비밀번호와 값이 다릅니다.';
				break;
			case 'nickname':
				result = '한,영,숫자로 이루어진 2~8 글자를 입력하세요.';
				break;
			case 'phone':
				result = '\'-\' 문자를 포함해서 입력해 주세요.';
				break;
			default:
				break;
			}
			
		} else if (reason == 'duplicate') {
			// 중복 검사 실패
			result = '이미 사용중인 값 입니다.';
		}
	}

	$('.' + kinds + '.help-block').text(result);

}

function input_validate(kinds) {
	var target_html_id = 'user_' + kinds;
	var target_html_value = $('#' + target_html_id).val();
	var reg_Exp;
	var result = false;
	var result_value = 0;

	switch (kinds) {
		case 'id':
			reg_Exp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,4}$/i;
			result = reg_Exp.test(target_html_value);
		break;
		case 'password':
			reg_Exp = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,20}$/g;
			result = reg_Exp.test(target_html_value);
		break;
		case 'password2':
			result = target_html_value == $('#user_password').val() ? true : false;
		break;
		case 'nickname':
			reg_Exp = /^[가-힣a-zA-Z0-9]{2,8}$/;
			result = reg_Exp.test(target_html_value);
		break;
		case 'phone':
			reg_Exp = /(01[016789])[-](\d{4}|\d{3})[-]\d{4}$/g;
			result = reg_Exp.test(target_html_value);
		break;
		default:
		break;
	}
	//	
	if (result) result_value = 1;

	input_state_change(kinds, result_value);
	input_help_block_change(kinds, 'validate', result_value);

	return result_value;
}

// This function use to onblur event.
function input_duplicate_check(kinds) {
	if (!input_validate(kinds)) {
		return 0;
	}

	var target_html_id = 'user_' + kinds;
	var target_html_value = $('#' + target_html_id).val();

	$.ajax({
		type : 'post',
		url : '/lar/user/' + kinds + 'DuplicateCheck',
		data : {
			value : target_html_value
		},
		dataType : 'json',
		success : function(data) {
			if (data) {
				input_state_change(kinds, 1);
				input_help_block_change(kinds, 'duplicate', 1);
				return 1;
			} else {
				input_state_change(kinds, 0);
				input_help_block_change(kinds, 'duplicate', 0);
				return 0;
			}
		},
		error : function() {
			alert('서버에 오류가 발생하였음.');
		}
	});
}