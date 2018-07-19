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

	// cart.jsp
	$(".selectPurchase").on('click', function() {
		location.href = "/lar/user/purchase";
	});

	$(".allPurchase").on('click', function() {
		location.href = "/lar/user/purchase";
	});
});