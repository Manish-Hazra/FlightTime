package com.xadmin.usermanagement.web;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.xadmin.usermanagement.dao.FlightDao;
import com.xadmin.usermanagement.bean.Flight;
import com.xadmin.usermanagement.bean.Login;



@WebServlet("/")
public class FlightServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FlightDao FlightDao;
	public void init() {
		FlightDao = new FlightDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();

		try {
			switch (action) {
			case "/new":
				showNewForm(request, response);
				break;
			case "/insert":
				insertFlight(request, response);
				break;
			case "/delete":
				deleteFlight(request, response);
				break;
			case "/edit":
				showEditForm(request, response);
				break;
			case "/update":
				updateFlight(request, response);
				break;
			case "/login":
				loginManager(request,response);
				break;
			case "/logout":
				logoutManager(request,response);
				break;
			case "/filtertime":
				filterTime(request,response);
				break;
			case "/filtercity":
				filterCity(request,response);
				break;
			case "/filtercitypage":
				filtercitypage(request,response);
				break;
			case "/listadmin":
				listAdmin(request,response);
				break;
			case "/sortlo":
				sortLO(request,response);
				break;
			default:
				listFlight(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}
	
	
	private void logoutManager(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("username");
		session.invalidate();
		response.sendRedirect("Login.jsp");
	}

	
	
	private void filtercitypage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("FlightFilterCityForm.jsp");
		dispatcher.forward(request, response);
	}

	
    private void filterCity(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    List <Flight> filterCityFlight=new ArrayList<Flight>();
    String departure_city = request.getParameter("departure_city");
	String arrival_city = request.getParameter("arrival_city");	
	String time = request.getParameter("time");
	
    if(arrival_city.trim()!="" && departure_city.trim()!="" && time.equals("day")) {
    	filterCityFlight=FlightDao.departureAndArrivalDay(departure_city.trim(),arrival_city.trim());
    }
    else if(arrival_city.trim()!="" && departure_city.trim()!="" && time.equals("night")) {
    	filterCityFlight=FlightDao.departureAndArrivalNight(departure_city.trim(),arrival_city.trim());
    }
    else if(arrival_city.trim()!="" && time.equals("day")) {
    	filterCityFlight=FlightDao.arrivalday(arrival_city.trim());
    }
    else if(arrival_city.trim()!="" && time.equals("night")){
    	filterCityFlight=FlightDao.arrivalnight(arrival_city.trim());
    }
    else if(departure_city.trim()!="" && time.equals("day")) {
    	filterCityFlight=FlightDao.departureday(departure_city.trim());
    }
    else if(departure_city.trim()!="" && time.equals("night")){
    	filterCityFlight=FlightDao.departurenight(departure_city.trim());
    }
    else if(time.equals("night")){
    	filterCityFlight=FlightDao.night();
    }
    else {
    	filterCityFlight=FlightDao.day();
    }
   	 request.setAttribute("filterCityFlight", filterCityFlight);
   	 RequestDispatcher dispatcher = request.getRequestDispatcher("FlightFilterCity.jsp");
   	 dispatcher.forward(request, response);
		
	}
	
	
	
	
     private void filterTime(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
    	 List<Flight> filterTimeFlight = FlightDao.filterFlight();
    	 request.setAttribute("filterFlight", filterTimeFlight);
    	 RequestDispatcher dispatcher = request.getRequestDispatcher("FlightFilterTime.jsp");
    	 dispatcher.forward(request, response);
		
	}
	
	

	private void loginManager(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String uname =request.getParameter("username");
		String password =request.getParameter("password");
		Login login = new Login();
		login.setUsername(uname);
		login.setPassword(password);
		
		if(FlightDao.validate(login)) {
			
			HttpSession session = request.getSession();
			session.setAttribute("username", uname);
			response.sendRedirect("listadmin");
		}
		else {
			response.sendRedirect("Login.jsp");
		}
		
	}
	private void listFlight(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Flight> listFlight = FlightDao.selectAllFlights();
		System.out.println("11");
		request.setAttribute("listFlight", listFlight);
		RequestDispatcher dispatcher = request.getRequestDispatcher("FlightListUser.jsp");
		dispatcher.forward(request, response);
	}

	private void listAdmin(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Flight> listFlight = FlightDao.selectAllFlights();
		System.out.println("11");
		request.setAttribute("listFlight", listFlight);
		RequestDispatcher dispatcher = request.getRequestDispatcher("FlightList.jsp");
		dispatcher.forward(request, response);
	}
	
	
	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("FlightForm.jsp");
		dispatcher.forward(request, response);
	}

	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Flight flight = FlightDao.selectFlight(id);
		System.out.print(flight);
		RequestDispatcher dispatcher = request.getRequestDispatcher("FlightForm.jsp");
		request.setAttribute("flight", flight);
		dispatcher.forward(request, response);

	}

	private void insertFlight(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		String departure_city = request.getParameter("departure_city");
		String arrival_city = request.getParameter("arrival_city");
		int cost = Integer.parseInt(request.getParameter("cost"));
		int stops = Integer.parseInt(request.getParameter("stops"));
		String start_time = request.getParameter("start_time");
		String end_time = request.getParameter("end_time");
		String departure_time = request.getParameter("departure_time");
		String arrival_time = request.getParameter("arrival_time");
		Flight newFlight = new Flight(departure_city, arrival_city, cost, start_time, end_time,departure_time,arrival_time, stops );
		FlightDao.insertFlight(newFlight);
		response.sendRedirect("listadmin");
	}

	private void updateFlight(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String departure_city = request.getParameter("departure_city");
		String arrival_city = request.getParameter("arrival_city");
		int cost = Integer.parseInt(request.getParameter("cost"));
		String start_time = request.getParameter("start_time");
		String end_time = request.getParameter("end_time");
		String departure_time = request.getParameter("departure_time");
		String arrival_time = request.getParameter("arrival_time");
		int stops = Integer.parseInt(request.getParameter("stops"));
		Flight updatedFlight = new Flight(id,departure_city, arrival_city, cost, start_time, end_time,departure_time,arrival_time, stops );
		FlightDao.updateFlight(updatedFlight);
		response.sendRedirect("listadmin");
	}

	private void deleteFlight(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		FlightDao.deleteFlight(id);
		response.sendRedirect("listadmin");

	}
	private void sortLO(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException, ServletException {
		List<Flight> listFlight = FlightDao.sortLegs();
		System.out.println("11");
		request.setAttribute("listFlight", listFlight);
		RequestDispatcher dispatcher = request.getRequestDispatcher("FlightLOSorted.jsp");
		dispatcher.forward(request, response);

	}

}