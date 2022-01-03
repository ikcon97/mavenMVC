package com.java.member.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.aop.LogAspect;
import com.java.board.dto.BoardDto;
import com.java.member.dto.MemberDto;

@Component
public class MemberDaoImp implements MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	

	@Override
	public int memberInsert(MemberDto memberDto) {
		return sqlSessionTemplate.insert("memberInsert", memberDto);
	}

	@Override
	public String loginCheck(String id, String password) {
		Map<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("id", id);
		hMap.put("password", password);

		return sqlSessionTemplate.selectOne("memberLoginCheck", hMap);
	}

	@Override
	public String memberIdCheck(String id) {
		return sqlSessionTemplate.selectOne("memberIdCheck", id);
	}

	@Override
	public int delete(String id, String password) {
		Map<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("id", id);
		hMap.put("password", password);

		return sqlSessionTemplate.delete("memberDelete", hMap);
	}

	@Override
	public MemberDto updateId(String id) {

		return sqlSessionTemplate.selectOne("memberSelect", id);
	}

	@Override
	public int update(MemberDto memberDto) {
		return sqlSessionTemplate.update("memberUpdate", memberDto);
	}
}
