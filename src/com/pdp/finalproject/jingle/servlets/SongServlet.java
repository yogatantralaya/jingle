package com.pdp.finalproject.jingle.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.pdp.finalproject.jingle.models.Song;

@WebServlet("/SongServlet")
public class SongServlet extends BaseServlet {

	private static final long serialVersionUID = -9044881493952948918L;

	public SongServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String requestType = request.getParameter("requestType");
			String userId = request.getParameter("userId");
			List<Song> songList = new ArrayList<>();

			switch (requestType) {
			case "trendingSongs": {
				songList = dbUtil.getTrendingSongs();
				break;
			}
			case "recentlyPlayed": {
				songList = dbUtil.getTrendingSongs();
				break;
			}
			case "recommended": {
				songList = dbUtil.getTrendingSongs();
				break;
			}
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
