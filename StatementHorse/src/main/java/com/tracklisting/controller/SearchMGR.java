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
import com.mgr.model.MGRDAO;
import com.mgr.model.MGRVO;
import com.news.model.NewsHibernateDAO;
import com.stocknews.model.StockNewsHibernateDAO;

@WebServlet("/SearchMGR")
public class SearchMGR extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public SearchMGR() {
    	
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
		
		//使用到的 DAO
		ListingDetailsHibernateDAO lddao = new ListingDetailsHibernateDAO();
		MGRDAO mgrdao = new MGRDAO();
		
		//使用到的集合
		ArrayList l1 = new ArrayList();
		
		//查詢清單編號內含股號		
		List<ListingDetailsVO> tdvo = lddao.getAllByListing(Integer.parseInt(listingNo));
		for (ListingDetailsVO tdvo2 : tdvo) {
	
		List<MGRVO> mgrvo= mgrdao.getByStockNo(tdvo2.getStockVO().getStockNo());
		for (MGRVO mgrvo2 : mgrvo) {
			
			Map m1 = new HashMap();
			m1.put("StockNo", mgrvo2.getStockVO().getStockNo());
			m1.put("StockName", mgrvo2.getStockVO().getStockName());
			m1.put("RevenueDate", mgrvo2.getRevenueDate());
			m1.put("PostDate", mgrvo2.getPostDate().toString().substring(0,10));
			l1.add(m1);
			
		}
			
		}
		
		String jsonString = JSONValue.toJSONString(l1);
		response.getWriter().println(jsonString);
		
	}
	
}