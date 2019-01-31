<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>야보자</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Bootstrap Core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

 <!-- Theme CSS -->
<!-- <link href="css/clean-blog.min.css" rel="stylesheet"> -->

<!-- Custom Fonts -->
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>



<!-- Menu Bar -->
<link href="css/menubar.css" rel="stylesheet">
<!-- Content -->
<link href="css/index_content.css" rel="stylesheet">
<!-- jQuery -->
	<script src="vendor/jquery/jquery.min.js"></script>
	
	

	
	
<script type="text/javascript">

function loadMovie(){
	
$.ajax({
		
		url: "loadMovie.do",
		cache: false,
		success: function(text){
			
			if(text.trim()=="ok"){
				document.getElementById("ok").innerHTML="ok"
			}
			
		},
		error:function(){
			
		}
    });
	
}

String.prototype.trim = function () { //trim
	
    return this.replace(/^\s+|\s+$/g, "");

}

</script>



</head>

<body>


	<!-- Navigation -->
	<%@ include file="../inc/topbar.jsp"%>


	<!-- Menu Bar -->
	<nav class="nav2" style="margin-top: 60px; margin-bottom: 20px;">
		<!-- 메뉴바 -->
		<a href=""><strong>Movie Board</strong></a> <a href=""><strong>Matching
				Board</strong></a> <a href=""><strong>Review Board</strong></a> <a href=""><strong>Q&A
				Board</strong></a> <a href=""><strong>My Page</strong></a>
		<div class="nav-underline"></div>
	</nav>
	
	<!-- moviesidebar -->
	<%@ include file="../inc/moviesidebar2.jsp"%>
	
	
	<!-- 영화매칭관련 페이지들 소스는 여기부터 작성!! -->
	
	<!-- Movie List -->
	<br/>
	<br/>
	
	<h3 class="text-center">종영작</h3>
	
	<%@ include file="../inc/endmovielist.jsp"%>
	
	
	<center>
	<input type="button" value="개봉작 저장" onClick="loadMovie();"/>
	<p id="ok"></p>
	</center>
	

	<!-- Footer -->
	<%@ include file="../inc/footer.jsp"%>

	

</body>

</html>
