package ui.controller.handler;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.NotAuthorizedException;

import domain.model.RoleEnum;
import domain.model.User;
import domain.service.Service;

public abstract class RequestHandler {

	protected Service service;

	public RequestHandler() {}

	public final void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, MessagingException {
		this.checkRole(request);
		this.handleRequest(request, response);
		
	}

	public abstract void handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, MessagingException;

	private void checkRole(HttpServletRequest request) {
		if (this.getAccesList() == null) {
			return;
		}
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (user == null) {
			throw new NotAuthorizedException("Insufficient rights");
		}
		for (RoleEnum role : this.getAccesList()) {
			if (user.getRole().equals(role)) {
				return;
			}
		}
		throw new NotAuthorizedException("Insufficient rights");
	}

	public RoleEnum[] getAccesList() {
		return null;
	}

	public void setService(Service service) {
		this.service = service;
	}

	protected Service getService() {
		return service;
	}
}
