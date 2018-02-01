package service;

import java.util.List;

import dto.CommentDTO;
import dto.LikeDTO;
import dto.MovieDTO;

public interface MovieService {
	public List<MovieDTO> movieInfoProcess(int page);
	public List<CommentDTO> commentListProcess(int movie_num);
	public List<MovieDTO> moviedetailProcess(int movie_num);
	public String likeProcess(LikeDTO dto);
	
	public void likeplusProcess(LikeDTO dto);
	public void likeminusProcess(LikeDTO dto);
	
	public void likeinsertProcess(LikeDTO dto);
	public void likedeleteProcess(LikeDTO dto);
	
	public void insertCommentProcess(CommentDTO dto);

	public List<MovieDTO> movieListProcess(String keyword);
	public int searchCountProcess(String keyword);
	public void addRating(int member_num, int movie_num, int rating);
	public MovieDTO BoxOfficeInsert(String name);
	public MovieDTO boxOffice(String name);
	public void BoxOfficeDirectorInsert(MovieDTO dto);
	public void BoxOfficeCategoryInsert(MovieDTO dto);
	public void BoxOfficeActorInsert(MovieDTO dto);
	
}
