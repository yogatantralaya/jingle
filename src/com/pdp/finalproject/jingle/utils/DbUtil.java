package com.pdp.finalproject.jingle.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.pdp.finalproject.jingle.models.Artist;
import com.pdp.finalproject.jingle.models.Song;
import com.pdp.finalproject.jingle.models.User;

public class DbUtil {

	DataSource dataSource;

	// Servlet will pass on the connection pool to the dataSource variable in
	// dbUtil class
	public DbUtil(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	// findUser() method validates if the user already exists on the db
	public boolean findUser(User user) throws Exception {

		// initialize the sql attributes
		Connection myCon = null;
		PreparedStatement myStmt = null;
		ResultSet myRes = null;

		try {

			// create a connection
			myCon = dataSource.getConnection();

			// prepare the statement
			String query = "select * from user where user_email=? AND user_password=?";
			myStmt = myCon.prepareStatement(query);

			myStmt.setString(1, user.getEmail());
			myStmt.setString(2, user.getPassword());

			// execute query
			myRes = myStmt.executeQuery();

			// get the student details and create a student object
			if (myRes.next()) {
				return true;
			}
			return false;
		}

		finally {
			closeConnection(myCon, myStmt, myRes);
		}

	}

	public User getUserDetails(User user) throws Exception {

		// initialize the sql attributes
		Connection myCon = null;
		PreparedStatement myStmt = null;
		ResultSet myRes = null;

		try {

			// create a connection
			myCon = dataSource.getConnection();

			// prepare the statement
			String query = "select * from user where user_email=? AND user_password=?";
			myStmt = myCon.prepareStatement(query);

			myStmt.setString(1, user.getEmail());
			myStmt.setString(2, user.getPassword());

			// execute query
			myRes = myStmt.executeQuery();

			// get the student details and create a student object
			if (myRes.next()) {
				String id = myRes.getString("user_id");
				String firstName = myRes.getString("user_first_name");
				String lastName = myRes.getString("user_last_name");
				String email = myRes.getString("user_email");
				String password = myRes.getString("user_password");
				String location = myRes.getString("user_location");
				String dp = myRes.getString("user_dp_location");

				User userDetails = new User(id, firstName, lastName, email, password, location, dp);

				return userDetails;
			}
			return null;
		}

		finally {
			closeConnection(myCon, myStmt, myRes);
		}

	}

	// findEmail() method validates if the mail id already exists on the db
	public boolean findEmail(String email) throws Exception {
		// initialize the sql attributes
		Connection myCon = null;
		PreparedStatement myStmt = null;
		ResultSet myRes = null;

		try {

			// create a connection
			myCon = dataSource.getConnection();

			// prepare the statement
			String query = "select * from user where user_email=?";
			myStmt = myCon.prepareStatement(query);

			myStmt.setString(1, email);

			// execute query
			myRes = myStmt.executeQuery();

			// get the student details and create a student object
			if (myRes.next()) {
				return true;
			}
			return false;
		}

		finally {
			closeConnection(myCon, myStmt, myRes);
		}
	}

	// registerUser() method adds a new user to the Db
	public void registerUser(User user) throws Exception {
		Connection myCon = null;
		PreparedStatement myStmt = null;

		try {
			// create a connection to the db
			myCon = dataSource.getConnection();
			// create an sql statement
			String query = "INSERT INTO user"
					+ "(user_first_name,user_last_name,user_email,user_password,user_location,user_dp_location)"
					+ "values(?,?,?,?,?,?)";
			myStmt = myCon.prepareStatement(query);

			// setting the values for the place holders
			myStmt.setString(1, user.getFirstName());
			myStmt.setString(2, user.getLastName());
			myStmt.setString(3, user.getEmail());
			myStmt.setString(4, user.getPassword());
			myStmt.setString(5, user.getLocation());
			myStmt.setString(6, user.getDp());

			myStmt.execute();

		} finally {
			// close the connection
			closeConnection(myCon, myStmt, null);
		}

	}

	public List<Artist> getArtists() throws Exception {

		List<Artist> artistList = new ArrayList<>();
		Connection myCon = null;
		PreparedStatement myStmt = null;
		ResultSet myRes = null;

		try {
			// create a connection
			myCon = dataSource.getConnection();

			// prepare the statement
			String query = "select * from artist";
			myStmt = myCon.prepareStatement(query);

			// execute query
			myRes = myStmt.executeQuery();

			// get the student details and create a student object
			while (myRes.next()) {
				String id = myRes.getString("artist_id");
				String firstName = myRes.getString("artist_first_name");
				String lastName = myRes.getString("artist_last_name");
				String location = myRes.getString("artist_photo");

				Artist artist = new Artist(id, firstName, lastName, location);

				artistList.add(artist);

			}

		} finally {
			// close the connection
			closeConnection(myCon, myStmt, null);
		}
		return artistList;
	}

	public List<Song> getTrendingSongs() throws Exception {

		List<Song> songList = new ArrayList<>();
		Connection myCon = null;
		PreparedStatement myStmt = null;
		ResultSet myRes = null;

		try {
			// create a connection
			myCon = dataSource.getConnection();

			// prepare the statement
			String query = "select s.*, a.album_cover_location from song s join (\n" + "select song_id from \n"
					+ "song_history\n" + "where\n" + "listen_date > DATE_SUB(current_timestamp, INTERVAL 10 DAY)\n"
					+ "group by song_id\n" + "order by count(song_id) desc limit 3) sh\n"
					+ "on s.song_id = sh.song_id\n" + "join album_song_mapper asm\n" + "on s.song_id = asm.song_id\n"
					+ "join album a\n" + "on asm.album_id = a.album_id\n" + ";";
			myStmt = myCon.prepareStatement(query);

			// execute query
			myRes = myStmt.executeQuery();

			// get the student details and create a student object
			while (myRes.next()) {
				String id = myRes.getString("song_id");
				String title = myRes.getString("song_title");
				String genre = myRes.getString("song_genre");
				String duration = myRes.getString("song_duration");
				String location = myRes.getString("song_location");
				String albumCover = myRes.getString("album_cover_location");

				Song song = new Song(id, title, genre, duration, location,
						albumCover != null ? albumCover : "media/deafult_album_cover.jpg", null);

				songList.add(song);

			}

		} finally {
			// close the connection
			closeConnection(myCon, myStmt, null);
		}
		return songList;
	}

	private void closeConnection(Connection myCon, Statement myStmt, ResultSet myRes) throws SQLException {
		try {
			if (myStmt != null) {
				myStmt.close();
			}
			if (myRes != null) {
				myRes.close();
			}
			if (myCon != null) {
				myCon.close();// this will not necessarily close the db connection but will return the
								// connection pool
			}
		} catch (Exception exec) {
			exec.printStackTrace();
		}
	}

}
