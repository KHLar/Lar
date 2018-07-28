<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.HashMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script src='https://www.google.com/recaptcha/api.js'></script>
<c:import url="/WEB-INF/views/common/_header.jsp">
	<c:param value="정보수정" name="pageTitle" />
</c:import>
<style>
tr {
	vertical-align: text-top;
}

th, td {
	padding: 15px;
}
</style>
</header>
<div class="container-fluid" style="margin-left: 5%;">
	<div class="">
		<div class="col-lg-10 col-md-10 col-sm-10">
			<!-- UserBox01 Start -->
			<h3 class="">회원 정보</h3>
			<div class="tabs" style="width: 100%;">
				<ul class="nav mypageTab nav-tabs" role="tablist"
					style="width: 100%;">
					<li role="presentation" class="active"><a class=""
						href="#Info" id="myLecture" data-toggle="tab">
							&nbsp;&nbsp;&nbsp;내 정보&nbsp;&nbsp;&nbsp; </a></li>
					<li role="presentation"><a class="" href="#Profile_C"
						id="QnAList" data-toggle="tab"> &nbsp;&nbsp;&nbsp;회원정보
							변경&nbsp;&nbsp;&nbsp; </a></li>
					<li role="presentation"><a class="" href="#Password_C"
						id="wishList" data-toggle="tab"> &nbsp;&nbsp;&nbsp;비밀번호
							변경&nbsp;&nbsp;&nbsp; </a></li>
					<li role="presentation" class="pull-right"><a class=""
						href="#secession" id="paymentList" data-toggle="tab">
							&nbsp;&nbsp;&nbsp;화원 탈퇴&nbsp;&nbsp;&nbsp; </a></li>
				</ul>
			</div>
			<div class="mypageBody tab-content">
				<div class="tab-pane active col-lg-12 col-md-12 col-sm-12" id="Info"
					style="width: 100%;">
					<div class="full screen col-lg-4 col-md-4 col-sm-4">
						<p class="inner-photo" id="imageChoose" name="imageChoose">
							<img
								src="https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg"
								id="profile-image1" class="img-circle img-responsive"
								alt="User Pic">
						</p>
					</div>

					<div class="my-photo-message m_t10 col-lg-8 col-md-8 col-sm-8">

						<table cellspacing="0" class="request">
							<tbody>
								<tr>
									<th>닉네임</th>
									<td class="tleft" colspan="2"><span>${session_user.user_nickname}</span></td>
								</tr>

								<tr>
									<th>이메일</th>
									<!-- class="ch_pop_txt" 레이어팝업 생성시 -->
									<td colspan="2">
										<div class="riot-vf--success">
											<span class="riot-vf__icon"></span> ${session_user.user_id}
										</div>
									</td>
								</tr>
								<tr>
									<th>휴대전화</th>
									<td class="tleft riot-vf riot-vf--mobile" colspan="2"
										data-text="휴대전화" data-type="sms" data-target="010-6501-0280"
										data-vf="1">휴대전화</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>


				<div class="tab-pane col-lg-12 col-md-12 col-sm-12" id="Profile_C"
					style="width: 100%;">

					<div class="full screen col-lg-4 col-md-4 col-sm-4">
						<p class="inner-photo" id="imageChoose" name="imageChoose">
							<img
								src="https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg"
								id="profile-image1" class="img-circle img-responsive"
								alt="User Pic">
						</p>
						<div style="text-align: center;">
							<button type="button" class="riot-btn btn-lg">이미지 변경</button>
						</div>
					</div>
					<div class="col-lg-8 col-md-8 col-sm-8">

						<table class="request">
							<tbody>

								<tr>
									<th>닉네임</th>
									<td class="tleft"><span>${session_user.user_nickname}</span></td>
									<td style="text-align: center;">
										<button type="button" class="btn btn-primary mb-2"
											id="nicknameBtn">닉네임 수정</button>
									</td>
								</tr>
								<tr>
									<th>이메일</th>
									<!-- class="ch_pop_txt" 레이어팝업 생성시 -->
									<td class="tleft riot-vf riot-vf--email" data-type="email"
										data-text="이메일" data-target="${session_user.user_id}"
										data-vf="1">${session_user.user_id}<!--
                                            <p class="riot-vf__message">
                                                <div class="riot-vf__message--success">인증받은 이메일입니다.</div>
                                            </p>
