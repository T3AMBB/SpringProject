package com.bb.biz.favorite.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.bb.biz.favorite.FavoriteService;
import com.bb.biz.favorite.FavoriteVO;

public class FavoriteServiceImpl implements FavoriteService{
	
	@Autowired
	private FavoriteDAO favoriteDAO;
	
	@Override
	public boolean insertFavorite(FavoriteVO vo) {
		return favoriteDAO.insertFavorite(vo);
	}

	@Override
	public boolean deleteFavorite(FavoriteVO vo) {
		return favoriteDAO.deleteFavorite(vo);
	}

}
