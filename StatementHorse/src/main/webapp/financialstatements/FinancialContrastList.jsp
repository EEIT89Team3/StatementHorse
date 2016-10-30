<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<!--              設定樣式                                  -->
<link rel="stylesheet" href="../css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="../css/jquery-ui.css"> -->

<!--              設定外掛                                  -->
<script src="../js/jquery.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->

<script>
	$(function() {
		//jQuery動態清單
		$("#accordion").accordion({
			heightStyle : "content"
		});

		//click事件
		$("dd").click(function() {
			alert($(this).text());
			alert($(this).attr("name"))
		})
		//刪除click事件
	    $('#simpleTable').on('click','.btn-danger',function(){
	    	$(this).parents('tr').remove();
	    })
		//增加click事件
		$('#buttonAdd').click(function(){
			$('table').append("<tr><td>X</td><td>Y</td><td>Z</td><td><a href='#' class='btn btn-danger'>刪除</a></td></tr>");
		});
		
	});
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="col-md-3" id="accordion">
				<h3>資產負債表</h3>
				<div>
					<dl>
						<dd name="currentAssets">流動資產</dd>
						<dd name="fixedAssets">流動資產</dd>
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
						<dd name="totalEquity">權益總計(資產-負債)</dd>
					</dl>
				</div>
				<h3>損益表</h3>
				<div>
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
			<div class="col-md-9">
				<input type="button" value="add row" id="buttonAdd" class="btn btn-success">
				<div id="msg"></div>
				<table id="simpleTable" class="table table-bordered table-hover">
					<tr>
						<td>A0</td>
						<td>B1</td>
						<td>C2</td>
						<td><a href="#" class="btn btn-danger">刪除</a></td>
					</tr>
					<tr>
						<td>D3</td>
						<td>E4</td>
						<td>F5</td>
						<td><a href="#" class="btn btn-danger">刪除</a></td>
					</tr>
					<tr>
						<td>G6</td>
						<td>H7</td>
						<td>I8</td>
						<td><a href="#" class="btn btn-danger">刪除</a></td>
					</tr>
				</table>

			</div>
		</div>
	</div>
</body>
</html>