<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>StatementHorse</title>

<!--              設定樣式                                  -->
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="../css/jquery-ui.css"> -->

<!--              設定外掛                                  -->
<script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/js/jquery-ui.min.js"></script>
<%-- <script src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"></script> --%>
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<%@include file="/top/Top.jsp"%>
<style>
*{
font-family:微軟正黑體;
}
dd{
font-size:22px;
}
table{
font-size:22px;
word-break: keep-all;
}

.ui-autocomplete {
 position: absolute;
 z-index: 1000;
 cursor: default;
 padding: 0;
 margin-top: 2px;
 list-style: none;
 background-color: #ffffff;
 border: 1px solid #cccccc
 -webkit-border-radius: 5px;
 -moz-border-radius: 5px;
 border-radius: 5px;
 -webkit-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
 -moz-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
 box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
}
.ui-autocomplete > li {
  padding: 3px 20px;
}
.ui-autocomplete > li.ui-state-focus {
  background-color: #dddddd;
}
.ui-helper-hidden-accessible {
  display: none;
}

.ui-autocomplete a  {
 color: #555555;
}
.ui-autocomplete a:link  {
 color: #555555;
}
.ui-autocomplete a:hover  {
 color: #337ab7;
 text-decoration: none;
}
.ui-autocomplete a:active  {
 color: #555555;
}
.ui-autocomplete a:visited  {
 color: #555555;
}
</style>



<script>
	$(function() {
		//輸入數字自動顯示提示
		//自動完成
		var stock = [];
		$.getJSON("${pageContext.servletContext.contextPath}/GetStock",{},function(data) {
			$.each(data,function(){
				var StockNo = this.StockNo;	
				stock.push(StockNo.toString());
			});
		});
			$( "input[name='stockText']" ).css("width","150px").autocomplete({source: stock}).parents('td').addClass("text-left");
		
		//載入AllStatementDates
		$.getJSON("${pageContext.servletContext.contextPath}/financialstatements/financialstatements.do",{"action":"getAllSDs"},function(data){
			var SDs = "";
			$.each(data,function(index,value){
				SDs += "<option value="+ value +">" + value + "</option>"	
			})
			$("select[name='SDSelect']").html(SDs).attr('value',data[0])
		})
				
		//紀錄會計科目數量
		var colNo = 0;
		//增加欄位數量設定開關
		var start = true;
		//點選會計科目清單，加入/刪除欄位，點擊顏色變化
		var c1 = {'color':'red'},
			c2 = {'color':'black'};
		$("dd").click(
				function() {
					var dd = $(this);
					start = false;
					$('td[name="tr"]').remove();
					if (dd.attr("flag") == 'true') {
						//刪除
						dd.attr("flag", 'false');
						$('td[name="' + dd.attr('name') + '"]').remove();
						dd.css(c2);
						colNo--;
					} else {
						//增加
						dd.attr("flag", 'true');
						$('thead td:last-child').after("<td name='" + dd.attr('name') + "'>" + dd.text() + "</td>");
						$('tbody td:last-child').after("<td name='" + dd.attr('name') + "'></td>");
						dd.css(c1);
						colNo++;
					}
				});
		//滑鼠移動會計科目動畫
		$('dd').mouseover(over).mouseout(out);
		var s1 = {'font-size':'26px','cursor': 'pointer'},
			s2 = {'font-size':'22px'};
		function over(){
			$(this).css(s1);
		}
		function out(){
			$(this).css(s2);
		}
		//刪除整列查詢列
		$('#simpleTable').on('click', '.btn-danger', function() {
			$(this).parents('tr').remove();
		})
		//增加查詢列
		$('#buttonAdd')
				.click(
						function() {
							if (start) {
								//尚未點選會計科目時，增加的查詢列
								$('#Fbody')
										.append(
												"<tr><td><a href='#' class='btn btn-danger btn-lg'>刪除</a></td><td><input type='text' name='stockText' maxlength='4' placeholder='請輸入股號'/></td><td name='tr'></td></tr>");
							} else {
								//已點選會計科目時，依據增加的欄位數量，增加的查詢列
								var tds;
								$('#Fhead td:gt(1)').each(
										function() {
											tds += "<td name='"
													+ $(this).attr("name")
													+ "'></td>";
										})
								$('#Fbody').append(
												"<tr><td><a href='#' class='btn btn-danger btn-lg'>刪除</a></td><td><input type='text' name='stockText' maxlength='4' placeholder='請輸入股號'/></td>"
												+ tds + "</tr>");
							}
							$( "input[name='stockText']" ).css("width","150px").autocomplete({source: stock}).parents('td').addClass("text-left");
							
						});
		//清空整個頁面，還原到一開始進入的樣子
		$('#clear').click(function() {
			$('#simpleTable').empty().prepend('<thead id="Fhead"><td class="col-md-1"></td><td class="col-md-3 text-left">股票號碼</td><td name="tr">+增加會計科目</td></thead><tbody id="Fbody"><tr><td><a href="#" class="btn btn-danger  btn-lg">刪除</a></td><td><input type="text" name="stockText" maxlength="4" placeholder="請輸入股號"/></td><td name="tr"></td></tr></tbody>')
			colNo = 0;
			start = true;
			$('dd').css(c2);
			$( "input[name='stockText']" ).css("width","150px").autocomplete({source: stock}).parents('td').addClass("text-left");
		})
		//自動查詢個股股名,增加到輸入方塊中
		$('#simpleTable').on('blur','input[name="stockText"]',function(){
			var thing = $(this);
			if(thing.prop("value") != ""){
				
				$.post("${pageContext.servletContext.contextPath}/StockServlet.do",{"action":"getStockName","stockNo":thing.prop("value")},function(stockName){
						thing.attr("stockNo",thing.prop("value"))
						if(thing.next().text() != stockName){
							thing.next().remove()
							thing.after("<h3>"+ stockName +"</h3>")
						}
				})
			}else{
				
				thing.next().remove()
			}
			
		})
		//submit送出
		$('#submit').click(function() {
			$('input[name="stockText"]').each(function(){
			
		//-------------放入表格---開始-------
				$.getJSON("${pageContext.servletContext.contextPath}/financialstatements/financialstatements.do",{"action":"findStockFSs","stockNo":$(this).prop("value"),"statementDate":$("select[name='SDSelect']").val()},function(data){
					$("input[stockNo=" + data.stockNo + "]").parent().nextAll().each(function(){
						var td = $(this)
						$.each(data,function(key,value){
							if(key == td.attr('name')){
								td.text(value)
							}
						})
					})
				})
		//-------------放入表格---結束-------
			})
		})
		
	});
