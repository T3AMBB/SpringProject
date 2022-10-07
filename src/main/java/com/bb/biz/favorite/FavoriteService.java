package com.bb.biz.favorite;

import java.util.List;

public interface FavoriteService {
	boolean insertFavorite(FavoriteVO vo);
	boolean deleteFavorite(FavoriteVO vo);
	FavoriteVO selectOneFavorite(FavoriteVO vo);
	List<FavoriteVO> selectAllFavorite(FavoriteVO vo);
}
