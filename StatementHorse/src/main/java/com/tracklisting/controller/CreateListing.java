package com.tracklisting.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.listingdetails.model.ListingDetailsHibernateDAO;
import com.listingdetails.model.ListingDetailsVO;
import com.member.model.MemberVO;
import com.tracklisting.model.TrackListingHibernateDAO;
import com.tracklisting.model.TrackListingVO;

@WebServlet("/CreateListing")
public class CreateListing extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CreateListing() {
    	
        super();     
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		//session
		HttpSession session = request.getSession();
		MemberVO membervo = (MemberVO) session.getAttribute("user");
		String member_id = membervo.getMemberId();
		
		String listingName = request.getParameter("listingName");
//		String memberId = request.getParameter("memberId");

		TrackListingHibernateDAO tldao = new TrackListingHibernateDAO();
		TrackListingVO tlvo = new TrackListingVO();
		
		if(listingName.trim().length() <= 0 || listingName.trim().length() > 8){
			
			response.getWriter().write("清單名稱不得空白或超過 8 個字!!");
			
		}
		
		else{
				
			MemberVO mvo = new MemberVO();
			mvo.setMemberId(member_id);
			
			tlvo.setMemberVO(mvo);;
			tlvo.setListingName(listingName);
			tldao.insert(tlvo);
		
			response.getWriter().write("新增追蹤清單成功");
		
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
