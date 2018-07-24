<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>

<head>
    <%-- <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.12.2.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> --%>
<script
	src="${pageContext.request.contextPath}/resources/js/tagInput.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/tagInput.css" />
	
<c:import url="/WEB-INF/views/common/_header.jsp">
	<c:param value="커뮤니티" name="pageTitle" />
</c:import>
<style>
span{
	font-size:15pt;
}
.commuTitle{
	font-size:30pt;
	
}
.commuContent{
	font-size:15pt;
}
textarea{
	resize:none;
}
</style>
<script>
	
	$(function() {
		$('#accordion').html('${commu.commu_Content}');

		$('#commuDelete').click(function(){
			location.href="${pageContext.request.contextPath}/commu/commuDelete/"+${commu.commu_Index}
		});
		 $('#commuReply').click(function(){
			 /* $.ajax({
					method : "POST",
					url : "${pageContext.request.contextPath}/commu/commuReply",
					dataType : "JSON",
					data : {replyWriter:${m.user_Index},replyContent:$('#replyComment').val()},
					error : function(){alert('error');}
					
				}); */
			if($('#replyComment').val().trim()==null||$('#replyComment').val().trim()==""){
				alert('내용을 입력하세요');
				}
			else
				location.href="${pageContext.request.contextPath}/commu/commuReply?replyWriter="+${session_user.user_index}+"&replyContent="+$('#replyComment').val()+"&commuIndex="+${commu.commu_Index};
					
			});
		 function replyDelete(s) {
			 location.href="${pageContext.request.contextPath}/commu/commuReplyDelete?commu_Reply_Index="+s;
				alert( s);
			}
			/* $('.commuReply_Reply').click(function(){
				if($('#Comment${cr.commu_Reply_Index}').val().trim()==null||$('#Comment${cr.commu_Reply_Index}').val().trim()==""){
				}
			else
				location.href="${pageContext.request.contextPath}/commu/commuReply_Reply?replyWriter="+${m.user_Index}+"&replyContent="+$('#Comment${cr.commu_Reply_Index}').val()+"&commuIndex="+${commu.commu_Index};
				
			}); */
		}); 
function fileDownload(oName, rName){
	   //한글파일명이 있을 수 있으므로, 명시적으로 encoding
	   oName = encodeURIComponent(oName);
	   location.href="${pageContext.request.contextPath}/commu/fileDownload?oName="+oName+"&rName="+rName;
	}

</script>
    
</head>

<body>
</header>

