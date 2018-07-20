<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/chat.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/js/sockjs.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

<div class="quest" style="z-index: 1000;">
	<p>문의하기</p>
</div>

<div class="chat_container">
	<div class="row chat-window col-xs-6 col-md-6" id="chat_window_1"
		style="margin-left: 10px;">
		<div class="col-xs-12 col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading top-bar">
					<div class="col-md-8 col-xs-8">
						<h3 class="panel-title">
							<span class="glyphicon glyphicon-comment"></span> 1:1 문의
						</h3>
					</div>
					<div class="col-md-4 col-xs-4" style="text-align: right;">
						<span id="minim_chat_window" class="glyphicon glyphicon-minus icon_minim"style="cursor: pointer;"></span>
						<span class="glyphicon glyphicon-remove icon_close"	data-id="chat_window_1" style="cursor: pointer;"></span>
					</div>
				</div>
				<div class="panel-body msg_container_base">
					<div class="row msg_container base_receive">
						<div class="col-md-2 col-xs-2 avatar">
							<img src="http://www.bitrebels.com/wp-content/uploads/2011/02/Original-Facebook-Geek-Profile-Avatar-1.jpg"
								class=" img-responsive ">
						</div>
						<div class="col-xs-10 col-md-10">
							<div class="messages msg_receive">
								<p>that mongodb thing looks good, huh? tiny master db, and
									huge document store</p>
								<time datetime="2009-11-13T20:00">Timothy • 51 min</time>
							</div>
						</div>
					</div>
					
					<div class="inquire_container">
					<div class="row msg_container base_sent">
						<div class="col-md-10 col-xs-10 ">
							<div class="messages msg_sent">
								<p>that mongodb thing looks good, huh? tiny master db, and
									huge document store</p>
								<time datetime="2009-11-13T20:00">Timothy • 51 min</time>
							</div>
						</div>
						<div class="col-md-2 col-xs-2 avatar">
							<img src="http://www.bitrebels.com/wp-content/uploads/2011/02/Original-Facebook-Geek-Profile-Avatar-1.jpg"
								class=" img-responsive ">
						</div>
						
					</div>
					<div class="inquire_option" style="display: block; color: skyblue;">
							<span style="float: left;">첨부한 파일</span>
							<div style="display: inline; width: 270px;" id="void"></div>
							<span>수정</span>
							<span style="float: right;">삭제</span>
						</div>
					</div>
					
				</div>
				<div class="panel-footer">
					<div class="input-group">
						<textarea id="chat-area" class="form-control input-sm chat_input" placeholder="Write your message here..." style="resize: none;" rows="5"></textarea>
						<span class="input-group-btn" style="padding-left: 20px;">
							<button class="btn btn-primary btn-sm" id="btn-chat" style="border-radius: 5px; background-color: #337ab7; border-color: #2e6da4;">Send</button>
						</span>
					</div>
					<div class="filebox bs3-primary preview-image" style="text-align: right;">
						<input class="upload-name" value="파일선택" disabled="disabled" style="width: 200px;">
						<label for="input_file">업로드</label>
						<input type="file" id="input_file" class="upload-hidden">
					</div>
				</div>
			</div>
		</div>
	</div>

