package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dao.BoardDAO;
import dto.BoardDTO;
import dto.PageDTO;

public class BoardServiceImp implements BoardService {
	BoardDAO dao;

	public BoardServiceImp() {

	}

	public void setDao(BoardDAO dao) {
		this.dao = dao;
	}

	@Override
	public int countProcess() {
		return dao.count();
	}

	@Override
	public List<BoardDTO> listProcess(PageDTO pv) {
		return dao.list(pv);
	}

	@Override
	public void insertProcess(BoardDTO dto) {
		dao.save(dto);
	}

	@Override
	public BoardDTO contentProcess(int num) {
		dao.readCount(num);
		return dao.content(num);
	}

	@Override
	public void reStepProcess(BoardDTO dto) {
		dao.reStepCount(dto);
	}

	@Override
	public void updateProcess(BoardDTO dto, HttpServletRequest request) {
		dao.update(dto);
	}

	@Override
	public void deleteProcess(int num, HttpServletRequest request) {
		dao.delete(num);
	}

}
