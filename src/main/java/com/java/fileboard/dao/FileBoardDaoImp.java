package com.java.fileboard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.aop.LogAspect;
import com.java.board.dto.BoardDto;
import com.java.fileboard.dto.FileBoardDto;

@Component
public class FileBoardDaoImp implements FileBoardDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;


	@Override
	public int fileBoardGroupNumberMax() {
		return sqlSessionTemplate.selectOne("boardGroupNumberMax");
	}

	@Override
	public int fileBoardWriteNumber(HashMap<String, Integer> hMap) {
		return sqlSessionTemplate.update("boardWriterNumber", hMap);
	}

	@Override
	public int fileBoardWriteNumber(FileBoardDto fileBoardDto) {
		int check;
		if (fileBoardDto.getFileSize() == 0) {
			check = sqlSessionTemplate.insert("boardInsert", fileBoardDto);
		} else {
			check = sqlSessionTemplate.insert("fileboardInsert", fileBoardDto);
		}
		return check;
	}

	public int getCount() {
		return sqlSessionTemplate.selectOne("boardCount");
	}

	@Override
	public List<FileBoardDto> fileBoardList(int startRow, int endRow) {
		Map<String, Integer> hMap = new HashMap<String, Integer>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);

		return sqlSessionTemplate.selectList("boardList", hMap);
	}

	@Override
	public FileBoardDto read(int boardNumber) {
		FileBoardDto fileBoardDto = null;

		int check = sqlSessionTemplate.update("boardReadCount", boardNumber);
		LogAspect.logger.info(LogAspect.LogMsg + check);

		fileBoardDto = sqlSessionTemplate.selectOne("fileBoardRead", boardNumber);

		return fileBoardDto;
	}

	@Override
	public FileBoardDto fileBoardSelect(int boardNumber) {
		return sqlSessionTemplate.selectOne("fileBoardRead", boardNumber);
	}

	@Override
	public BoardDto selectBoard(int boardNumber) {
		return sqlSessionTemplate.selectOne("boardRead", boardNumber);
	}

	@Override
	public int delete(int boardNumber, String password) {
		Map<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("boardNumber", boardNumber);
		hMap.put("password", password);

		return sqlSessionTemplate.delete("boardDelete", hMap);
	}

	@Override
	public int update(BoardDto boardDto) {
		return sqlSessionTemplate.update("fileBoardUpdate", boardDto);
	}
	@Override
	public FileBoardDto selectsBoard(int parseInt) {
		return sqlSessionTemplate.selectOne("boardRead", parseInt);
	}
	@Override
	public int update(FileBoardDto fileBoardDto) {
		return sqlSessionTemplate.update("fileBoardUpdate",fileBoardDto);
	}
}
