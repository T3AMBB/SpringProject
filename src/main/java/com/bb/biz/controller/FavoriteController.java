package com.bb.biz.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bb.biz.favorite.FavoriteService;
import com.bb.biz.favorite.FavoriteVO;
import com.bb.biz.product.ProductService;
import com.bb.biz.product.ProductVO;

@Controller
public class FavoriteController {
	@Autowired
	private FavoriteService favoriteService;
	@Autowired
	private ProductService productService;
	
	@ResponseBody
	@RequestMapping(value="/favorite.do")
	public String Favorite(FavoriteVO fVO) {
		
		if(favoriteService.selectOneFavorite(fVO)!=null) { // 해당 FID가 있는지 확인
			
			favoriteService.deleteFavorite(fVO);
			return "0";
		}
		else {
			favoriteService.insertFavorite(fVO);
			return "1";
		}
	}
	
	@RequestMapping(value="/favAll.do")
	public String FavoriteAll(FavoriteVO fVO,Model model,HttpSession session) {
		fVO.setMid((String)session.getAttribute("member"));
		List<FavoriteVO> favorite=favoriteService.selectAllFavorite(fVO);
		model.addAttribute("favorite", favorite);
		
		return "favorite.jsp";
	}
	
	@ResponseBody
	@RequestMapping(value="/favD.do") //좋아요 상품삭제
	public String cartDelete(FavoriteVO fVO,HttpSession session,HttpServletRequest request) {

		List<FavoriteVO> favorite=favoriteService.selectAllFavorite(fVO);
		
				
				fVO.setMid(request.getParameter("mid"));
				fVO.setPid(Integer.parseInt(request.getParameter("pid")));
				
				favoriteService.deleteFavorite(fVO);
				
				
				
		
		
		
		return "success";
	}
	
}
