package com.java.member.dao;

import com.java.member.dto.MemberDto;

public interface MemberDao {

	public int memberInsert(MemberDto memberDto);

	public String loginCheck(String id, String password);

	public String memberIdCheck(String id);

	public int delete(String id, String password);

	public MemberDto updateId(String id);

	public int update(MemberDto memberDto);



}
