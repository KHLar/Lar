$(document).ready(function() {
	// header.jsp
	/*
	 * $('.lectureList').hover(function(){
	 * $('.mega-dropdownmenu').stop().slideDown('fast'); }, function(){
	 * $('.mega-dropdownmenu').stop().slideUp('slow'); });
	 */

	/*
	 * $(".dropdown").hover( function() { $('.mega-dropdownmenu',
	 * this).fadeIn("slow"); }, function() { $('.mega-dropdownmenu',
	 * this).fadeOut("slow");} );
	 */
	if (window.matchMedia("(min-width: 768px)").matches) {
		  $('#lecture-dropdown').attr('data-toggle', '');
		  $('.mega-dropdown .caret').css('display', 'none');
	} else {
		$('#lecture-dropdown').attr('data-toggle', 'dropdown');
		$('.mega-dropdown .caret').css('display', '');
	}
	
	$(window).resize(function() {
		if (window.matchMedia("(min-width: 768px)").matches) {
			  $('#lecture-dropdown').attr('data-toggle', '');
			  $('.mega-dropdown .caret').css('display', 'none');
		} else {
			$('#lecture-dropdown').attr('data-toggle', 'dropdown');
			$('.mega-dropdown .caret').css('display', '');
		}
	});
	
	// mypage.jsp
	
	$('.star').on('click', function() {
		$(this).toggleClass('star-checked');
	});

	$('.ckbox label').on('click', function() {
		$(this).parent('tr').toggleClass('selected');
	});

	$(".myTab a").click(function(e) {
		e.preventDefault();
		$(this).tab("show");
	});
	
	$('.deleteWishList').on('click', function() {
		$('.deleteCkbox').css('display', '');
		$('.deleteWishList').css('display', 'none');
		$('.cancelDeleteWishList').css('display', '');
	});
			
	$('.cancelDeleteWishList').on('click', function() {
		$('.deleteCkbox').css('display', 'none');
		$('.deleteWishList').css('display', '');
		$('.cancelDeleteWishList').css('display', 'none');
	});
	
	//dk
	// lecture.jsp
	 $(".lectureView").on("click", function(){
       var bindex =$(this).siblings(".my_boardLecture_index").val();
       var index =$(this).siblings(".my_lecture_index").val();
       
       location.href = "/lar/lectureBoardView?index="+index+"&bindex="+bindex;
	 });
	 
	 $("#lectureInsert").on("click", function(){
		 location.href = "/lar/lectureInsert";
	 });
    
	 $("#lectureBoardInsert").on("click", function(){
		 var index = $('#my_lecture_index').val();
		 location.href = "/lar/lectureBoardInsert?index="+index;
	 });
    
	 $(".lecturedelete").on('click', function(){
		 var index = $(this).siblings('.index').val();
		 location.href = "/lar/lectureDelete?index="+index;
	 });
	 
	 $("#lectureUpdate").on("click", function(){
		 var index = $('#index').val();
		 location.href = "/lar/lectureUpdate?index="+index;
	 });
	 
	/* $("#lecture-dropdown").on("click", function(){
		 location.href = "/lar/lectureList";
	 });*/
});