package com.bb.biz.favorite.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bb.biz.favorite.FavoriteService;
import com.bb.biz.favorite.FavoriteVO;

@Service("FavoriteService")
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

	@Override
	public FavoriteVO selectOneFavorite(FavoriteVO vo) {
		return favoriteDAO.selectOneFavorite(vo);
	}
	@Override
	public List<FavoriteVO> selectAllFavorite(FavoriteVO vo) {
		return favoriteDAO.selectAllFavorite(vo);
	}

}
