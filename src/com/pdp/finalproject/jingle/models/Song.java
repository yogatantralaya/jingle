package com.pdp.finalproject.jingle.models;

public class Song {

	String id;
	String title;
	String genre;
	String duration;
	String location;
	String albumCover;
	String artist;

	public Song(String id, String title, String genre, String duration, String location, String albumCover,
			String artist) {
		this.id = id;
		this.title = title;
		this.genre = genre;
		this.duration = duration;
		this.location = location;
		this.albumCover = albumCover;
		this.artist = artist;
	}

	public String getId() {
		return id;
	}

	public String getTitle() {
		return title;
	}

	public String getGenre() {
		return genre;
	}

	public String getDuration() {
		return duration;
	}

	public String getLocation() {
		return location;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getAlbumCover() {
		return albumCover;
	}

	public void setAlbumCover(String albumCover) {
		this.albumCover = albumCover;
	}

}
