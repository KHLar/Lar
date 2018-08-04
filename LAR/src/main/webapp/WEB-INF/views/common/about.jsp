<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<c:import url="/WEB-INF/views/common/_header.jsp">
   <c:param value="About" name="pageTitle" />
</c:import>

</header>

<!-- !important. div[class=container-fluid] ~ div[class=col-md-10 col-sm-10] -->
<div class="container-fluid">
   <div class="row">
      <div class="col-lg-10 col-md-10 col-sm-10">
         <div class="row">
            <div class="col-lg-12 text-center">
               <h2 class="section-heading">About</h2>
               <h2 class="section-subheading text-muted"
                  style="margin-bottom: 75px;">왜 미숫가루 인가?</h2>
            </div>
         </div>
         <div class="row">
            <div class="col-lg-12">
               <ul class="timeline">
                  <li>
                     <div class="timeline-image">
                        <img class="img-circle img-responsive"
                           src="${pageContext.request.contextPath}/resources/images/grain_powder.jpeg"
                           alt="">
                     </div>
                     <div class="timeline-panel">
                        <div class="timeline-heading">
                           <h2>미숫가루인 이유</h2>
                           <h4 class="subheading">변비가 심한 조원들</h4>
                        </div>
                        <div class="timeline-body">
                           <p class="text-muted">다양한 곡물들이 풍부한 식이섬유들이 가루로 되는 과정에서 소화가
                              용이한 형태로 변형이 되어 장운동 활성화 뿐만 아니라 변비를 개선하는데도 뛰어난 효과가있어 조원들이 자주
                              마신다.</p>
                        </div>
                     </div>
                  </li>
                  <li class="timeline-inverted">
                     <div class="timeline-image">
                        <img class="img-circle img-responsive"
                           src="${pageContext.request.contextPath}/resources/images/grain_powder2.jpeg"
                           alt="">
                     </div>
                     <div class="timeline-panel">
                        <div class="timeline-heading">
                           <h2>미숫가루 효능</h2>
                           <h4 class="subheading">기력이 부족한 조원들</h4>
                        </div>
                        <div class="timeline-body">
                           <p class="text-muted">풍부한 곡물들의 탄수화물 성분으로 열량을 보충하고 에너지 생성에
                              도움을 주어 기력회복하는데 큰 효과가 있다고 하고 미숫가루의 따뜻한 성질은 신진대사를 비롯해 혈액순환 촉진에
                              도움을 주어 냉증 을 개선하는데도 이로운 작용을 한다고 하여 조원들이 자주 마신다.</p>
                        </div>
                     </div>
                  </li>
                  <li>
                     <div class="timeline-image">
                        <img class="img-circle img-responsive"
                           src="${pageContext.request.contextPath}/resources/images/grain_powder3.jpeg"
                           alt="">
                     </div>
                     <div class="timeline-panel">
                        <div class="timeline-heading">
                           <h2>미숫가루 예방</h2>
                           <h4 class="subheading">건강 생각 하는 조원들</h4>
                        </div>
                        <div class="timeline-body">
                           <p class="text-muted">미숫가루에 들어있는 불포화지방산이 혈중 콜레스테롤 수치를 낮춰주고,
                              혈관 속 유해한 노폐물과 찌꺼기 배출에 큰 도움을 주어 혈행을 개선하는데도 좋다고 하고 이렇게 혈관건강 증진돰에
                              따라 동맹경화를 비롯한 고혈압들의 혈관질환들을 예방하는데도 좋다고 하여 조원들이 자주 마신다.</p>
                        </div>
                     </div>
                  </li>
                  <li class="timeline-inverted">
                     <div class="timeline-image">
                        <img class="img-circle img-responsive"
                           src="${pageContext.request.contextPath}/resources/images/grain_powder4.jpg"
                           alt="">
                     </div>
                     <div class="timeline-panel">
                        <div class="timeline-heading">
                           <h2>궁극적 이유</h2>
                           <h4 class="subheading">다이어트</h4>
                        </div>
                        <div class="timeline-body">
                           <p class="text-muted">미숫가루의 칼로리는 100g 기준 약 350칼로리 정도에 풍부한
                              식이섬유로 포만감이 쉽게 생겨 다이어트에 효과적 이며, 풍부한 비타민과 여러 미네랄 성분들의 균형있는 영양공급을
                              통해 다이어트 시에 식사대용으로 드셔도 될 만큼 건강한 체중관리에 도움이 된다고 하여 자주마신다.</p>
                        </div>
                     </div>
                  </li>
               </ul>
            </div>
            <div class="container">
               <div class="row">
                  <div class="col-lg-12 text-center">
                     <h2 class="section-heading text-uppercase">misoot Team</h2>
                     <h3 class="section-subheading text-muted">우리는 미숫가루</h3>
                  </div>
               </div>
               <div class="row">
                  <div class="col-sm-4">
                     <div class="team-member">
                        <img class="mx-auto rounded-circle" src="img/team/1.jpg" alt="">
                        <h4>김낙용</h4>
                        <p class="text-muted">Lead Designer</p>
                        <ul class="list-inline social-buttons">
                           <li class="list-inline-item"><a href="#"> <i
                                 class="fa fa-twitter"></i>
                           </a></li>
                           <li class="list-inline-item"><a href="#"> <i
                                 class="fa fa-facebook"></i>
                           </a></li>
                           <li class="list-inline-item"><a href="#"> <i
                                 class="fa fa-linkedin"></i>
                           </a></li>
                        </ul>
                     </div>
                  </div>
                  <div class="col-sm-4">
                     <div class="team-member">
                        <img class="mx-auto rounded-circle" src="img/team/2.jpg" alt="">
                        <h4>박수현</h4>
                        <p class="text-muted">Lead Marketer</p>
                        <ul class="list-inline social-buttons">
                           <li class="list-inline-item"><a href="#"> <i
                                 class="fa fa-twitter"></i>
                           </a></li>
                           <li class="list-inline-item"><a href="#"> <i
                                 class="fa fa-facebook"></i>
                           </a></li>
                           <li class="list-inline-item"><a href="#"> <i
                                 class="fa fa-linkedin"></i>
                           </a></li>
                        </ul>
                     </div>
                  </div>
                  <div class="col-sm-4">
                     <div class="team-member">
                        <img class="mx-auto rounded-circle" src="img/team/3.jpg" alt="">
                        <h4>박재은</h4>
                        <p class="text-muted">Lead Developer</p>
                        <ul class="list-inline social-buttons">
                           <li class="list-inline-item"><a href="#"> <i
                                 class="fa fa-twitter"></i>
                           </a></li>
                           <li class="list-inline-item"><a href="#"> <i
                                 class="fa fa-facebook"></i>
                           </a></li>
                           <li class="list-inline-item"><a href="#"> <i
                                 class="fa fa-linkedin"></i>
                           </a></li>
                        </ul>
                     </div>
                  </div>
               </div>
               <div class="col-sm-4">
                  <div class="team-member">
                     <img class="mx-auto rounded-circle" src="img/team/3.jpg" alt="">
                     <h4>이득규</h4>
                     <p class="text-muted">Lead Developer</p>
                     <ul class="list-inline social-buttons">
                        <li class="list-inline-item"><a href="#"> <i
                              class="fa fa-twitter"></i>
                        </a></li>
                        <li class="list-inline-item"><a href="#"> <i
                              class="fa fa-facebook"></i>
                        </a></li>
                        <li class="list-inline-item"><a href="#"> <i
                              class="fa fa-linkedin"></i>
                        </a></li>
                     </ul>
                  </div>
               </div>
               <div class="col-sm-4">
                  <div class="team-member">
                     <img class="mx-auto rounded-circle" src="img/team/3.jpg" alt="">
                     <h4>이주형</h4>
                     <p class="text-muted">Lead Developer</p>
                     <ul class="list-inline social-buttons">
                        <li class="list-inline-item"><a href="#"> <i
                              class="fa fa-twitter"></i>
                        </a></li>
                        <li class="list-inline-item"><a href="#"> <i
                              class="fa fa-facebook"></i>
                        </a></li>
                        <li class="list-inline-item"><a href="#"> <i
                              class="fa fa-linkedin"></i>
                        </a></li>
                     </ul>
                  </div>
               </div>
               <div class="col-sm-4">
                  <div class="team-member">
                     <img class="mx-auto rounded-circle" src="img/team/3.jpg" alt="">
                     <h4>정주은</h4>
                     <p class="text-muted">Lead Developer</p>
                     <ul class="list-inline social-buttons">
                        <li class="list-inline-item"><a href="#"> <i
                              class="fa fa-twitter"></i>
                        </a></li>
                        <li class="list-inline-item"><a href="#"> <i
                              class="fa fa-facebook"></i>
                        </a></li>
                        <li class="list-inline-item"><a href="#"> <i
                              class="fa fa-linkedin"></i>
                        </a></li>
                     </ul>
                  </div>
               </div>
            </div>
</div>
         </div>

   <c:import url="/WEB-INF/views/common/_footer.jsp" />