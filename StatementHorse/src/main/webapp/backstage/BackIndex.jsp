<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="description" content="Xenon Boostrap Admin Panel" />
	<meta name="author" content="" />
	
	<title>Basic</title>

	<link rel="stylesheet" href="assets/css/fonts/linecons/css/linecons.css">
	<link rel="stylesheet" href="assets/css/fonts/fontawesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/xenon-core.css">
	<link rel="stylesheet" href="assets/css/xenon-forms.css">
	<link rel="stylesheet" href="assets/css/xenon-components.css">
	<link rel="stylesheet" href="assets/css/xenon-skins.css">
	<link rel="stylesheet" href="assets/css/custom.css">

	<script src="assets/js/jquery-1.11.1.min.js"></script>

	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	
	
	<!-- icon file ="WebContent/test01/assets/css/fonts/fontawesome/css/font-awesome.css" -->
	<!-- icon file ="WebContent/test01/assets/css/fonts/linecons/css/linecons-codes.css" -->
	<script>
	$(document).ready(
			function() {
				$("#gobutton").click(function(){
					//營收的jquery
// 				$.get("BackStageMgr",{"action":"mgr","stockno":$("#stockNo").val(),"year":$("#yyyy").val(),"month":$("#MM").val()},function(){
// 				console.log("營收更新完成");
// 				})
				$.get("BackStageMgr",{"action":"financialstatements","stockno":$("#stockNo").val(),"year":$("#yyyy").val(),"season":$("#season").val()},function(){
					console.log("財報更新完成");
				})	
				
				})
			
	
			}
	)
	</script>
</head>
<body class="page-body">


	<div class="page-container"><!-- add class "sidebar-collapsed" to close sidebar by default, "chat-visible" to make chat appear always -->

<!-- Add "fixed" class to make the sidebar fixed always to the browser viewport. -->
<!-- Adding class "toggle-others" will keep only one menu item open at a time. -->
<!-- Adding class "collapsed" collapse sidebar root elements and show only icons. -->
		<div class="sidebar-menu toggle-others fixed">
			<div class="sidebar-menu-inner">
	
				<ul id="main-menu" class="main-menu">
	<!-- add class "multiple-expanded" to allow multiple submenus to open -->
	<!-- class "auto-inherit-active-class" will automatically add "active" class for parent elements who are marked already with class "active" -->
					<li class="active">
						<a href="#"><span class="title"><h3><strong>StatementHorse</strong></h3></span></a>					
					</li>
					<li class="opened">
						<a href="#"><i class="linecons-thumbs-up"></i><span class="title">爬蟲程式</span></a>
						<ul>
							<li><a href="#"><i class="linecons-money"></i><span class="title">月營收爬蟲</span></a></li>
							<li><a href="#"><i class="linecons-doc"></i><span class="title">財報收爬蟲</span></a></li>
						</ul>
					</li>
	
	
				</ul>
			</div>
		</div>
		<div class="main-content">
			<nav class="navbar user-info-navbar" role="navigation">
				<ul class="user-info-menu left-links list-inline list-unstyled">
					<li class="hidden-sm hidden-xs">
						<a href="#" data-toggle="sidebar"><i class="fa-bars"></i></a>
					</li>
				
				</ul>
				<ul class="user-info-menu right-links list-inline list-unstyled">
	<!-- You can add "always-visible" to show make the search input visible -->
					<li class="search-form">
						<form method="get" action="#">
							<input type="text" name="s" class="form-control search-field" placeholder="Type to search..." />
							
							<button type="submit" class="btn btn-link">
								<i class="linecons-search"></i>
							</button>
						</form>
					</li>
				</ul>
			</nav>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="stockNo" placeholder="stockNo" maxlength="4">
			</div>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="yyyy" placeholder="yyyy" maxlength="4">
			</div>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="MM" placeholder="MM" maxlength="2">
			</div>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="dd" placeholder="dd" maxlength="2">
			</div>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="season" placeholder="season" maxlength="2">
			</div>
			<button class="btn btn-info" id="gobutton">Go</button>
		</div>
	</div>
	
	
<!-- Bottom Scripts -->
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/TweenMax.min.js"></script>
	<script src="assets/js/resizeable.js"></script>
	<script src="assets/js/joinable.js"></script>
	<script src="assets/js/xenon-api.js"></script>
	<script src="assets/js/xenon-toggles.js"></script>


	<!-- JavaScripts initializations and stuff -->
	<script src="assets/js/xenon-custom.js"></script>
</body>
</html>