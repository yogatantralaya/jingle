package com.pdp.finalproject.jingle.servlets;

import java.io.IOException;
import java.time.LocalTime;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pdp.finalproject.jingle.models.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/login.jsp");
		dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
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

				else if ((hours >= 12) && (hours < 16)) {
					greetings = "Good Afternoon,";
				}

				else if ((hours >= 16) && (hours < 22)) {
					greetings = "Good Evening,";
				}

				else {
					greetings = "Stay Tuned,";
				}

				User userDetails = dbUtil.getUserDetails(user);
				request.setAttribute("User_Details", userDetails);
				request.setAttribute("Greetings", greetings);
				request.removeAttribute("loginError");
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/homeNew.jsp");
				dispatcher.forward(request, response);
				
			} else {
				request.setAttribute("loginError", "Incorrect email or password");
				response.sendRedirect("LoginServlet");
			}
		} catch (Exception exec) {
			exec.printStackTrace();
		}

	}
}
