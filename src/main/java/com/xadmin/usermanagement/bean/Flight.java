package com.xadmin.usermanagement.bean;

public class Flight {
	private int id;
	private String departure_city;
	private String arrival_city;
	private int cost;
	private String start_time;
	private String end_time;
	private String departure_time;
	private String arrival_time;
	private int stops;
	
	
	public Flight() {}
	
	
	
	
	
	public Flight(String departure_city, String arrival_city, int cost, String start_time, String end_time,
			String departure_time, String arrival_time, int stops) {
		super();
		this.departure_city = departure_city;
		this.arrival_city = arrival_city;
		this.cost = cost;
		this.start_time = start_time;
		this.end_time = end_time;
		this.departure_time = departure_time;
		this.arrival_time = arrival_time;
		this.stops = stops;
	}



	public Flight(int id, String departure_city, String arrival_city, int cost, String start_time, String end_time,
			String departure_time, String arrival_time, int stops) {
		super();
		this.id = id;
		this.departure_city = departure_city;
		this.arrival_city = arrival_city;
		this.cost = cost;
		this.start_time = start_time;
		this.end_time = end_time;
		this.departure_time = departure_time;
		this.arrival_time = arrival_time;
		this.stops = stops;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDeparture_city() {
		return departure_city;
	}
	public void setDeparture_city(String departure_city) {
		this.departure_city = departure_city;
	}
	public String getArrival_city() {
		return arrival_city;
	}
	public void setArrival_city(String arrival_city) {
		this.arrival_city = arrival_city;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public String getDeparture_time() {
		return departure_time;
	}
	public void setDeparture_time(String departure_time) {
		this.departure_time = departure_time;
	}
	public String getArrival_time() {
		return arrival_time;
	}
	public void setArrival_time(String arrival_time) {
		this.arrival_time = arrival_time;
	}
	public int getStops() {
		return stops;
	}
	public void setStops(int stops) {
		this.stops = stops;
	}
	
	

}