</script>
</head>
<body>

		<div class="container-fluid">
			<div class="row-fluid">
				<div class="col-md-1"></div>
					<div class="col-md-3" ">
						<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne"  style="background-color: lightblue">
								<h2 class="panel-title" style="font-size:26px">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapseOne" aria-expanded="true"
										aria-controls="collapseOne"> 資產負債表 </a>
								</h2>
							</div>
							<div id="collapseOne" class="panel-collapse collapse in"
								role="tabpanel" aria-labelledby="headingOne">
								<div class="panel-body">
									<dl>
										<dd name="currentAssets">流動資產</dd>
										<dd name="fixedAssets">非流動資產</dd>
										<dd name="assets">總資產</dd>
										<dd name="currentLiabilities">流動負債</dd>
										<dd name="longTermLiabilities">非流動負債</dd>
										<dd name="liabilities">總負債</dd>
										<dd name="capitalStock">股本</dd>
										<dd name="additionalPaidInCapital">資本公積</dd>
										<dd name="retainedEarnings">保留盈餘</dd>
										<dd name="otherEquity">其他權益</dd>
										<dd
											name="consolidatedNetIncomeAttributedToStockholdersOfTheCompany">歸屬母公司業主之權益</dd>
										<dd name="totalEquity">權益總計</dd>
									</dl>
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingTwo" style="background-color: lightblue">
								<h2 class="panel-title" style="font-size:26px">
									<a class="collapsed" data-toggle="collapse"
										data-parent="#accordion" href="#collapseTwo"
										aria-expanded="true" aria-controls="collapseTwo"> 損益表 </a>
								</h2>
							</div>
							<div id="collapseTwo" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="headingTwo">
								<div class="panel-body">
									<dl>
										<dd name="operatingRevenue">營業收入</dd>
										<dd name="operatingCost">營業成本</dd>
										<dd name="operatingMargain">營業毛利</dd>
										<dd name="netOperatingMargain">營業毛利淨額</dd>
										<dd name="operatingExpenses">營業費用</dd>
										<dd name="operatingIncome">營業利益</dd>
										<dd name="nonOperatingRevenue">業外收入及支出</dd>
										<dd name="oibt">稅前淨利</dd>
										<dd name="incomeTaxExpense">所得稅費用</dd>
										<dd name="coiat">繼續營業單位本期淨利</dd>
										<dd name="netIncome">本期淨利</dd>
										<dd name="oci">其他綜合損益</dd>
										<dd name="currentProfitAndLoss">本期綜合損益</dd>
										<dd name="earningPerShare">基本每股盈餘</dd>
									</dl>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-7">
					<!--查詢表格 -->
					<div class="row-fluid">
						<div class="col-md-2 ">
							<input type="button" value="增加" id="buttonAdd"
								class="btn btn-success  btn-lg">
						</div>
                    <!-- 年分下拉選單開始 -->
                    <!-- 尚未做動態 -->
                    	<div class="col-md-3">
							<select name="SDSelect" class="form-control input-lg">
							</select>
							
						</div>
					<!-- 年分下拉選單結束 -->
					<!-- 季度下拉選單開始 -->
					<!-- 尚未做動態 -->
						<div class="col-md-4" style="line-height: 50px;font-size:22px">年/季</div>
					</div>
					<!-- 季度下拉選單結束 -->	
					<div class="row-fluid">
						<div class="table table-responsive ">
							<p/>
								<table id="simpleTable" class="table table-bordered text-center"> 
									<thead id="Fhead">
										<tr>
											<td class="col-md-1"></td>
											<td class="col-md-1 text-left">股票號碼</td>
											<td name="tr">+增加會計科目</td>
										</tr>
									</thead>
									<tbody id="Fbody" class="text-right">
										<tr>
											<td><a href='#' class='btn btn-danger btn-lg'>刪除</a></td>
											<td><input type="text" name="stockText" maxlength="4" placeholder="請輸入股號"/></td>
											<td name="tr"></td>
										</tr>
									</tbody>
								</table>
							</div>
					</div>
					<div class="row-fluid">
							<div class="col-md-8"></div>
							<div class="col-md-4">
								<input type="button" value="清空" id="clear"
									class="btn btn-success  btn-lg">
								<input type="button" value="送出" id="submit"
									class="btn btn-info  btn-lg">
							</div>
					</div>
					
				
					<div class="col-md-1"></div>
				</div>
			</div>
</body>
</html>