package com.yaboja.dao;

import java.util.List;
import java.util.Map;

import com.yaboja.dto.MatchingDto;

public interface MatchingDao {
	String namespace="matching.";
	
	public int insert(MatchingDto dto);
	public MatchingDto selectOne(int userseq);
	public int delete(int matchingseq);
	public List<MatchingDto> getMatchingApplicant(int userseq);
	public int acceptance(Map<String, String> map);
	public int rejection(Map<String,String> map);
	public int rejectionOne(Map<String, String> map);
	public MatchingDto matchSuccess(int userseq);
	public MatchingDto insertCheck(int userseq);
	
}