-->
									</td>
								</tr>
								<tr>
									<th>
										<p class="innerTxt">
											<span>휴대전화</span>
										</p>
									</th>
									<td class="tleft riot-vf riot-vf--mobile" data-text="휴대전화"
										data-type="sms" data-target="${session_user.user_phone}"
										data-vf="1">${session_user.user_phone}<!--
                                            <p class="riot-vf__message">
                                                <div class="riot-vf__message--success">인증받은 휴대전화입니다.</div>
                                            </p>-->
									</td>
									<td><button type="button" class="btn btn-primary mb-2"
											id="phoneBtn">휴대전화 수정</button></td>
								</tr>
								<script>
									$('#phoneBtn').on('click', function() {
										$('#Phone').toggle();
										hideSubmitBtn();
									});
									console.log($('#Phone').toggle());
									$('#nicknameBtn').on('click', function() {
										$('#nickname').toggle();
										hideSubmitBtn();
										
									});
									
									function hideSubmitBtn(){
										if($('#Phone').css('display') != 'none' || $('#nickname').css('display') != 'none'){
											$('#submitline').show();
										} else {
											$('#submitline').hide();
										}
									}
									
								</script>
								<tr style="display: none" id="nickname">
									<th>Nickname</th>
									<form action="#">
										<td class="tleft"><input type="text" id="transName"
											class="form-control" value=""></td>
										<td style="text-align: center;">
											<button type="button" class="btn btn-primary mb-2"
												id="transNameBtn">중복체크</button>
										</td>
									</form>
								</tr>
								<tr style="display: none" id="Phone">
									<th>Phone</th>
									<td colspan="2">
										<form name="phoen">
											<input type="text" class="form-control">
										</form>
									</td>
									<td style="text-align: center;"></td>
								</tr>
								<tr id="submitline" style="display: none">
									<td></td>
									<td><button type="submit" class="btn btn-primary mb-2">저장</button></td>
									<td><button type="cancel" class="btn btn-primary mb-2">취소</button></td>
								</tr>


							</tbody>
						</table>
					</div>

				</div>
				<div class="tab-pane" id="Password_C"
					style="text-align: -webkit-center; width =: 340px; margin: auto; width: 100%;">
					<table>
						<form action="resetpasswrod" method="post"
							onsubmit="return input_check_func()">
							<tr>
								<th>현재 비밀번호</th>
								<td class="tleft"><input type="password" class="medium"
									title="현재 비밀번호를 입력하세요" id="now_pw" name="now_pw"
									style="width: 300px;"></td>
							</tr>
							<tr>
								<th>새 비밀번호</th>
								<td class="tleft">
									<div>
										<input type="password" class="medium" title="새 비밀번호를 입력하세요"
											style="width: 300px;" id="change_pw" name="change_pw">
									</div> <!-- <span style="color:red;" class="infomation">영어 대문자, 소문자, 숫자, 특수문자가 한개 이상 들어간 8~20 글자를 입력하세요.</span> -->
								</td>
							</tr>
							<tr>
								<th>새 비밀번호 확인</th>
								<td class="tleft">
									<div>
										<input type="password" class="medium" title="새 비밀번호 다시 입력하세요"
											style="width: 300px;" id="change_pw_check"
											name="change_pw_check">
									</div>
									<div style="margin-top: 20px;">
										<span style="color: red;" class="infomation">* 확인을 위해
											입력하신 비밀번호를 다시 한번 입력해 주세요.</span>
									</div>
								</td>
							</tr>
							<tr class="end">
								<th style="vertical-align: middle;">자동입력방지</th>
								<td class="tleft">
									<div class="g-recaptcha"
										data-sitekey="6Le6gGYUAAAAAM3qcpKGxZWRl_fNrmCWf0HTOydu"></div>
								</td>
							</tr>
						</form>
					</table>
					<div style="padding-top: 50px;">
						<button type="submit" class="btn btn-primary"
							style="height: 50px; width: 100px;"id="PasswordSubmit">저장</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="cancel" class="btn btn-primary"
							style="height: 50px; width: 100px;">취소</button>
					</div>
				</div>
				<div class="tab-pane active" id="secession"></div>
			</div>
		</div>
		<script type="text/javascript">
		$(function(){
			//PasswordSubmit 버튼을 클릭 했을 때 
			
			var userIndex=${session_user.user_index};
			
			$("#PasswordSubmit").click(function(){
				var userpassword = $('#now_pw').val();
				var change_pw = $('#change_pw').val();
				var change_pw_check = $('#change_pw_check').val();
				var pwCheck =false;
				console.log(change_pw);
				console.log(change_pw_check);
				console.log(userpassword);
				/* 새로운 비밀번호1 가 같은지2 확인 하고 같다면 값을 넘겨주고 같지 않다면 같은 비밀번호를 입력 하라고 보여주기 */
				if(userpassword==""){
					alert("비밀번호를 입력해주세요");
				}else{
					$.ajax({
						async : false,
						type : 'POST',
						data : {"userpassword" : userpassword,
							"userindex" : userIndex
						},
						url : "${pageContext.request.contextPath}/mypage/PasswordCheck",
						dataType : "json",
						success : function(data) {
							if (data == 0) {
								alert("비밀번호가 같지 않습니다. 확인하시고 이용해주세요");
								pwCheck=false;
							} else {
								alert("비밀번호 같습니다.");
								pwCheck=true;
								}
							},
								error : function(error) {
									alert("error : " + error);
							}
						});
					}
			console.log(pwCheck);
			if(pwCheck){
				 if(change_pw == change_pw_check){
					$.ajax({
						async : false,
						type : 'POST',
						data : {"change_pw" : change_pw,
							"userindex" : userIndex
						},
						url : "${pageContext.request.contextPath}/mypage/PasswordChange",
						dataType : "json",
						success : function(data) {
							if (data == 0) {
								alert("비밀번호 변경 실패!");
							} else {
								alert("비밀번호 변경 성공!");
								}
							},
								error : function(error) {
									alert("error : " + error);
							}
						});
				}else{
					alert("비밀번호가 같지 않습니다.");
				} 
				
			}
				
			
			});
		});
		</script>
		<script type="text/javascript">
			function email_change() {
				if (document.join.email.options[document.join.email.selectedIndex].value == '9') {
					document.join.email2.disabled = false;
					document.join.email2.value = "";
					document.join.email2.focus();
				} else {
					document.join.email2.disabled = true;
					document.join.email2.value = document.join.email.options[document.join.email.selectedIndex].value;
				}
			}
		</script>
		<script type="text/javascript">
			//아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
			var idck = 0;
			$(function() {
				//idck 버튼을 클릭했을 때 
				$("#transNameBtn")
		 			.click(
						function() {

				//userid 를 param.
					var userid = $("#transName").val();

					$.ajax({
						async : false,
						type : 'POST',
						data : {"userid" : userid},
						url : "${pageContext.request.contextPath}/mypage/infoTrans",
						dataType : "json",
						success : function(data) {
							if (data.cnt > 0) {
								alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
							} else {
								alert("사용가능한 아이디입니다.");
								idck = 1; }
							},
								error : function(error) {
									alert("error : " + error);
							}
						});
					});
				});
		</script>
		
		<c:import url="/WEB-INF/views/common/_footer.jsp" />