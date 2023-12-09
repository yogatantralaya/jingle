package com.pdp.jingle.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.pdp.jingle.models.Song;

@WebServlet("/SongServlet")
public class SongServlet extends BaseServlet {

	private static final long serialVersionUID = -9044881493952948918L;

	public SongServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session == null) {
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("url", "/LoginServlet");
			String errorResponse = new Gson().toJson(jsonObject);
			PrintWriter out = response.getWriter();
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			out.print(errorResponse);
			out.flush();
		} else {
			try {
				String requestType = request.getParameter("requestType");
				String searchQuery = request.getParameter("searchQuery");
				String userId = request.getParameter("userId");
				List<Song> songList = new ArrayList<>();

				if (requestType != null) {
					switch (requestType) {
					case "trendingSongs": {
						songList = dbUtil.getTrendingSongs();
						break;
					}
					case "recentlyPlayed": {
						songList = dbUtil.getRecentlyPlayedSongs(userId);
						break;
					}
					case "recommended": {
						songList = dbUtil.getTrendingSongs();
						break;
					}
					}
				}

				if (searchQuery != null) {
					songList = dbUtil.searchSong(searchQuery);
				}

				String songsJsonString = new Gson().toJson(songList);
				PrintWriter out = response.getWriter();
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				out.print(songsJsonString);
				out.flush();
			} catch (Exception exec) {
				throw new ServletException(exec);
			}
		}
	}

}
