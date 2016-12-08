package ui.controller.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.model.Spot;
import domain.model.User;

public class GetOccupiedSpotsHandler extends RequestHandler	{

	@Override
	public void handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Spot> spots = this.getService().getOccupiedSpots();
		request.setAttribute("spots", spots);
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		if (user!=null) {
			request.setAttribute("userid", user.getUserID());
		}

		request.getRequestDispatcher("spotoverview.jsp").forward(request, response);
	}
}
