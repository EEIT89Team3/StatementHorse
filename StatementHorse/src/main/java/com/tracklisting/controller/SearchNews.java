package com.tracklisting.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONValue;

import com.listingdetails.model.ListingDetailsHibernateDAO;
import com.listingdetails.model.ListingDetailsVO;
import com.news.model.NewsHibernateDAO;
import com.news.model.NewsVO;
import com.stocknews.model.StockNewsHibernateDAO;
import com.stocknews.model.StockNewsVO;

@WebServlet("/SearchNews")
public class SearchNews extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public SearchNews() {
    	
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		//接收使用者選擇的清單編號
		String listingNo = request.getParameter("ListingNo");
		
		//接收查詢變數
		String searchNum = request.getParameter("searchNum");
				
		int i = 0;
		int y = Integer.parseInt(searchNum);
		
		//使用到的 DAO
		ListingDetailsHibernateDAO lddao = new ListingDetailsHibernateDAO();
		StockNewsHibernateDAO isdao = new StockNewsHibernateDAO();
//		NewsHibernateDAO ndao = new NewsHibernateDAO();
		
		//使用到的集合
		ArrayList l1 = new ArrayList();
		ArrayList stockNoArrayList = new ArrayList();
		
		//查詢清單編號內含股號		
		List<ListingDetailsVO> tdvo = lddao.getAllByListing(Integer.parseInt(listingNo));
		for (ListingDetailsVO tdvo2 : tdvo) {

				stockNoArrayList.add(tdvo2.getStockVO().getStockNo());

		}
		
		List<Object[]> list = isdao.getByStockNoByShao(stockNoArrayList);
		
		for(Object[] aArray : list ){
			
			Map m1 = new HashMap();
			m1.put("NewsDate", aArray[0].toString());
			m1.put("NewsTitle",aArray[1]);
			m1.put("NewsWebaddress", aArray[2]);
			m1.put("StockNo", aArray[3]);
			l1.add(m1);
			
			i++;
			if( i == y && y != 0)
				break;
			
			}
		
		String jsonString = JSONValue.toJSONString(l1);
		response.getWriter().println(jsonString);
		
	}

}
