package service;

import java.util.List;

import dto.CommentDTO;
import dto.MovieDTO;

public interface MovieService {
	public List<MovieDTO> movieInfoProcess();
	public List<CommentDTO> commentListMethod(int movie_num);

}
