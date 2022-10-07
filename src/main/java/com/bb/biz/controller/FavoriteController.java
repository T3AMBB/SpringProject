package com.bb.biz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bb.biz.favorite.FavoriteService;
import com.bb.biz.favorite.FavoriteVO;

@Controller
public class FavoriteController {
	@Autowired
	private FavoriteService favoriteService;
	
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
	public String FavoriteAll(FavoriteVO fVO) {
		
		favoriteService.selectAllFavorite(fVO);
		
		return "favorite.jsp";
	}
	
}
