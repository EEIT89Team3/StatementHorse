package com.financialstatements.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//@WebServlet("/FinancialStatementsServlet")
public class FinancialStatementsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public FinancialStatementsServlet() {
        super();

    }


	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req,res);
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		String action = req.getParameter("action");
		
		if("financialstatements".equals(action)){
			
			/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
			
			/***************************2.開始查詢資料*****************************************/
			/***************************3.查詢完成,準備轉交(Send the Success view)*************/
			
		}
		
		
	}

}
