package com.bb.biz.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bb.biz.favorite.FavoriteVO;
import com.bb.biz.favorite.impl.FavoriteDAO;
import com.bb.biz.product.ProductVO;
import com.bb.biz.product.impl.ProductDAO;

/**
 * Servlet implementation class Favorite
 */
public class Favorite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Favorite() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response); // get 방식 요청이 들어오면 post로 보내줌
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Favorite 서블릿 들어옴");
		FavoriteDAO fDAO = new FavoriteDAO();
		FavoriteVO fVO = new FavoriteVO();
		int result = 0;
		
		fVO.setMid(request.getParameter("mid")); // 좋아요를 누른 사용자 pk
		fVO.setPid(Integer.parseInt(request.getParameter("pid"))); // 좋아요 눌린 상품 pk
		System.out.println(fDAO);
		if(fDAO.selectOneFavorite(fVO)!=null) { // 해당 FID가 있는지 확인
			
			fDAO.deleteFavorite(fVO);
			result = 0;
		}
		else {
			fDAO.insertFavorite(fVO);
			result = 1;
		}
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().write(result+"");
	}

}
