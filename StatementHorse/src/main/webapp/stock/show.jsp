<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/top/Top.jsp"%>
<!-- <link rel="stylesheet" -->
<%-- 	href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css"> --%>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/css/metisMenu.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/css/sb-admin-2.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/css/MyCSS.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/css/morris.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/css/metisMenu2.min.css">
<%-- <script src="${pageContext.servletContext.contextPath}/js/jquery-3.1.1.min.js"></script> --%>
<%-- <script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script> --%>
<%-- <script	src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"></script> --%>
<script
	src="${pageContext.servletContext.contextPath}/js/metisMenu.min.js"></script>
<script
	src="${pageContext.servletContext.contextPath}/js/raphael.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/js/morris.min.js"></script>
<script
	src="${pageContext.servletContext.contextPath}/js/morris-data.js"></script>
<script src="${pageContext.servletContext.contextPath}/js/sb-admin-2.js"></script>

<script src="https://code.highcharts.com/stock/highstock.js"></script>
<script src="https://code.highcharts.com/stock/modules/exporting.js"></script>

<style>
a:link {
	text-decoration: none
}
.th{
		white-space:nowrap;
		text-align:center;
		padding:0px 20px;
	}
	.td{
		white-space:nowrap;
		text-align:center;
		padding:5px 20px


}
</style>
<title>Insert title here</title>
</head>
<body>

	<input type="hidden" id="stockno" value="${stockVO.stockNo}" />
	<input type="hidden" id="stockname" value="${stockVO.stockName}" />
	<div class="container">
		<div class="page-header">
			<h3 style="font-family: '微軟正黑體';font-size:26px; color: #00BBFF">
				<a href="#" id="first_page"><i  class="fa fa-stack-exchange fa-fw"></i> 個股資料</a> <span
					class="pull-right label label-default"></span> <span
					style="margin-left:650px">


					<div class="btn-group">
						<a href="${pageContext.servletContext.contextPath}/GetTrackListing?id=Blastoise"><button type="button" class="btn btn-info btn-xs dropdown-toggle"
							style="font-family: '微軟正黑體';font-size:26px; id="mylisting">我的追蹤清單 <span></span>
						</button>
						<span></span>
						</div>
						<div class="btn-group">
						<button type="button" class="btn btn-info btn-xs dropdown-toggle"
							data-toggle="dropdown" style="font-family: '微軟正黑體';font-size:26px; id="listing">
							加入追蹤 <span class="caret"></span>
						</button>
						<ul class="dropdown-menu pull-right" role="menu"
							style="font-size: x-large" id="TrackListing_id">
							<c:forEach var="TrackListingVO" items="${list}">
								<li><input type="checkbox"
									value="${TrackListingVO.listingNo}">${TrackListingVO.listingName}</li>
							</c:forEach>
						</ul>
					</div>
				</span>
			</h3>
		</div>

		<div style="width: 300px; position: absolute; left: 370px; top: 250px">
			<ul class="nav" id="side-menu" style="font-family: '微軟正黑體';font-size:26px;">

				<li id="show_mgr"><a href="#"><i
						class="fa fa-search-plus fa-fw"></i>公司最新動態<span class="active"></span></a>
					<ul class="nav nav-second-level" style="padding-left: 30px">
					</ul></li>
				<li><a href="#"><i class="fa fa-file-text fa-fw"></i>三大財務報表<span
						class="fa arrow"></span></a>
					<ul class="nav nav-second-level" style="padding-left: 30px">
						<li><a href="#" id="show_incomestatement">損益表</a></li>
						<li><a href="#" id="show_balancesheet_1">資產表</a></li>
						<li><a href="#" id="show_balancesheet_2">負債表</a></li>
					</ul></li>
				
				<li><a href="#"><i class="fa fa-wrench fa-fw"></i>比率分析<span
						class="fa arrow"></span></a>
					<ul class="nav nav-second-level" style="padding-left: 30px">
						<li><a href="#" id="show_balance">安全性分析</a></li>
						<li><a href="#" id="show_profit">獲利分析</a></li>
					</ul></li>
				<li></li>
				<li></li>
				<li></li>
			</ul>
			<!-- 					</div> -->

			<!----------------------每頁不同從這裡開始----------------------------------------------------->
			<!--個股資料-->
			<table border='3 bordercolor='
				black'
				style="text-indent: 20px; width: 800px; height: 500px; position: absolute; left: 300px; top: 0px; display:; font-family: '微軟正黑體';font-size:26px; margin-bottom: 200px"
				id="show_stock">
				<tr>
					<td style="background-color: lightblue">股號</td>
					<td style="background-color: lightcyan">${stockVO.stockNo}</td>
				</tr>
				<tr>
					<td style="background-color: lightblue">股名</td>
					<td style="background-color: lightcyan">${stockVO.stockName}</td>
				</tr>
				<tr>
					<td style="background-color: lightblue">產業類別</td>
					<td style="background-color: lightcyan">${stockVO.industry}</td>
				</tr>
				<tr>
					<td style="background-color: lightblue">董事長</td>
					<td style="background-color: lightcyan">${stockVO.chairman}</td>
				</tr>
				<tr>
					<td style="background-color: lightblue">公司成立日期</td>
					<td style="background-color: lightcyan">${stockVO.companyEstablishDate}</td>
				</tr>
				<tr>
					<td style="background-color: lightblue">統一編號</td>
					<td style="background-color: lightcyan">${stockVO.companyTaxId}</td>
				</tr>
				<tr>
					<td style="background-color: lightblue">上市日期</td>
					<td style="background-color: lightcyan">${stockVO.listingDate}</td>
				</tr>
				<tr>
					<td style="background-color: lightblue">股東會日期</td>
					<td style="background-color: lightcyan">${stockVO.stockholdersMeetingDate}</td>
				</tr>
				<tr>

					<td style="background-color: lightblue">資本額(單位:百萬)</td>
					<td style="background-color: lightcyan">${stockVO.capital}</td>
				</tr>
				<tr>
					<td style="background-color: lightblue">公司網址</td>
					<td style="background-color: lightcyan">${stockVO.stockWebaddress}</td>
				</tr>
				<tr>
					<td style="background-color: lightblue">簽證會計師</td>
					<td style="background-color: lightcyan">${stockVO.accountingFirm}</td>

				</tr>
			</table>
			<!--個股最新動態 -->
			<div class="col-md-6"
				style="width: 800px; position: absolute; left: 300px; top: 0px; display: none"
				id="show_div_mgr">
				<div class="panel with-nav-tabs panel-info">
					<div class="panel-heading" style="background-color: lightblue">
						<ul class="nav nav-tabs"
							style="background-color: lightblue; font-family: '微軟正黑體';font-size:26px">
							<li class="active"><a href="#tab1info1" data-toggle="tab"
								id="111">月營收</a></li>
							<li><a href="#tab2info1" data-toggle="tab">每股盈餘</a></li>
							<li><a href="#tab3info1" data-toggle="tab">股價</a></li>
							<li><a href="#tab4info1" data-toggle="tab">股利</a></li>
							<li><a href="#tab5info1" data-toggle="tab">本益比</a></li>
						</ul>
					</div>
					<div class="panel-body" style="height: 630px">
						<div class="tab-content" id="container">
							<div class="tab-pane fade in active" id="tab1info1"
								>
							  <div id="tab1info"style="width: 730px"></div>	
							  <div style="overflow-x:auto;padding-top:30px">
							  		<table border='3' bordercolor='#DCDCDC' style="color:steelblue;font-family: '微軟正黑體';font-size:20px" id="show_mgr_table">
							  		<thead style="background-color:lightblue" ></thead>
							  		<tbody></tbody>
							  		</table>
							  </div>
						  	</div>
						   	<div class="tab-pane fade" id="tab2info1" >
						   	<div id="tab2info" style="width: 730px"></div>
						   	  <div style="overflow-x:auto;padding-top:30px">
							  		<table border='3' bordercolor='#DCDCDC' style="color:steelblue;font-family: '微軟正黑體';font-size:20px" id="show_earningPerShare_table">
							  		<thead style="background-color:lightblue" ></thead>
							  		<tbody></tbody>
							  		</table>
							 </div>
						   	</div>
							<div class="tab-pane fade" id="tab3info1" >
							<div id="tab3info" style="width: 730px"></div>
						   	  <div style="overflow-x:auto;padding-top:30px">
							  		<table border='3' bordercolor='#DCDCDC' style="color:steelblue;font-family: '微軟正黑體';font-size:20px" id="show_price_table">
							  		<thead style="background-color:lightblue" ></thead>
							  		<tbody></tbody>
							  		</table>
							 </div>
							</div>
							<div class="tab-pane fade" id="tab4info1" >
							<div id="tab4info" style="width: 730px"></div>
						   	  <div style="overflow-x:auto;padding-top:30px">
							  		<table border='3' bordercolor='#DCDCDC' style="color:steelblue;font-family: '微軟正黑體';font-size:20px" id="show_divident_table">
							  		<thead style="background-color:lightblue" ></thead>
							  		<tbody></tbody>
							  		</table>
							 </div>
							 </div>
							<div class="tab-pane fade" id="tab5info1" >
							<div id="tab5info" style="width: 730px"></div>
						   	  <div style="overflow-x:auto;padding-top:30px">
							  		<table border='3' bordercolor='#DCDCDC' style="color:steelblue;font-family: '微軟正黑體';font-size:20px" id="show_per_table">
							  		<thead style="background-color:lightblue" ></thead>
							  		<tbody></tbody>
							  		</table>
							 </div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 損益表 -->
			<div class="col-md-6"
				style="width: 800px; position: absolute; left: 300px; top: 0px; display: none"
				id="show_div_incomestatement">
				<div class="panel with-nav-tabs panel-info">
					<div class="panel-heading" style="background-color: lightblue">
						<ul class="nav nav-tabs"
							style="background-color: lightblue; font-family: '微軟正黑體';font-size:25px">
							<li class="active"><a href="#tab1info_1" data-toggle="tab">季營收</a></li>
							<li><a href="#tab2info_1" data-toggle="tab">季毛利</a></li>
							<li><a href="#tab3info_1" data-toggle="tab">營業利益</a></li>
							<li><a href="#tab4info_1" data-toggle="tab">稅前淨利</a></li>
							<li><a href="#tab5info_1" data-toggle="tab">稅後淨利</a></li>
							<li><a href="#tab6info_1" data-toggle="tab">損益表</a></li>
						</ul>
					</div>
					<div class="panel-body" style="height: 630px">
						<div class="tab-content" id="container_1" >
							<div class="tab-pane fade in active" id="tab1info_1"
								style="width: 730px"></div>
							<div class="tab-pane fade" id="tab2info_1" style="width: 730px"></div>
							<div class="tab-pane fade" id="tab3info_1" style="width: 730px"></div>
							<div class="tab-pane fade" id="tab4info_1" style="width: 730px"></div>
							<div class="tab-pane fade" id="tab5info_1" style="width: 730px"></div>
							<div class="tab-pane fade" id="tab6info_1" style="width: 730px"></div>
						</div>
					</div>
				</div>
			</div>
			<!-- 資產表 -->
			<div class="col-md-6"
				style="width: 800px; position: absolute; left: 300px; top: 0px; display: none"
				id="show_div_balancesheet_1">
				<div class="panel with-nav-tabs panel-info">
					<div class="panel-heading" style="background-color: lightblue">
						<ul class="nav nav-tabs"
							style="background-color: lightblue; font-family: '微軟正黑體';font-size:26px">
							<li class="active"><a href="#tab1info_2" data-toggle="tab">流動資產</a></li>
							<li><a href="#tab2info_2" data-toggle="tab">固定資產</a></li>
							<li><a href="#tab3info_2" data-toggle="tab">總資產</a></li>
							<li><a href="#tab4info_2" data-toggle="tab">資產表</a></li>
						</ul>
					</div>
					<div class="panel-body" style="height: 630px">
						<div class="tab-content" id="container_2">
							<div class="tab-pane fade in active" id="tab1info_2"
								style="width: 730px"></div>
							<div class="tab-pane fade" id="tab2info_2" style="width: 730px"></div>
							<div class="tab-pane fade" id="tab3info_2" style="width: 730px"></div>
							<div class="tab-pane fade" id="tab4info_2" style="width: 730px"></div>
							<div class="tab-pane fade" id="tab5info_2" style="width: 730px"></div>
						</div>
					</div>
				</div>
			</div>
			<!-- 負債表 -->
			<div class="col-md-6"
				style="width: 800px; position: absolute; left: 300px; top: 0px; display: none"
				id="show_div_balancesheet_2">
				<div class="panel with-nav-tabs panel-info">
					<div class="panel-heading" style="background-color: lightblue">
						<ul class="nav nav-tabs"
							style="background-color: lightblue;font-family: '微軟正黑體';font-size:26px">
							<li class="active"><a href="#tab1info_3" data-toggle="tab">流動負債</a></li>
							<li><a href="#tab2info_3" data-toggle="tab">長期負債</a></li>
							<li><a href="#tab3info_3" data-toggle="tab">淨值</a></li>
							<li><a href="#tab4info_3" data-toggle="tab">總負債+淨值</a></li>
							<li><a href="#tab5info_3" data-toggle="tab">負債表</a></li>
						</ul>
					</div>
					<div class="panel-body" style="height: 630px">
						<div class="tab-content" id="container_3">
							<div class="tab-pane fade in active" id="tab1info_3" style="width: 730px"></div>
							<div class="tab-pane fade" id="tab2info_3" style="width: 730px"></div>
							<div class="tab-pane fade" id="tab3info_3" style="width: 730px"></div>
							<div class="tab-pane fade" id="tab4info_3" style="width: 730px"></div>
							<div class="tab-pane fade" id="tab5info_3" style="width: 730px"></div>
						</div>
					</div>
				</div>
			</div>

