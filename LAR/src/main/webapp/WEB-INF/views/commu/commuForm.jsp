<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
<!--  <script src="https://code.jquery.com/jquery-3.3.1.js"></script> -->
<%--<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.12.2.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>--%>
<c:import url="/WEB-INF/views/common/_header.jsp">
   <c:param value="장바구니" name="pageTitle" />
</c:import>

</header>

<div class="container-fluid">
   <div class="row">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
   href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.css"
   rel="stylesheet">
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.js"></script>
   <script> 

function validate(){
    var content = $("#commu_Content").val();
   if(content.trim().length==0){
      alert("내용을 입력하세요");
      return false;
   } 
   if($('#commu_Writer_Index').val()==""||$('#commu_Writer_Index').val()==null){
      alert('로그인 먼저해주세요^^');
      return false;
   }
   return true;
}

/*부트스트랩 : file 변경시 파일명 보이기 */
$(function(){
   $('[name=upFile]').on('change',function(){
       var fileName = $(this).prop('files')[0].name;//파일명
       console.log($(this).val());
       $(this).next('.custom-file-label').html(fileName);
   });
   
});
</script>
<c:set var="req" value="" />
<c:if test="${commu_Category_Index eq 'B03'}">
<c:set var="req" value="required" />
</c:if>
<%-- <% 
String aa=(String) request.getParameter("bb");
String commu_Category_Index = (String)request.getParameter("commu_Category_Index");
System.out.println(commu_Category_Index);
System.out.println(aa);
String re="";
if(commu_Category_Index.equals("B03"))
<<<<<<< HEAD
	re="required";
=======
   re="required";
>>>>>>> refs/remotes/origin/ny_branch

%> --%>
</head>
<body>


   <div class="container col-lg-10 col-md-10 col-sm-10">
         <div class="blog-heading">
            <h3 class="text-capitalize">게시판 글쓰기</h3>
         </div>
         <br>
         <br>
         <form name="commuFrm" action="${pageContext.request.contextPath}/commu/commuFormEnd" method="POST" onsubmit="return validate();" enctype="multipart/form-data">
                    <div class="col-lg-2 col-md-2 col-sm-2" style="text-align:center;">
                        <div class="form-group">
                            <label>글 제목</label>
                        </div>
                        <br>
                        <div class="form-group">
                            <label>첨부파일</label>
                        </div>
                        <br>
                        <div class="form-group">
                            <label>글 내용</label>
                        </div>
                    </div>
                    <div class="col-lg-10 col-md-10 col-sm-10" style="border-right: none; padding-right : 0%;">
                        
                    <div class="form-group">
                      <input type="text" class="form-control" id="commu_Title" name="commu_Title" placeholder="title">
                    </div>
                    <div class="form-group">
                        <div class="custom-file">
                          <input type="file" class="custom-file-input" name="upFile" id="upFile" multiple ${req }>
                        </div>
                      </div>
                     <div class="form-group">
                        <div id="summernote"></div>
                   </div>
                     
                </div>
                <div class="col-lg-11 col-md-11 col-sm-11"></div>
                <div class="col-lg-1 col-md-1 col-sm-1" style="text-align: right">
                    <button type="submit" class="btn btn-primary" onclick="funcNote();">작성완료</button>
                </div>
                
                <input type="hidden" id="commu_Category_Index" name="commu_Category_Index" value="${commu_Category_Index}" />
                <input type="hidden" id="commu_Content" name="commu_Content">
               <input type="hidden" id="commu_Writer_Index" name="commu_Writer_Index" value="${session_user.user_index}">
            </form>
            
   <script>
      $('#summernote').summernote({
        placeholder: 'Hello bootstrap 4',
        tabsize: 2,
        height: 300
      });
      function funcNote(){
          document.getElementById("commu_Content").value=$('#summernote').summernote('code');
          //alert(document.getElementById("commu_Content").value);
      }
    </script>

   </div>
   
</body>

</html>
<c:import url="/WEB-INF/views/common/_footer.jsp" />