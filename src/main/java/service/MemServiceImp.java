package service;

import java.util.List;

import dao.MemDAO;
import dto.CategoryDTO;
import dto.CatgDTO;
import dto.MemDTO;
import dto.MyCommentDTO;
import dto.RatingDTO;
import dto.WishListDTO;

public class MemServiceImp implements MemService {
	MemDAO dao;

	public MemServiceImp() {
		// TODO Auto-generated constructor stub
	}

	public void setDao(MemDAO dao) {
		this.dao = dao;
	}

	@Override
	public boolean idCheckProcess(MemDTO userDTO) {
		// dao.chkId의 결과값이 1이면 회원 아니면 비회원
		return (dao.idCheck(userDTO) != null) ? true : false;
	}

	@Override
	public void registerProcess(MemDTO userDTO) {
		// 회원가입 메서드
		dao.register(userDTO);
	}

	@Override
	public MemDTO loginProcess(MemDTO userDTO) {
		// 로그인 메서드
		return dao.login(userDTO);
	}

	@Override
	public MemDTO findIdProcess(MemDTO userDTO) {
		// 아이디 찾기
		return dao.findId(userDTO);
	}
	
	@Override
	public MemDTO findPwProcess(MemDTO userDTO) {
		// 비밀번호 찾기
		return dao.findPw(userDTO);
	}

	@Override
	public void updateProcess(MemDTO userDTO) {
		dao.updateInfo(userDTO);
	}

	@Override
	public List<MemDTO> memInfo(MemDTO userDTO) {
		// TODO Auto-generated method stub
		return dao.memInfo(userDTO);
	}

	@Override
	public void memUpdate(MemDTO userDTO) {
		dao.memUpdate(userDTO);
		
	}

	@Override
	public void profileUpdate(MemDTO userDTO) {
		dao.profileUpdate(userDTO);
	}
	public MemDTO mList(int mem_num) {
		return dao.mList(mem_num);
	}

	@Override
	public void commentProfileUpdate(MemDTO userDTO) {
		dao.commentProfileUpdate(userDTO);
	}

	@Override
	public List<RatingDTO> profile_rating(MemDTO userDTO) {
		return dao.profile_rating(userDTO);
	}

	@Override
	public List<MyCommentDTO> mycomment(MemDTO userDTO) {
		return dao.mycomment(userDTO);
	}

	@Override
	public List<WishListDTO> wishlist(WishListDTO wish) {
		return dao.wishlist(wish);
	}

	@Override
	public List<WishListDTO> mylist(WishListDTO wish) {
		return dao.mylist(wish);
	}

	@Override
	public List<CatgDTO> findcategory(int movie_num) {
		return dao.findcategory(movie_num);
	}

	@Override
	public void insertwishlist(WishListDTO wish) {
		dao.insertwishlist(wish);
	}

	@Override
	public int findoverlap(WishListDTO wish) {
		return dao.findoverlap(wish);
	}

}