<!-- 安全性分析 -->
			<div class="col-md-6"
				style="width: 800px; position: absolute; left: 300px; top: 0px; display: none"
				id="show_div_balance">
				<div class="panel with-nav-tabs panel-info">
					<div class="panel-heading" style="background-color: lightblue">
						<ul class="nav nav-tabs"
							style="background-color: lightblue; font-family: '微軟正黑體';font-size:26px">
							<li class="active"><a href="#tab1info_4" data-toggle="tab">負債比率</a></li>
							<li><a href="#tab2info_4" data-toggle="tab">流動比率</a></li>
						</ul>
					</div>
					<div class="panel-body" style="height: 630px">
						<div class="tab-content" id="container_4">
							<div class="tab-pane fade in active" id="tab1info_4" style="width: 730px"></div>
							<div class="tab-pane fade " id="tab2info_4" style="width: 730px"></div>
						</div>
					</div>
				</div>
			</div>
<!-- 獲利分析 -->
			<div class="col-md-6"
				style="width: 800px; position: absolute; left: 300px; top: 0px; display: none"
				id="show_div_profit">
				<div class="panel with-nav-tabs panel-info">
					<div class="panel-heading" style="background-color: lightblue">
						<ul class="nav nav-tabs"
							style="background-color: lightblue; font-family: '微軟正黑體';font-size:26px">
							<li class="active"><a href="#tab1info_5" data-toggle="tab">利潤比率</a></li>
						</ul>
					</div>
					<div class="panel-body" style="height: 630px">
						<div class="tab-content" id="container_4">
							<div class="tab-pane fade in active" id="tab1info_5" style="width: 730px"></div>
						</div>
					</div>
				</div>
			</div>









			<!----------------------每頁不同從這裡ㄐㄧㄝ----------------------------------------------------->

			<!-- 			</tr> -->
		

			<script>

				
				$(function() {
					
					var stockno = $("#stockno").val();
					var stockname = $("#stockname").val();
					var url = "ShowStockServlet?action=stock&stock_no="
							+ stockno;
					var thousandComma = function(number){
						var num = number.toString();
						var pattern = /(-?\d+)(\d{3})/;
						while(pattern.test(num)){
						num = num.replace(pattern, "$1,$2");
						}
					 	return num;
						}
					
					
					$("#first_page").click(function() {
						$("#show_div_mgr").css("display", "none");
						$("#show_div_incomestatement").css("display", "none");
						$("#show_div_balancesheet_1").css("display", "none");
						$("#show_div_balancesheet_2").css("display", "none");
						$("#show_div_profit").css("display", "none");
						$("#show_div_balance").css("display", "none");
						$("#show_stock").css("display", "");

					})
					$("#show_mgr").click(function() {
						$("#show_stock").css("display", "none");
						$("#show_div_incomestatement").css("display", "none");
						$("#show_div_balancesheet_1").css("display", "none");
						$("#show_div_balancesheet_2").css("display", "none");
						$("#show_div_profit").css("display", "none");
						$("#show_div_balance").css("display", "none");
						$("#show_div_mgr").css("display", "");
						
					})
					$("#show_incomestatement").click(function() {
						$("#show_div_mgr").css("display", "none");
						$("#show_stock").css("display", "none");
						$("#show_div_balancesheet_1").css("display", "none");
						$("#show_div_balancesheet_2").css("display", "none");
						$("#show_div_profit").css("display", "none");
						$("#show_div_balance").css("display", "none");
						$("#show_div_incomestatement").css("display", "");

					})
					$("#show_balancesheet_1").click(function() {
						$("#show_div_mgr").css("display", "none");
						$("#show_stock").css("display", "none");
						$("#show_div_incomestatement").css("display", "none");
						$("#show_div_balancesheet_2").css("display", "none");
						$("#show_div_profit").css("display", "none");
						$("#show_div_balance").css("display", "none");
						$("#show_div_balancesheet_1").css("display", "");

					})
					$("#show_balancesheet_2").click(function() {
						$("#show_div_mgr").css("display", "none");
						$("#show_stock").css("display", "none");
						$("#show_div_incomestatement").css("display", "none");
						$("#show_div_profit").css("display", "none");
						$("#show_div_balancesheet_1").css("display", "none");
						$("#show_div_balance").css("display", "none");
						$("#show_div_balancesheet_2").css("display", "");

					})
					$("#show_profit").click(function(){
						$("#show_div_mgr").css("display", "none");
						$("#show_stock").css("display", "none");
						$("#show_div_incomestatement").css("display", "none");
						$("#show_div_balancesheet_1").css("display", "none");
						$("#show_div_balancesheet_2").css("display", "none");
						$("#show_div_balance").css("display", "none");
						$("#show_div_profit").css("display", "");
					
					
					
					})
					$("#show_balance").click(function(){
						$("#show_div_mgr").css("display", "none");
						$("#show_stock").css("display", "none");
						$("#show_div_incomestatement").css("display", "none");
						$("#show_div_balancesheet_1").css("display", "none");
						$("#show_div_balancesheet_2").css("display", "none");
						$("#show_div_profit").css("display", "none");
						$("#show_div_balance").css("display", "");
					
					
					})
					
					//判別checkbox
					
			
								var list_no = $(
										"#TrackListing_id>li>input:eq(0)")
										.val();
								// 					console.log(i)
								$.get("ShowStockServlet", {
									"listNo" : list_no,
									"stock_no" : stockno,
									"insert_or_delete" : "select"
								}, function(data) {
									console.log(data)

									if (data == stockno) {
										$("#TrackListing_id>li>input:eq(0)")
												.prop("checked", true)
									} else {
										$("#TrackListing_id>li>input:eq(0)")
												.prop("checked", false)
										// 							console.log(i);
									}
								})
								var list_no = $(
										"#TrackListing_id>li>input:eq(1)")
										.val();
								// 					console.log(i)
								$.get("ShowStockServlet", {
									"listNo" : list_no,
									"stock_no" : stockno,
									"insert_or_delete" : "select"
								}, function(data) {
									console.log(data)

									if (data == stockno) {
										$("#TrackListing_id>li>input:eq(1)")
												.prop("checked", true)
									} else {
										$("#TrackListing_id>li>input:eq(1)")
												.prop("checked", false)
										// 							console.log(i);
									}
								})
								var list_no = $(
										"#TrackListing_id>li>input:eq(2)")
										.val();
								// 					console.log(i)
								$.get("ShowStockServlet", {
									"listNo" : list_no,
									"stock_no" : stockno,
									"insert_or_delete" : "select"
								}, function(data) {
									console.log(data)

									if (data == stockno) {
										$("#TrackListing_id>li>input:eq(2)")
												.prop("checked", true)
									} else {
										$("#TrackListing_id>li>input:eq(2)")
												.prop("checked", false)
										// 							console.log(i);
									}
								})
							
					//加入追蹤清單
					$("#TrackListing_id>li>input").change(function() {
						if ($(this).prop("checked")) {
							$.post("ShowStockServlet", {
								"listNo" : $(this).val(),
								"stock_no" : stockno,
								"insert_or_delete" : "insert"
							})
						} else {
							$.post("ShowStockServlet", {
								"listNo" : $(this).val(),
								"stock_no" : stockno,
								"insert_or_delete" : "delete"
							})
						}
					})
					$("#show_mgr").click(function() {
					//mgrjson
					var mgrurl = 'http://localhost:8080/StatementHorse/ShowStockServlet?json=mgrjson&stock_no='+ stockno;
					$.getJSON(mgrurl,function(data) {
						$('#tab1info').highcharts('StockChart',{
							rangeSelector : {selected : 5},title : {text : '月營收('+ stockno+ ')'},
							series : [ {name : stockname,data : data,tooltip : {valueDecimals : 2}} ]
						});
						
					});
					var myHead=$("#show_mgr_table>thead")
					var myBody=$("#show_mgr_table>tbody")

					//http://localhost:8080/StatementHorse/ShowStockServlet?json=getVO&stock_no=2330&need=getMGRVO
					$.getJSON("ShowStockServlet",{"json":"getVO","need":"getMGRVO","stock_no":stockno},function(data){
						var length=data.length
// 						myHead.append("<><>")
						myHead.append("<th>年度/月份</th>")
						myBody.append("<td>營收</td>")
						$.each(data,function(key2,value2){
							var date=$("<th></th>").append(value2.RevenueDate);
							var revenue=$("<td></td>").append(thousandComma(value2.Revenue));
							myHead.append(date)
							myBody.append(revenue)
						})
						$("#show_mgr_table>thead>th").addClass("th")
						$("#show_mgr_table>tbody>td").addClass("td")

					})
						
				
					
					
					
					
					
					
					//pricejson
					var priceurl = 'http://localhost:8080/StatementHorse/ShowStockServlet?json=pricejson&stock_no='+ stockno
					$.getJSON(priceurl,function(data) {$('#tab3info').highcharts('StockChart',{
						rangeSelector : {selected : 5},title : {text : '股價('+ stockno+ ')'},
						series : [ {type : 'candlestick',
									name : stockname,
									data : data,dataGrouping : {units : ['week', ['month',[1,2,3,4,6 ] ] ]}
// 									                                      unit name[ 1 ] allowed multiples],
									}]
								} )
							});
					
					//incomestatementjson
					var incomestatementjsonurl = 'http://localhost:8080/StatementHorse/ShowStockServlet?json=incomestatementjson&need=earningPerShare&stock_no='
							+ stockno;
					$.getJSON(incomestatementjsonurl,function(data) {
															// Create the chart
// 						$('#tab2info').highcharts('StockChart',{rangeSelector : {selected : 5},
// 										title : {text : '每股盈餘('+ stockno+ ')'},
// 										series : [ {name : stockname,data : data,tooltip : {
// 										valueDecimals : 2}
// 										} ]
// 								});
															
						 Highcharts.chart('tab2info', {
						        chart: {
						            type: 'column'
						        },
						        title: {
						            text:  '每股盈餘'
						        },
						        subtitle: {
						            text:stockname+ "("+stockno+')'
						        },
						        xAxis: {
						            type: 'category',
						            labels: {
						                rotation: -45,
						                style: {
						                    fontSize: '13px',
						                    fontFamily: 'Verdana, sans-serif'
						                }
						            }
						        },
						        yAxis: {
						            min: 0,
						            title: {
						                text:  'earningPerShare'
						            }
						        },
						        legend: {
						            enabled: false
						        },
						        tooltip: {
						            pointFormat: '每股盈餘: <b>{point.y:.1f}</b>'
						        },
						        series: [{
						            name: 'Population',
						            data: data
// 						            dataLabels: {
// 						                enabled: true,
// 						                rotation: -90,
// 						                color: '#FFFFFF',
// 						                align: 'right',
// 						                format: '{point.y:.1f}', // one decimal
// 						                y: 10, // 10 pixels down from the top
// 						                style: {
// 						                    fontSize: '13px',
// 						                    fontFamily: 'Verdana, sans-serif'
// 						                }
// 						            }
						        }]
						    });								
															
						});
					
					
					//divident 股利
					var dividenturl = 'http://localhost:8080/StatementHorse/ShowStockServlet?json=dividendjson&stock_no='
							+ stockno;
					$.getJSON(dividenturl, function(data) {
									// create the chart
						$('#tab4info').highcharts('StockChart',{
										chart : {alignTicks : false},
										rangeSelector : {selected : 3},
										title : {text : '股利('+ stockno+ ')'},
										series : [ {type : 'column',name : "",data : data,
														//				                 dataGrouping: {units: [['week', // unit name [1] // allowed multiples
														//				                     ], ['month', [1, 2, 3, 4, 6] ]] }
										} ]
								});
						});
						//本益比JSON
					var PERurl = 'http://localhost:8080/StatementHorse/ShowStockServlet?json=PERjson&stock_no='
							+ stockno;
						$.getJSON(PERurl,function(data) {
								$('#tab5info').highcharts('StockChart',{
										rangeSelector : {selected : 5},
										title : {text : '本益比('+ stockno+ ')'},
										series : [ {name : stockname,data : data,tooltip : {valueDecimals : 2}} ]
									});
							});
					})

					$("#show_incomestatement").click(
							function() {
					//incomestatementjson季營收
					var revenuejsonurl ="http://localhost:8080/StatementHorse/ShowStockServlet?json=incomestatementjson&need=operatingRevenue&stock_no="+stockno;

					$.getJSON(revenuejsonurl,function(data) {
						Highcharts.chart('tab1info_1', {
					        chart: {
					            type: 'column'
					        },
					        title: {
					            text: '季營收'
					        },
					        subtitle: {
					            text: stockname+'('+stockno+')'
					        },
					        xAxis: {
					            type: 'category',
					            labels: {
					                rotation: -45,
					                style: {
					                    fontSize: '13px',
					                    fontFamily: 'Verdana, sans-serif'
					                }
					            }
					        },
					        yAxis: {
					            min: 0,
					            title: {
					                text: 'Revenue(millions)'
					            }
					        },
					        legend: {
					            enabled: false
					        },
					        tooltip: {
					            pointFormat: '營收: <b>{point.y:.1f}百萬</b>'
					        },
					        series: [{
					            name: 'Revenue',
					            data:data,
// 					            dataLabels: {
// 					                enabled: true,
// 					                rotation: -90,
// 					                color: '#FFFFFF',
// 					                align: 'right',
// 					                format: '{point.y:.1f}', // one decimal
// 					                y: 10, // 10 pixels down from the top
// 					                style: {
// 					                    fontSize: '13px',
// 					                    fontFamily: 'Verdana, sans-serif'
// 					                }
// 					            }
					        }]
					    });
					})
							




					//incomestatementjson季毛利
					var operatingMargainjsonurl = 'http://localhost:8080/StatementHorse/ShowStockServlet?json=incomestatementjson&need=operatingMargain&stock_no='
							+ stockno;
					$.getJSON(operatingMargainjsonurl,function(data) {
						Highcharts.chart('tab2info_1', {
					        chart: {
					            type: 'column'
					        },
					        title: {
					            text: '季毛利'
					        },
					        subtitle: {
					            text: stockname+'('+stockno+')'
					        },
					        xAxis: {
					            type: 'category',
					            labels: {
					                rotation: -45,
					                style: {
					                    fontSize: '13px',
					                    fontFamily: 'Verdana, sans-serif'
					                }
					            }
					        },
					        yAxis: {
					            min: 0,
					            title: {
					                text: 'Margain(millions)'
					            }
					        },
					        legend: {
					            enabled: false
					        },
					        tooltip: {
					            pointFormat: '毛利: <b>{point.y:.1f}百萬</b>'
					        },
					        series: [{
					            name: 'Margain',
					            data:data,
// 					            dataLabels: {
// 					                enabled: true,
// 					                rotation: -90,
// 					                color: '#FFFFFF',
// 					                align: 'right',
// 					                format: '{point.y:.1f}', // one decimal
// 					                y: 10, // 10 pixels down from the top
// 					                style: {
// 					                    fontSize: '13px',
// 					                    fontFamily: 'Verdana, sans-serif'
// 					                }
// 					            }
					        }]
					    });
						});
					//稅前淨利
						var operatingIncomejsonurl = 'http://localhost:8080/StatementHorse/ShowStockServlet?json=incomestatementjson&need=operatingIncome&stock_no='
							+ stockno;
						$.getJSON(operatingIncomejsonurl,function(data) {
							Highcharts.chart('tab3info_1', {
						        chart: {
						            type: 'column'
						        },
						        title: {
						            text: '營業利益'
						        },
						        subtitle: {
						            text: stockname+'('+stockno+')'
						        },
						        xAxis: {
						            type: 'category',
						            labels: {
						                rotation: -45,
						                style: {
						                    fontSize: '13px',
						                    fontFamily: 'Verdana, sans-serif'
						                }
						            }
						        },
						        yAxis: {
						            min: 0,
						            title: {
						                text: 'operatingIncome(millions)'
						            }
						        },
						        legend: {
						            enabled: false
						        },
						        tooltip: {
						            pointFormat: '營業利益: <b>{point.y:.1f}百萬</b>'
						        },
						        series: [{
						            name: 'operatingIncome',
						            data:data,
//	 					            dataLabels: {
//	 					                enabled: true,
//	 					                rotation: -90,
//	 					                color: '#FFFFFF',
//	 					                align: 'right',
//	 					                format: '{point.y:.1f}', // one decimal
//	 					                y: 10, // 10 pixels down from the top
//	 					                style: {
//	 					                    fontSize: '13px',
//	 					                    fontFamily: 'Verdana, sans-serif'
//	 					                }
//	 					            }
						        }]
						    });
						})
						var oibtjsonurl = 'http://localhost:8080/StatementHorse/ShowStockServlet?json=incomestatementjson&need=oibt&stock_no='
							+ stockno;
						$.getJSON(oibtjsonurl,function(data) {
							Highcharts.chart('tab4info_1', {
						        chart: {
						            type: 'column'
						        },
						        title: {
						            text: '稅前淨利'
						        },
						        subtitle: {
						            text: stockname+'('+stockno+')'
						        },
						        xAxis: {
						            type: 'category',
						            labels: {
						                rotation: -45,
						                style: {
						                    fontSize: '13px',
						                    fontFamily: 'Verdana, sans-serif'
						                }
						            }
						        },
						        yAxis: {
						            min: 0,
						            title: {
						                text: 'Profit(millions)'
						            }
						        },
						        legend: {
						            enabled: false
						        },
						        tooltip: {
						            pointFormat: '稅前淨利: <b>{point.y:.1f}百萬</b>'
						        },
						        series: [{
						            name: 'Profit',
						            data:data,
//	 					            dataLabels: {
//	 					                enabled: true,
//	 					                rotation: -90,
//	 					                color: '#FFFFFF',
//	 					                align: 'right',
//	 					                format: '{point.y:.1f}', // one decimal
//	 					                y: 10, // 10 pixels down from the top
//	 					                style: {
//	 					                    fontSize: '13px',
//	 					                    fontFamily: 'Verdana, sans-serif'
//	 					                }
//	 					            }
						        }]
						    });
						})
					var netIncomejsonurl = 'http://localhost:8080/StatementHorse/ShowStockServlet?json=incomestatementjson&need=netIncome&stock_no='
							+ stockno;
						$.getJSON(netIncomejsonurl,function(data) {
							Highcharts.chart('tab5info_1', {
						        chart: {
						            type: 'column'
						        },
						        title: {
						            text: '稅後淨利'
						        },
						        subtitle: {
						            text: stockname+'('+stockno+')'
						        },
						        xAxis: {
						            type: 'category',
						            labels: {
						                rotation: -45,
						                style: {
						                    fontSize: '13px',
						                    fontFamily: 'Verdana, sans-serif'
						                }
						            }
						        },
						        yAxis: {
						            min: 0,
						            title: {
						                text: 'Profit(millions)'
						            }
						        },
						        legend: {
						            enabled: false
						        },
						        tooltip: {
						            pointFormat: '稅後淨利: <b>{point.y:.1f}百萬</b>'
						        },
						        series: [{
						            name: 'Profit',
						            data:data,
//	 					            dataLabels: {
//	 					                enabled: true,
//	 					                rotation: -90,
//	 					                color: '#FFFFFF',
//	 					                align: 'right',
//	 					                format: '{point.y:.1f}', // one decimal
//	 					                y: 10, // 10 pixels down from the top
//	 					                style: {
//	 					                    fontSize: '13px',
//	 					                    fontFamily: 'Verdana, sans-serif'
//	 					                }
//	 					            }
						        }]
						    });
						})
					//統整表
					var incomejsonurl = 'http://localhost:8080/StatementHorse/ShowStockServlet?json=incomejson&need=income&stock_no='+stockno;
					$.getJSON(incomejsonurl,function(data){
						 Highcharts.chart('tab6info_1', {
					        title: {
					            text:"損益表",
					            x: -20 //center
					        },
					        subtitle: {
					            text: stockname+"("+stockno+")",
					            x: -20
					        },
					        xAxis: data[0],
					        yAxis: {
					            title: {
					                text: ''
					            },
					            plotLines: [{
					                value: 0,
					                width: 1,
					                color: '#808080'
					            }]
					        },
					        tooltip: {
					            valueSuffix: '千元'
					        },
					        legend: {
					            layout: 'vertical',
					            align: 'right',
					            verticalAlign: 'middle',
					            borderWidth: 0
					        },
					        series: [data[1], data[2],data[4],data[5]]
					    });
					
					
					
					
					
					})
							})
					
				$("#show_balancesheet_1").click(function() {
					var assetsAlljsonurl = 'http://localhost:8080/StatementHorse/ShowStockServlet?json=assetsjson&need=assetsAll&stock_no='+stockno;
					$.getJSON(assetsAlljsonurl,function(data){
						 Highcharts.chart('tab4info_2', {
					        title: {
					            text:"資產("+stockno+")",
					            x: -20 //center
					        },
					        subtitle: {
					            text: "",
					            x: -20
					        },
					        xAxis: data[0],
					        yAxis: {
					            title: {
					                text: ''
					            },
					            plotLines: [{
					                value: 0,
					                width: 1,
					                color: '#808080'
					            }]
					        },
					        tooltip: {
					            valueSuffix: '元'
					        },
					        legend: {
					            layout: 'vertical',
					            align: 'right',
					            verticalAlign: 'middle',
					            borderWidth: 0
					        },
					        series: [data[1], data[2],data[3]]
					    });
					})
					//流動資產
					var fixedAssetsjsonurl = 'http://localhost:8080/StatementHorse/ShowStockServlet?json=balancesheetjson&need=currentAssets&stock_no='
							+ stockno;
						$.getJSON(fixedAssetsjsonurl,function(data) {
							Highcharts.chart('tab1info_2', {
						        chart: {
						            type: 'column'
						        },
						        title: {
						            text: '流動資產'
						        },
						        subtitle: {
						            text: stockname+'('+stockno+')'
						        },
						        xAxis: {
						            type: 'category',
						            labels: {
						                rotation: -45,
						                style: {
						                    fontSize: '13px',
						                    fontFamily: 'Verdana, sans-serif'
						                }
						            }
						        },
						        yAxis: {
						            min: 0,
						            title: {
						                text: 'CurrentAssets(millions)'
						            }
						        },
						        legend: {
						            enabled: false
						        },
						        tooltip: {
						            pointFormat: '流動資產: <b>{point.y}百萬</b>'
						        },
						        series: [{
						            name: 'currentAssets',
						            data:data,
//	 					            dataLabels: {
//	 					                enabled: true,
//	 					                rotation: -90,
//	 					                color: '#FFFFFF',
//	 					                align: 'right',
//	 					                format: '{point.y:.1f}', // one decimal
//	 					                y: 10, // 10 pixels down from the top
//	 					                style: {
//	 					                    fontSize: '13px',
//	 					                    fontFamily: 'Verdana, sans-serif'
//	 					                }
//	 					            }
						        }]
						    });
						})
					//固定資產
					var netIncomejsonurl = 'http://localhost:8080/StatementHorse/ShowStockServlet?json=balancesheetjson&need=fixedAssets&stock_no='
							+ stockno;
						$.getJSON(netIncomejsonurl,function(data) {
							Highcharts.chart('tab2info_2', {
						        chart: {
						            type: 'column'
						        },
						        title: {
						            text: '固定資產'
						        },
						        subtitle: {
						            text: stockname+'('+stockno+')'
						        },
						        xAxis: {
						            type: 'category',
						            labels: {
						                rotation: -45,
						                style: {
						                    fontSize: '13px',
						                    fontFamily: 'Verdana, sans-serif'
						                }
						            }
						        },
						        yAxis: {
						            min: 0,
						            title: {
						                text: 'FixedAssets(millions)'
						            }
						        },
						        legend: {
						            enabled: false
						        },
						        tooltip: {
						            pointFormat: '固定資產: <b>{point.y}百萬</b>'
						        },
						        series: [{
						            name: 'fixedAssets',
						            data:data,
//	 					            dataLabels: {
//	 					                enabled: true,
//	 					                rotation: -90,
//	 					                color: '#FFFFFF',
//	 					                align: 'right',
//	 					                format: '{point.y:.1f}', // one decimal
//	 					                y: 10, // 10 pixels down from the top
//	 					                style: {
//	 					                    fontSize: '13px',
//	 					                    fontFamily: 'Verdana, sans-serif'
//	 					                }
//	 					            }
						        }]
						    });
						})
						//總資產
						
					var assetsjsonurl = 'http://localhost:8080/StatementHorse/ShowStockServlet?json=balancesheetjson&need=assets&stock_no='
							+ stockno;
						$.getJSON(assetsjsonurl,function(data) {
							Highcharts.chart('tab3info_2', {
						        chart: {
						            type: 'column'
						        },
						        title: {
						            text: '總資產'
						        },
						        subtitle: {
						            text: stockname+'('+stockno+')'
						        },
						        xAxis: {
						            type: 'category',
						            labels: {
						                rotation: -45,
						                style: {
						                    fontSize: '13px',
						                    fontFamily: 'Verdana, sans-serif'
						                }
						            }
						        },
						        yAxis: {
						            min: 0,
						            title: {
						                text: 'Assets(millions)'
						            }
						        },
						        legend: {
						            enabled: false
						        },
						        tooltip: {
						            pointFormat: '總資產: <b>{point.y}百萬</b>'
						        },
						        series: [{
						            name: 'Assets',
						            data:data,
//	 					            dataLabels: {
//	 					                enabled: true,
//	 					                rotation: -90,
//	 					                color: '#FFFFFF',
//	 					                align: 'right',
//	 					                format: '{point.y:.1f}', // one decimal
//	 					                y: 10, // 10 pixels down from the top
//	 					                style: {
//	 					                    fontSize: '13px',
//	 					                    fontFamily: 'Verdana, sans-serif'
//	 					                }
//	 					            }
						        }]
						    });
						})
					})
				$("#show_balancesheet_2").click(function() {
					//流動負債
					var currentLiabilitiesjsonurl = 'http://localhost:8080/StatementHorse/ShowStockServlet?json=balancesheetjson&need=currentLiabilities&stock_no='
							+ stockno;
						$.getJSON(currentLiabilitiesjsonurl,function(data) {
							Highcharts.chart('tab1info_3', {
						        chart: {
						            type: 'column'
						        },
						        title: {
						            text: '流動負債'
						        },
						        subtitle: {
						            text: stockname+'('+stockno+')'
						        },
						        xAxis: {
						            type: 'category',
						            labels: {
						                rotation: -45,
						                style: {
						                    fontSize: '13px',
						                    fontFamily: 'Verdana, sans-serif'
						                }
						            }
						        },
						        yAxis: {
						            min: 0,
						            title: {
						                text: 'CurrentLiabilities(millions)'
						            }
						        },
						        legend: {
						            enabled: false
						        },
						        tooltip: {
						            pointFormat: '流動負債: <b>{point.y}百萬</b>'
						        },
						        series: [{
						            name: 'CurrentLiabilities',
						            data:data,
//	 					            dataLabels: {
//	 					                enabled: true,
//	 					                rotation: -90,
//	 					                color: '#FFFFFF',
//	 					                align: 'right',
//	 					                format: '{point.y:.1f}', // one decimal
//	 					                y: 10, // 10 pixels down from the top
//	 					                style: {
//	 					                    fontSize: '13px',
//	 					                    fontFamily: 'Verdana, sans-serif'
//	 					                }
//	 					            }
						        }]
						    });
						})
					//長期負債
					var longTermLiabilitiesjsonurl = 'http://localhost:8080/StatementHorse/ShowStockServlet?json=balancesheetjson&need=longTermLiabilities&stock_no='
							+ stockno;
						$.getJSON(longTermLiabilitiesjsonurl,function(data) {
							Highcharts.chart('tab2info_3', {
						        chart: {
						            type: 'column'
						        },
						        title: {
						            text: '長期負債'
						        },
						        subtitle: {
						            text: stockname+'('+stockno+')'
						        },
						        xAxis: {
						            type: 'category',
						            labels: {
						                rotation: -45,
						                style: {
						                    fontSize: '13px',
						                    fontFamily: 'Verdana, sans-serif'
						                }
						            }
						        },
						        yAxis: {
						            min: 0,
						            title: {
						                text: 'LongTermLiabilities(thousand)'
						            }
						        },
						        legend: {
						            enabled: false
						        },
						        tooltip: {
						            pointFormat: '長期負債: <b>{point.y}百萬</b>'
						        },
						        series: [{
						            name: 'LongTermLiabilities',
						            data:data,
//	 					            dataLabels: {
//	 					                enabled: true,
//	 					                rotation: -90,
//	 					                color: '#FFFFFF',
//	 					                align: 'right',
//	 					                format: '{point.y:.1f}', // one decimal
//	 					                y: 10, // 10 pixels down from the top
//	 					                style: {
//	 					                    fontSize: '13px',
//	 					                    fontFamily: 'Verdana, sans-serif'
//	 					                }
//	 					            }
						        }]
						    });
						})
					//淨值
					var Netjsonurl = 'http://localhost:8080/StatementHorse/ShowStockServlet?json=balancesheetjson&need=net&stock_no='
							+ stockno;
						$.getJSON(Netjsonurl,function(data) {
							Highcharts.chart('tab3info_3', {
						        chart: {
						            type: 'column'
						        },
						        title: {
						            text: '淨值'
						        },
						        subtitle: {
						            text: stockname+'('+stockno+')'
						        },
						        xAxis: {
						            type: 'category',
						            labels: {
						                rotation: -45,
						                style: {
						                    fontSize: '13px',
						                    fontFamily: 'Verdana, sans-serif'
						                }
						            }
						        },
						        yAxis: {
						            min: 0,
						            title: {
						                text: 'Net(millions)'
						            }
						        },
						        legend: {
						            enabled: false
						        },
						        tooltip: {
						            pointFormat: '淨值: <b>{point.y}百萬</b>'
						        },
						        series: [{
						            name: 'Net',
						            data:data,
//	 					            dataLabels: {
//	 					                enabled: true,
//	 					                rotation: -90,
//	 					                color: '#FFFFFF',
//	 					                align: 'right',
//	 					                format: '{point.y:.1f}', // one decimal
//	 					                y: 10, // 10 pixels down from the top
//	 					                style: {
//	 					                    fontSize: '13px',
//	 					                    fontFamily: 'Verdana, sans-serif'
//	 					                }
//	 					            }
						        }]
						    });
						})
						//總資產(負債+淨值)
						var Netjsonurl = 'http://localhost:8080/StatementHorse/ShowStockServlet?json=balancesheetjson&need=assets&stock_no='
							+ stockno;
						$.getJSON(Netjsonurl,function(data) {
							Highcharts.chart('tab4info_3', {
						        chart: {
						            type: 'column'
						        },
						        title: {
						            text: '總負債+淨值'
						        },
						        subtitle: {
						            text: stockname+'('+stockno+')'
						        },
						        xAxis: {
						            type: 'category',
						            labels: {
						                rotation: -45,
						                style: {
						                    fontSize: '13px',
						                    fontFamily: 'Verdana, sans-serif'
						                }
						            }
						        },
						        yAxis: {
						            min: 0,
						            title: {
						                text: 'Assets(millions)'
						            }
						        },
						        legend: {
						            enabled: false
						        },
						        tooltip: {
						            pointFormat: '總負債+淨值: <b>{point.y}百萬</b>'
						        },
						        series: [{
						            name: 'Assets',
						            data:data,
//	 					            dataLabels: {
//	 					                enabled: true,
//	 					                rotation: -90,
//	 					                color: '#FFFFFF',
//	 					                align: 'right',
//	 					                format: '{point.y:.1f}', // one decimal
//	 					                y: 10, // 10 pixels down from the top
//	 					                style: {
//	 					                    fontSize: '13px',
//	 					                    fontFamily: 'Verdana, sans-serif'
//	 					                }
//	 					            }
						        }]
						    });
						})
					//統整表
					var debtjsonurl = 'http://localhost:8080/StatementHorse/ShowStockServlet?json=assetsjson&need=debt&stock_no='+stockno;
					$.getJSON(debtjsonurl,function(data){
						 Highcharts.chart('tab5info_3', {
					        title: {
					            text:"負債表",
					            x: -20 //center
					        },
					        subtitle: {
					            text: stockname+"("+stockno+")",
					            x: -20
					        },
					        xAxis: data[0],
					        yAxis: {
					            title: {
					                text: ''
					            },
					            plotLines: [{
					                value: 0,
					                width: 1,
					                color: '#808080'
					            }]
					        },
					        tooltip: {
					            valueSuffix: '千元'
					        },
					        legend: {
					            layout: 'vertical',
					            align: 'right',
					            verticalAlign: 'middle',
					            borderWidth: 0
					        },
					        series: [data[1], data[2],data[3],data[4]]
					    });
					
					
					
					
					
					})
					
					
				})
					
				$("#show_balance").click(function() {
						balancejsonurl = 'http://localhost:8080/StatementHorse/ShowStockServlet?json=assetsjson&need=balance&stock_no='
							+ stockno;
						$.getJSON(balancejsonurl,function(data) {
							 Highcharts.chart('tab1info_4', {
							        title: {
							            text: "負債比率",
							            x: -20 //center
							        },
							        subtitle: {
							            text: stockname+'('+stockno+')',
							            x: -20
							        },
							        xAxis: data[0]
							        ,
							        yAxis: {
							            title: {
							                text: 'Asset liability ratio(%)'
							            },
							            plotLines: [{
							                value: 0,
							                width: 1,
							                color: '#808080'
							            }]
							        },
							        tooltip: {
							            valueSuffix: '%'
							        },
							        legend: {
							            layout: 'vertical',
							            align: 'right',
							            verticalAlign: 'middle',
							            borderWidth: 0
							        },
							        series: [data[1]]
							    });
								});
						flowjsonurl = 'http://localhost:8080/StatementHorse/ShowStockServlet?json=assetsjson&need=flow&stock_no='
							+ stockno;
						$.getJSON(flowjsonurl,function(data) {
							 Highcharts.chart('tab2info_4', {
							        title: {
							            text: "流動比率",
							            x: -20 //center
							        },
							        subtitle: {
							            text: stockname+'('+stockno+')',
							            x: -20
							        },
							        xAxis: data[0]
							        ,
							        yAxis: {
							            title: {
							                text: 'Current Asset liability ratio(%)'
							            },
							            plotLines: [{
							                value: 0,
							                width: 1,
							                color: '#808080'
							            }]
							        },
							        tooltip: {
							            valueSuffix: '%'
							        },
							        legend: {
							            layout: 'vertical',
							            align: 'right',
							            verticalAlign: 'middle',
							            borderWidth: 0
							        },
							        series: [data[1]]
							    });
								});


						})
				$("#show_profit").click(function(){
					profitjsonurl = 'http://localhost:8080/StatementHorse/ShowStockServlet?json=incomejson&need=profit&stock_no='
						+ stockno;
					$.getJSON(profitjsonurl,function(data) {
						 Highcharts.chart('tab1info_5', {
						        title: {
						            text: "利潤比例",
						            x: -20 //center
						        },
						        subtitle: {
						            text: stockname+'('+stockno+')',
						            x: -20
						        },
						        xAxis: data[0]
						        ,
						        yAxis: {
						            title: {
						                text: 'Profit ratio(%)'
						            },
						            plotLines: [{
						                value: 0,
						                width: 1,
						                color: '#808080'
						            }]
						        },
						        tooltip: {
						            valueSuffix: '%'
						        },
						        legend: {
						            layout: 'vertical',
						            align: 'right',
						            verticalAlign: 'middle',
						            borderWidth: 0
						        },
						        series: [data[1],data[2],data[3]]
						    });
					
					
					
					})
					
				})
			})
			</script>

			
			


			
			</body>


				

</html>