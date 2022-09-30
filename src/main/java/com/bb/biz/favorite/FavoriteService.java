package com.bb.biz.favorite;

public interface FavoriteService {
	boolean insertFavorite(FavoriteVO vo);
	boolean deleteFavorite(FavoriteVO vo);
	FavoriteVO selectOneFavorite(FavoriteVO vo);
}
