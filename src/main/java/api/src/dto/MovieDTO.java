package api.src.dto;

import java.util.ArrayList;
import java.util.Date;

public class MovieDTO {
	private int movie_num;
	private String movie_kor_title;
	private String movie_eng_title;
	private Date movie_opening_date;
	private String movie_summary;
	private String movie_image;
	private String movie_url;
	private ArrayList<DirectorDTO> movie_director = new ArrayList<DirectorDTO>();
	private ArrayList<ActorDTO> movie_actor = new ArrayList<ActorDTO>();
	private String movie_rating;
	private ArrayList<CategoryDTO> category = new ArrayList<CategoryDTO>();
	private String nation;

	public int getMovie_num() {
		return movie_num;
	}

	public void setMovie_num(int movie_num) {
		this.movie_num = movie_num;
	}

	public String getMovie_kor_title() {
		return movie_kor_title;
	}

	public void setMovie_kor_title(String movie_kor_title) {
		this.movie_kor_title = movie_kor_title;
	}

	public String getMovie_eng_title() {
		return movie_eng_title;
	}

	public void setMovie_eng_title(String movie_eng_title) {
		this.movie_eng_title = movie_eng_title;
	}

	public Date getMovie_opening_date() {
		return movie_opening_date;
	}

	public void setMovie_opening_date(Date movie_opening_date) {
		this.movie_opening_date = movie_opening_date;
	}

	public String getMovie_summary() {
		return movie_summary;
	}

	public void setMovie_summary(String movie_summary) {
		this.movie_summary = movie_summary;
	}

	public String getMovie_image() {
		return movie_image;
	}

	public void setMovie_image(String movie_image) {
		this.movie_image = movie_image;
	}

	public String getMovie_url() {
		return movie_url;
	}

	public void setMovie_url(String movie_url) {
		this.movie_url = movie_url;
	}

	public ArrayList<DirectorDTO> getMovie_director() {
		return movie_director;
	}

	public void addMovie_director(DirectorDTO movie_director) {
		this.movie_director.add(movie_director);
	}

	public ArrayList<ActorDTO> getMovie_actor() {
		return movie_actor;
	}

	public void addMovie_actor(ActorDTO movie_actor) {
		this.movie_actor.add(movie_actor);
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getMovie_rating() {
		return movie_rating;
	}

	public void setMovie_rating(String movie_rating) {
		this.movie_rating = movie_rating;
	}

	public ArrayList<CategoryDTO> getCategory() {
		return category;
	}

	public void addCategory(CategoryDTO category) {
		this.category.add(category);
	}
}
