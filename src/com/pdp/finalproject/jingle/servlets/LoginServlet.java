package com.pdp.finalproject.jingle.servlets;

import java.io.IOException;
import java.time.LocalTime;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pdp.finalproject.jingle.models.Artist;
import com.pdp.finalproject.jingle.models.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private int loginAttempts = 0;

	public LoginServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// get the command parameter from the request
			String com = request.getParameter("command");
			// if the parameter return null set it to list in order to avoid null pointer
			// exception
			if (com == null) {
				com = "LOAD";
			}
			// based on the value of the command parameter call the respective function
			switch (com) {
			case "LOAD": {
				load(request, response);
				break;
			}
			case "LOGIN": {
				login(request, response);
				break;
			}
			case "REGISTER": {
				register(request, response);
				break;
			}
			default: {
				load(request, response);
			}
			}
		} catch (Exception exec) {
			throw new ServletException(exec);
		}
	}

	private void load(HttpServletRequest request, HttpServletResponse response) throws Exception {
		RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/login.jsp");
		dispatcher.forward(request, response);
	}

	private void login(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// get the form data
		String email = request.getParameter("email").toLowerCase();
		String password = request.getParameter("password").toLowerCase();

		User user = new User(email, password);

		boolean userExists = dbUtil.findUser(user);
		if (userExists) {
			LocalTime currentTime = LocalTime.now();

			// Get the hours alone
			int hours = currentTime.getHour();
			String greetings;

			if ((hours >= 6) && (hours < 12)) {
				greetings = "Good Morning,";
			}

			if ((hours >= 12) && (hours < 4)) {
				greetings = "Good Afternoon,";
			}

			if ((hours >= 4) && (hours < 10)) {
				greetings = "Good Evening,";
			}

			else {
				greetings = "Good Night,";
			}

			// Print the hours alone
			loginAttempts = 0;
			User userDetails = dbUtil.getUserDetails(user);
			request.setAttribute("User_Details", userDetails);
			request.setAttribute("Greetings", greetings);
			request.removeAttribute("loginError");
			home(request, response);
		} else {
			loginAttempts++;
			if (loginAttempts < 3) {
				request.setAttribute("loginError", "Incorrect email or password");
				load(request, response);
			} else {
				HttpSession session = request.getSession();
				session.invalidate();
				response.sendRedirect("jsp/login.jsp?errorMessage=Account locked. Too many incorrect login attempts.");
			}
		}

	}

	private void register(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// get the form data
		String firstName = request.getParameter("firstName").toLowerCase();
		String lastName = request.getParameter("lastName").toLowerCase();
		String email = request.getParameter("email").toLowerCase();
		String password = request.getParameter("password").toLowerCase();
		String location = request.getParameter("location").toLowerCase();
		String dp = "media/default_dp.png";

		// create a user object
		User user = new User(null, firstName, lastName, email, password, location, dp);

		// find email id
		boolean mailExists = dbUtil.findEmail(email);

		request.removeAttribute("emailError");

		if (mailExists) {
			request.setAttribute("emailError", "Email id already exists!");
			request.setAttribute("UserDetails", user);
			RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/register.jsp");
			dispatcher.forward(request, response);
		}

		else {
			// call the registerUser method in the dbUtil class to register the new
			// user to the userDb
			dbUtil.registerUser(user);

			// to go back to the login page
			request.setAttribute("registrationSuccessful", "Registration Successful, Pls Login");
			load(request, response);
		}

	}

	private void home(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Artist> artistList = dbUtil.getArtists();
		request.setAttribute("Artist_List", artistList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/homeNew.jsp");
		dispatcher.forward(request, response);
	}

}
