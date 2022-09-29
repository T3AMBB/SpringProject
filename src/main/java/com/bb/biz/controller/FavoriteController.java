package com.bb.biz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bb.biz.favorite.FavoriteService;
import com.bb.biz.favorite.FavoriteVO;

@Controller
public class FavoriteController {
	@Autowired
	private FavoriteService favoriteService;
	
	@RequestMapping(value="/insertF.do")
	public String InsertFavorite(FavoriteVO fVO) {
		favoriteService.insertFavorite(fVO);
		return "main.jsp";
	}
	@RequestMapping(value="/deleteF.do")
	public String DelteFavorite(FavoriteVO fVO) {
		favoriteService.deleteFavorite(fVO);
		return "main.jsp";
	}
	
}