</div>
<script>
	var s; // Socket
	var stompClient = null;
	var c;	// confirm

	$('.quest').on('click', function() {
		if ($(this).css('display') != 'none') {
			$(this).css('display', 'none');
			$('.chat_container').css({
				'display' : 'block',
				'bottom' : '30px'
			});
		}
		connect();
	});

	$('.icon_close').on('click', function() {
		if ($('.chat_container').css('display') != 'none') {
			$('.chat_container').css('display', 'none');
			$('.quest').css('display', 'block');
		}
	});

	$("#btn-chat").on("click", function() {
		sendMsg();
		$('#chat-area').val(null);
		$('.upload-name').val('파일 선택');
		$('.upload-thumb-wrap').remove();
		/* var check = confirm('Are you Server?');
		if(check == true){
			if(ws == undefined){
				ws = new SockJS("/lar/myHandler");
				
				ws.onopen = function() {
				     console.log('open');
				     ws.send("사용자 : "+$("#chat-area").val());
				 };

				 ws.onmessage = function(e) {
				     console.log('message', e.data);
				     //ws.close();
				 };

				 ws.onclose = function() {
				     console.log('close');
				 };
			}
		} else {
			if(ws == undefined){
				ws = new SockJS("/lar/myHandler", 8040, 313);
				ws.onopen = function() {
				     console.log('open');
				     ws.send("사용자 : "+$("#chat-area").val());
				 };
				 ws.onmessage = function(e) {
				     console.log('message', e.data);
				     //ws.close();
				 };
				 ws.onclose = function() {
				     console.log('close');
				 };
			}
		} */
	});

	/* 		function setConnected(connected) {
	 $("#connect").prop("disabled", connected);
	 $("#disconnect").prop("disabled", !connected);
	 if (connected) {
	 $("#conversation").show();
	 } else {
	 $("#conversation").hide();
	 }
	 $("#greetings").html("");
	 } */

	 
	// ctrl+Enter or shift+enter => enter & press enter => send message
	$('#chat-area').keydown(function(e) {
		if (e.keyCode == 13) {			
			if (e.ctrlKey)  $(this).val(function(i, val) {return val + "\n";});
			else if (e.shiftKey) return $(this).val();
			else {
				sendMsg();
				$('#chat-area').val(null);
				$('.upload-name').val('파일 선택');
				$('.upload-thumb-wrap').empty();
				return false;
			}
		}
	});

	// socket 연결
	function connect() {
		s = new SockJS('/lar/inquire');
		stompClient = Stomp.over(s);
		stompClient.connect({}, function(frame) {
			//setConnected(true);
			console.log('Connected: ' + frame);
			stompClient.subscribe('/topic/greetings', function(msg) {
				showGreeting(JSON.parse(msg.body));
			});
		});
	}

	function scrollDown() {
		$('.msg_container_base').scrollTop($('.msg_container_base').prop('scrollHeight'));
	}

	// 메시지 전송
	function sendMsg() {
		if ('${session_user}' == '' || '${session_user}' == null) {
			c = confirm("로그인 후에 이용 가능한 메뉴입니다. 로그인 하시겠습니까?");
			if (c == true) {
				$('.dynamicModal').modal('show');
				getModal('signin');
			} else
				return;
		} else {
			if ($('#chat-area').val() != null && $('#chat-area').val().trim() != '')
				stompClient.send("/app/question", {}, JSON.stringify({
					'inquire_sender_index' : '${session_user.user_id}',
					'inquire_receiver_index' : 'admin',
					'inquire_content' : $('#chat-area').val()
				}));
			else
				alert("내용을 입력해주세요.");
		}

	}

	// 보낸 메시지 화면 output
	function showGreeting(data) {
		
		var $msg_container_base = $('.msg_container_base');
		var $inquire_container = $('<div class="inquire_container">');
		var $base_sent = $('<div class="row msg_container base_sent">');
		var $col = $('<div class="col-xs-10 col-md-10">');
		var $message = $('<div class="messages msg_sent" style="word-wrap: break-word; white-space:pre-line;">');
		var $pre = $('<span style="word-wrap: break-word; white-space:pre-line;">');
		var $timeData = $('<time>');
		var $avatar = $('<div class="col-md-2 col-xs-2 avatar">');
		var $img = $('<img src="http://www.bitrebels.com/wp-content/uploads/2011/02/Original-Facebook-Geek-Profile-Avatar-1.jpg" class=" img-responsive ">');
		var date = new Date(data.inquire_sendDate).toLocaleString();
		var $div = $('<div class="inquire_option">');

		$base_sent.append(
				$col.append($message.append($pre.text(data.inquire_content))
						.append($timeData.text(data.inquire_sender_index + ":"+ date)
								))).append($avatar.append($img));

		$div.html('<div style="display: block; color: skyblue;"><span style="float: left;">첨부한 파일</span><div id="void" style="display: inline-block; width: 270px;"></div><span>수정</span><span style="display : none;">수정 완료</span><span style="display : none;">답변 확인</span><span style="display : none;">숨기기</span><span style="float: right;">삭제</span></div>');
		/* $inquire_container.append($base_sent).append($div); */
		$msg_container_base.append($inquire_container.append($base_sent).append($div));		
		
		scrollDown();
		
		
		
		// $("#greetings").append("<tr><td>" + data.sender+" : "+ data.content + " | " + new Date(data.sendDate).toLocaleString() + "</td></tr>");
	}
	
	$(document).on("mouseenter", '.inquire_option span', function(){
		$(this).css('cursor', 'pointer');
	});
	
		$(document).on('click','.inquire_option span:nth-child(3)', function(){		// modifying
			/* var msg = $(this).parent().parent().parent().find('.messages').html();
			var parseMsg = msg.substring(0, msg.indexOf('<time>')); */
			var $loc = $(this);
			
			//$('#chat-area').val(parseMsg);
			$('#chat-area').val($(this).parents('.inquire_container').find('span').eq(0).text()).focus();
			$('#btn-chat').css('display', 'none');
			$(this).parent().children('#void').text('esc : 수정취소').css({'font-size':'3px', 'text-align':'center', 'color' : 'red'});
			$(this).parent().children(':last').css('display', 'none');
			$(this).css('display', 'none');
			$(this).parent().children(':nth-child(4)').css('display', 'inline-block');
			
			$('#chat-area').keydown(function(e) {
				if (e.keyCode == 27) {		// esc 버튼
					$('#btn-chat').css('display', 'block');
					$loc.parent().children(':last').css('display', 'inline-block');
					$loc.css('display', 'inline-block');
					$loc.parent().children(':nth-child(4)').css('display', 'none');
					$('.inquire_option span').parent().children('#void').text(null);
					$('#chat-area').val(null);
				}
			}).off('keydown');
			
		});	
	
		$(document).on('click','.inquire_option span:nth-child(4)', function(){		// modified
			$('#btn-chat').css('display', 'block');
			$(this).parents(".inquire_container").find('span').eq(0).text($('#chat-area').val());
			$('#chat-area').val(null);
			$(this).parent().children('#void').text(null);
			$(this).parent().children(':last').css('display', 'inline-block');
			$(this).css('display', 'none');
			$(this).parent().children(':nth-child(3)').css('display', 'inline-block');
			
			$('#chat-area').keydown(function(e) {
				if (e.keyCode == 13) {			
					if (e.ctrlKey)  $(this).val(function(i, val) {return val + "\n";});
					else if (e.shiftKey) return $(this).val();
					else {
						sendMsg();
						$('#chat-area').val(null);
						$('.upload-name').val('파일 선택');
						$('.upload-thumb-wrap').empty();
						return false;
					}
				}
			});
		});
		

	$(document).on("click",".inquire_option span:last-child",function() { // 삭제
		c =  confirm("정말 삭제하시겠습니까?");
		if(c==true) $(this).parents('.inquire_container').remove();
		else return false;
    });
	
	$(document).on('click', '.panel-heading span.icon_minim', function(e) {
		var $this = $(this);
		if (!$this.hasClass('panel-collapsed')) {
			$this.parents('.panel').find('.panel-body').slideUp();
			$this.addClass('panel-collapsed');
			$this.removeClass('glyphicon-minus').addClass('glyphicon-plus');
		} else {
			$this.parents('.panel').find('.panel-body').slideDown();
			$this.removeClass('panel-collapsed');
			$this.removeClass('glyphicon-plus').addClass('glyphicon-minus');
		}
	});

	$(document).on('focus','.panel-footer input.chat_input',function(e) {

		var $this = $(this);
		if ($('#minim_chat_window').hasClass('panel-collapsed')) {
			$this.parents('.panel').find('.panel-body').slideDown();
			$('#minim_chat_window').removeClass('panel-collapsed');
			$('#minim_chat_window').removeClass('glyphicon-plus')
					.addClass('glyphicon-minus');
		}
	});

	
	
			var fileTarget = $('.filebox .upload-hidden');
	
			fileTarget.on('change', function() {
				if (window.FileReader) {
				// 파일명 추출
				var filename = $(this)[0].files[0].name;
				} else {
				// Old IE 파일명 추출
				var filename = $(this).val().split('/').pop().split('\\').pop();
				};
				$(this).siblings('.upload-name').val(filename);
			});
	
			//preview image 
			var imgTarget = $('.preview-image .upload-hidden');
	
			imgTarget.on('change', function() {
			var parent = $(this).parent();
			
			parent.children('.upload-display').remove();
	
			if (window.FileReader) {
			//image 파일만
			if (!$(this)[0].files[0].type.match(/image\//))
				return;
	
			var reader = new FileReader();
			reader.onload = function(e) {
			var src = e.target.result;

			parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
			
			}
			reader.readAsDataURL($(this)[0].files[0]);
			} else {

				$(this)[0].select();
				$(this)[0].blur();
				var imgSrc = document.selection.createRange().text;
				parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

				var img = $(this).siblings('.upload-display').find('img');
				img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+ imgSrc + "\")";
			}
				});
			
</script>