<div class="container-fluid">
	<div class="row">
	
    <div class="container_fluid  col-lg-10 col-md-10 col-sm-10">
        <div class="blog-heading">
            <h3 class="text-capitalize">&nbsp;&nbsp;게시판 글보기 
             <c:if test="${session_user.user_index eq commu.commu_Writer_Index}">
            <button type="button" class="btn btn-danger pull-right" id="commuDelete">글삭제</button>
            </c:if>
            </h3>
            
        </div>
        <br>
        <br>
        <br>
        <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div style="text-align: left;">
                    <p class="commuTitle">${commu.commu_Title}</p>
                    <c:forEach items="${attachmentList}" var="a" varStatus="vs">
      <button type="button" style=" width:auto; height:auto; "
            class="btn btn-outline-success btn-warning pull-right"
            onclick="fileDownload('${a.commu_Attach_Originfilename}','${a.commu_Attach_Renamedfilename }');">
         첨부파일 - ${a.commu_Attach_Originfilename }
      </button>
   </c:forEach>
                      <!--  <div style="text-align: right;">
                        <br /><br />
                            <span class="bg-warning">${commu.commu_Writer}</span>&nbsp;&nbsp;
                        <span class="bg-warning">${commu.commu_Update_Date}</span>&nbsp;&nbsp;
                        <span class="bg-warning">${commu.commu_Hits}</span>
                        </div>
                       -->
                        <ul style="list-style:none; ">
                        <li style="text-align: left;">
                    <!-- Tag입니다. 건들지 마요 -_- -->
                        <div class="bootstrap-tagsinput form-group">
							<div class="tags" id="tags">
							<c:forTokens items="${commu.commu_tags}" var="tag" delims=",">
								<a class="bg-warning labelinput" style="color: yellow;">#${tag}</a>
							</c:forTokens>
							</div>
						</div>
					<!-- Tag입니다. 건들지 마요 -_- -->
						</li>
                        <li style="text-align: right;"><span class="bg-warning">${commu.commu_Writer}</span>&nbsp;&nbsp;
                        <span class="bg-warning">${commu.commu_Update_Date}</span>&nbsp;&nbsp;
                        <span class="bg-warning">${commu.commu_Hits}</span></li>
                        </ul>                      
                    </div>
                </div>
                
                <!-- .panel-heading -->
                <div class="panel-body" style="height:300px">
                    <div class="panel-group" id="accordion">
                        <p style="font-size:15pt">${commu.commu_Content}</p>
                    </div>	
                </div>
                <!-- .panel-body -->
            </div>
        </div>
        <br>
        <div class="col-lg-12 col-md-12 col-sm-12" style="padding:100px 0 0 50px">        
            <div class="row">
                <div class="col-md-10">
                    <textarea name="replyComment" id="replyComment" class="form-control" rows="3" required="required" placeholder="Type here message"></textarea>
                </div>
                <div class="col-md-2">
                    <button class="btn btn-primary" id="commuReply">댓글달기</button>
                </div>
            </div>
            <h3><span style="color:red">${commuReply.size()}</span> 개의 Comment</h3>
            <c:forEach items="${commuReply}" var="cr">
            <form action="${pageContext.request.contextPath}/commu/commuReplyReply" method="POST" >
            <div class="row">
                <input type="hidden" name="commu_Reply_Parent_Index" value="${cr.commu_Reply_Parent_Index}"/>
                <input type="hidden" name="commu_Reply_Writer_Index" value="${session_user.user_index}" />
                <input type="hidden" name="commu_Reply_Commu_Index" value="${cr.commu_Reply_Commu_Index}" />
                <input type="hidden" name="commu_Reply_Order_Index" value="${cr.commu_Reply_Order_Index}" />
                <input type="hidden" name="commu_Reply_Depth_Index" value="${cr.commu_Reply_Depth_Index}" />
                <div class="col-md-8">
                	
                    <div class="panel panel-default" style="margin-left:${cr.commu_Reply_Depth_Index*20}px;"> 
                    <c:if test="${cr.commu_Reply_Depth_Index!=1}">
                    	<img src="${pageContext.request.contextPath}/resources/images/ARROW.PNG" style="width:20px; height:20px; display: inline-block;"/>
                    </c:if>
                        <span style="font-size:16px">${cr.commu_Reply_Content}</span>
                        <p class="commentHelp" >&nbsp;&nbsp;&nbsp;${cr.commu_Reply_Writer} | ${cr.commu_Reply_Update_Date } | 신고</p>                        
                    </div>
                </div>
                
                <div class="col-lg-4 col-md-4 col-sm-4" >
                    <c:if test="${cr.commu_Reply_Writer_Index eq session_user.user_index}">
                    <%-- <button class="btn btn-danger" data-toggle="collapse" data-target="#modify${cr.commu_Reply_Index}">수정</button> --%>
                    <button class="btn btn-danger" class="replyDelete" onclick="location.href='${pageContext.request.contextPath}/commu/commuReplyDelete?commu_Reply_Index=${cr.commu_Reply_Index}'" >삭제</button>
                    </c:if>
                    <c:if test="${cr.commu_Reply_Is_Deleted eq 0 }">
                    <button class="btn btn-primary" data-toggle="collapse" data-target="#reply${cr.commu_Reply_Index}">댓글달기</button>
                    </c:if>
                </div>
            </div>
            <div class="row">
                <div id="reply${cr.commu_Reply_Index}" class="collapse">
                    <div class="col-md-8">
                        <textarea name="commu_Reply_Content" id="Commentreply${cr.commu_Reply_Index}" class="form-control" rows="3" required="required" placeholder="Type here message" style="margin-left:${cr.commu_Reply_Depth_Index*20}px;"></textarea>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4">
                        <button type="submit" class="btn btn-primary commuReply_Reply" >댓글등록</button>
                    </div>
                </div>
            </div>
            
           <br>
           </form>
      </c:forEach>
  
       </div>
    </div>
</div>
</div>
</body>

</html>
<c:import url="/WEB-INF/views/common/_footer.jsp" />