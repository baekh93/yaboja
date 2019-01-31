package com.yaboja.dao;

import java.util.ArrayList;
import java.util.List;

import com.yaboja.dto.Criteria;
import com.yaboja.dto.MovieDto;
import com.yaboja.dto.ReviewboardDto;

public interface MovieDao {
	String namespace="movie.";
	
	public List<MovieDto> selectPresentMovies();
	public List<MovieDto> selectEndMovies();
	public int insert(List<MovieDto> movies);
	public void updateToEnd(List<MovieDto> updateToEndMovies);
	public MovieDto selectOneMovie(int movieSeq);
	
	// 목록  + 페이징
	public List<MovieDto> listPage(Criteria cri);
	
	// 겟시물 총 갯수
	public int listCount();
}
