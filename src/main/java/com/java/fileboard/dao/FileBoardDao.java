package com.java.fileboard.dao;

import java.util.HashMap;
import java.util.List;

import com.java.board.dto.BoardDto;
import com.java.fileboard.dto.FileBoardDto;

public interface FileBoardDao {

	public int fileBoardGroupNumberMax();

	public int fileBoardWriteNumber(HashMap<String, Integer> hMap);

	public int fileBoardWriteNumber(FileBoardDto fileBoardDto);

	public int getCount();

	public List<FileBoardDto> fileBoardList(int startRow, int endRow);

	public FileBoardDto read(int boardNumber);

	public FileBoardDto fileBoardSelect(int boardNumber);

	public BoardDto selectBoard(int boardNumber);

	public int delete(int boardNumber, String password);

	public int update(BoardDto boardDto);

	public FileBoardDto selectsBoard(int parseInt);

	public int update(FileBoardDto fileBoardDto);



}
