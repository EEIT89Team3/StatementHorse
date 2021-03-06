package com.financialstatements.model;


import java.util.Date;
import java.util.LinkedList;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Set;

import com.balancesheet.model.BalanceSheetDAO;
import com.balancesheet.model.BalanceSheetVO;
import com.incomestatement.model.IncomeStatementVO;
import com.stock.model.StockService;
import com.stock.model.StockVO;

public class FinancialStatementsService {
	private FinancialStatements_interface dao;
	
	public FinancialStatementsService(){
		dao = new FinancialStatementsDAO();
		
	}
	public FinancialStatementsVO addFinancialStatements(Integer stockNo,String statementDate, Date postDate, String postTime
			){
			
		FinancialStatementsVO financialStatementsVO = new FinancialStatementsVO();
		financialStatementsVO.setStockNo(stockNo);
		financialStatementsVO.setStatementDate(statementDate);
		financialStatementsVO.setPostDate(postDate);
		financialStatementsVO.setPostTime(postTime);
		dao.insert(financialStatementsVO);

		return financialStatementsVO;
	}
	public FinancialStatementsVO updateFinancialStatements(Integer stockNo,String statementDate, Date postDate, String postTime
			){
		
		FinancialStatementsVO financialStatementsVO = new FinancialStatementsVO();
		financialStatementsVO.setStockNo(stockNo);
		financialStatementsVO.setStatementDate(statementDate);
		financialStatementsVO.setPostDate(postDate);
		financialStatementsVO.setPostTime(postTime);
		dao.update(financialStatementsVO);
		
		return dao.findByPrimaryKey(financialStatementsVO);
	}
	public void deleteFinancialStatements(Integer stockNo, String statementDate){
		FinancialStatementsVO financialStatementsVO = new FinancialStatementsVO();
		
		financialStatementsVO.setStockNo(stockNo);
		financialStatementsVO.setStatementDate(statementDate);
		dao.delete(financialStatementsVO);
	}
	public FinancialStatementsVO getOneFinancialStatements(Integer stockNo, String statementDate){
		FinancialStatementsVO financialStatementsVO = new FinancialStatementsVO();
		
		financialStatementsVO.setStockNo(stockNo);
		financialStatementsVO.setStatementDate(statementDate);
		return dao.findByPrimaryKey(financialStatementsVO);
		
	}
	public List<FinancialStatementsVO> getAll(){
		return dao.getAll();
	}
	
	public List getByPostDate(Date postDate ){
		List listAll=new LinkedList();
		FinancialStatementsVO financialStatementsVO = new FinancialStatementsVO();
		financialStatementsVO.setPostDate(postDate);
		List<FinancialStatementsVO> list=dao.getByPostDate(financialStatementsVO);
		List list1=null;
		for(FinancialStatementsVO element:list){
			list1=new LinkedList();
			Integer stockno = element.getStockNo();
			StockService stockSvc=new StockService();
			StockVO stockVO=stockSvc.getOneStock(stockno);
			String stockname = stockVO.getStockName();
			list1.add(stockno);
			list1.add(stockname);
			list1.add(element.getPostDate());
			list1.add(element.getPostTime());
			listAll.add(list1);
		}
		
		return  listAll;
	}
	
	public List<FinancialStatementsVO> checkinsert(Integer stockno,Date lastdateandtime){
		List<FinancialStatementsVO> returnlist = new LinkedList<>();
		List<FinancialStatementsVO> list = dao.findByStockNo(stockno);
		for(FinancialStatementsVO financialStatementsVO:list){
			Date lastdate = financialStatementsVO.getPostDate();
			String lasttime = financialStatementsVO.getPostTime();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-ddHH:mm:ss");
			java.util.Date lastdateandtime1 = null;
			try {
				lastdateandtime1 = dateFormat.parse(lastdate.toString().substring(0,10)+lasttime+":00");
			} catch (ParseException e) {
				e.printStackTrace();
			}
			System.out.println("時分時間"+lastdate.toString().substring(0,10)+lasttime+":00");
			System.out.println("資料庫的時間"+lastdateandtime1);
			System.out.println("使用者的登入時間"+lastdateandtime);
			System.out.println(lastdateandtime1.after(lastdateandtime));
			if(lastdateandtime1.before(lastdateandtime)){
				break;
			}else{
				returnlist.add(financialStatementsVO);
			}
		}
		return returnlist;
		
	}

	public List<FinancialStatementsVO> insert(FinancialStatementsVO financialStatementsVO){
		List<FinancialStatementsVO> list = dao.findByStockNo(financialStatementsVO.getStockNo());
		FinancialStatementsVO lastvo = list.get(0);
		Date lastdate = lastvo.getPostDate();
		String lasttime = lastvo.getPostTime();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-ddHH:mm:ss");
		java.util.Date lastdateandtime = null;
		try {
			lastdateandtime = dateFormat.parse(lastdate.toString()+lasttime);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		dao.insert(financialStatementsVO);
		return checkinsert(financialStatementsVO.getStockNo(),(java.sql.Date)lastdateandtime);
	}
	
	//-----------新增財報比較查詢一筆----By葉哲--------
	public FinancialStatementsVO getStockFS(Integer stockNo ,String statementDate){
		FinancialStatementsVO fsVO = new FinancialStatementsVO();
		
		fsVO.setStockNo(stockNo);
		fsVO.setStatementDate(statementDate);
		return dao.findByPrimaryKey(fsVO);
	}
	
	//-----------財報比較查詢全部statementDates----By葉哲--------
	public List<FinancialStatementsVO> getAllSDs(){
		return dao.getAllSDs();
	}
	public List<FinancialStatementsVO> getOneStock(Integer stock_no){
//		FinancialStatementsVO financialStatementsVO=new FinancialStatementsVO();
//		financialStatementsVO.setStockNo(stock_no);
		return dao.getByStockNo(stock_no);
		 
	}

	//快速測試程式碼
//	public static final void main(String args[]) throws ParseException{
//		FinancialStatementsService a=new FinancialStatementsService();
//		FinancialStatementsDAO aa = new FinancialStatementsDAO();
//		FinancialStatementsVO FinancialStatementsVO=new FinancialStatementsVO();
//		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");		
//		FinancialStatementsVO.setPostDate(dateformat.parse("2014-08-01"));
//		List<FinancialStatementsVO> bb = aa.getByPostDate(FinancialStatementsVO);
		
		
//		List<com.financialstatements.model.FinancialStatementsVO> list = a.getByPostDate(FinancialStatementsVO.getPostDate());
//		for(FinancialStatementsVO cc:bb){
//			Set<IncomeStatementVO> dd = cc.getIncomeStatements();
//			for(IncomeStatementVO ee :dd){
//				System.out.println(ee.getStockVO().getStockName());
//			}
//		}
	
	
	//-------------測試財報比較查詢一筆--開始--------------------
//		FinancialStatementsVO = a.getNewestStockFS();
//		System.out.print(FinancialStatementsVO.getStockNo()+":");
//		
//		for(BalanceSheetVO bSVO :FinancialStatementsVO.getBalanceSheets()){
//			System.out.print(bSVO.getStockVO().getStockName()+",");
//			System.out.print(bSVO.getCurrentAssets()+",");
//			
//		}
//		for(IncomeStatementVO iSVO :FinancialStatementsVO.getIncomeStatements()){
//			System.out.println(iSVO.getOperatingRevenue()+"");
//		}
	//-------------測試財報比較查詢一筆--結束--------------------
	
	
//	}
	
	//----------------
	
	
}
