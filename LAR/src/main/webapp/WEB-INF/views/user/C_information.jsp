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
<script>
function infoValidate() {
	reg_Exp = /^[가-힣a-zA-Z0-9]{2,8}$/;
	NicknameResult = reg_Exp.test($('#transName').val());
	
	reg_Exp = /(01[016789])[-](\d{4}|\d{3})[-]\d{4}$/g;
	phoneResult = reg_Exp.test( $('#myPhone').val());
	if(($('#Phone').css('display')=='none')&&($('#nickname').css('display')!='none')){//닉네임만 보내주기
		console.log('s닉');
		if(($('#transName').val().trim() == null || $('#transName').val().trim() == "")){
			alert('바꿀 닉네임을 입력해주세요')
			return false;
		}else if(idck==0){
			alert('중복체크를 해주세요');
			return false;
		}else if(!NicknameResult){
			alert('닉네임 형식이 올바르지 않습니다.');
			return false;
		}
	}else if(($('#Phone').css('display')!='none')&&($('#nickname').css('display')=='none')){//핸드폰만 보내주기
		console.log('폰');
		if(($('#myPhone').val().trim() == null || $('#myPhone').val().trim() == "")){
			alert('바꿀 비밀번호를 입력해주세요')
			return false;
		}else if (!phoneResult){
			alert('핸드폰 형식이 올바르지 않습니다.');
			return false;
		}
	}else if(($('#Phone').css('display')!='none')&&($('#nickname').css('display')!='none')){//둘다보내주기
		console.log('둘다');
		if(($('#transName').val().trim() == null || $('#transName').val().trim() == "")){
			alert('바꿀 닉네임을 입력해주세요')
			return false;
		}else if(idck==0){
			alert('중복체크를 해주세요');
			return false;
		}else if(($('#myPhone').val().trim() == null || $('#myPhone').val().trim() == "")){
			alert('바꿀 비밀번호를 입력해주세요')
			return false;
		}else if (!phoneResult){
			alert('핸드폰 형식이 올바르지 않습니다.');
			return false;
		}else if(!NicknameResult){
			alert('닉네임 형식이 올바르지 않습니다.');
			return false;
		}
	}
	return true;
}
</script>
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
										data-text="휴대전화" data-type="sms" data-target="${session_user.user_phone}"
										data-vf="1">${session_user.user_phone}</td>
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
						<form action="${pageContext.request.contextPath}/mypage/C_Info" onsubmit="return infoValidate();">
						<input type="hidden" value="${session_user.user_index}" name="userindex"/>
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
										<td class="tleft"><input type="text" id="transName" name="transName"
											class="form-control" placeholder="한,영,숫자로 2~8 글자를 입력"></td>
										<td style="text-align: center;">
											<button type="button" class="btn btn-primary mb-2"
												id="transNameBtn">중복체크</button>
										</td>
								</tr>
								<tr style="display: none" id="Phone">
									<th>Phone</th>
									<td colspan="2">
										<input type="text" class="form-control" name="myPhone" id="myPhone" placeholder="\-\-\ 문자를 포함해서 입력">
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
						</form>
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
				<div class="tab-pane" id="secession">
				
				<div class="contents-box border-box m_b40">
				    <div>
				        <!-- !inner-contents Start -->
				        <p>회원탈퇴 시 주의사항</p>
				        <ul class="">
				            <li class="listSubject">
				                <span style="color:#7a1b18;">회원탈퇴 시 LAR 서비스 내 모든 정보가 삭제되며, 이후 복구가 불가능합니다.</span></li>
				            <li>- 회원탈퇴시 홈페이지 및 유료컨텐츠의 제한됩니다.</li>
				            <li>- 회원가입 시 입력하신 개인정보 및 결제정보 등은 즉시 파기되며 복구하실 수 없습니다.</li>
				            <!--            <li>- 즉시회원탈퇴를 하더라도 사용 중인 소환사명을 즉시 재 생성하실 수 없으며, 최대 10일 정도 기간이 소요될 수 있습니다.</li>-->
				        </ul>
				        <!-- 회원탈퇴 버튼 클릭시 보여주기 -->
				        <div id="out" style="display:none;">
				            <!-- UserBox01 Start -->
				            <h3 class="subtitle type02">회원탈퇴를 위한 계정을 확인 해주세요.</h3>
				            <div class="bg-contents withdraw_table">
				                <table cellspacing="0" class="request member-info">
				                    <caption>즉시 회원탈퇴를 위한 계정 정보</caption>
				                    <colgroup>
				                        <col style="width:20%">
				                        <col style="width:20%">
				                        <col style="width:20%">
				                        <col style="width:20%">
				                        <col style="width:20%">
				                    </colgroup>
				                    <thead>
				                        <tr>
				                            <th scope="col">계정명</th>
				                            <th scope="col">성명</th>
				                            <th scope="col">가입일자</th>
				                            <th scope="col" class="last">잔여 금액</th>
				                            <th scope="col">&nbsp;</th>
				                        </tr>
				                    </thead>
				                    <tbody>
				                        <tr>
				                            <td class="tcenter">${session_user.user_id}</td>
				                            <td class="tcenter">${session_user.user_nickname}</td>
				                            <td class="tcenter">가입 데이터</td>
				                            <td class="tcenter last">구매 내역</td>
				                            <th scope="col"><button class="btn btn-primary" id="getout">즉시 탈퇴</button></th>
				                        </tr>
				                    </tbody>
				                </table>
				            </div>
				        </div>
				        <!--   //회원탈퇴 버튼 -->
				        <div class="btnbox tright">
				            <span class="btn-border type02"><input type="button" value="탈퇴 정보" title="탈퇴 정보" class="btn btn-primary" id="nSend"></span>
				        </div>
				    </div>
				    <!--  !inner-contents End -->
				    <script>
				    $('#nSend').on('click', function() {
						$('#out').toggle();
						$('#nSend').toggle();
					});
				    $('#getout').on('click',function(){
				    	location.href = "${pageContext.request.contextPath}/mypage/getout?userindex="+${session_user.user_index};
				    })
    				</script>
					</div>
				</div>
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