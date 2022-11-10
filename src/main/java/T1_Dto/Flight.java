package T1_Dto;

public class Flight {

	String flight_num;
	String dep_date;
	String dep_time;
	String des_date;
	String des_time;
	String flight_time;
	String airline;
	String alrline_class;
	String dep_place;
	String des_place;
	
	public Flight(String flight_num, String dep_date, String dep_time, String des_date, String des_time,
			String flight_time, String airline, String alrline_class, String dep_place, String des_place) {
		super();
		this.flight_num = flight_num;
		this.dep_date = dep_date;
		this.dep_time = dep_time;
		this.des_date = des_date;
		this.des_time = des_time;
		this.flight_time = flight_time;
		this.airline = airline;
		this.alrline_class = alrline_class;
		this.dep_place = dep_place;
		this.des_place = des_place;
	}
	
	public String getFlight_num() {
		return flight_num;
	}
	public void setFlight_num(String flight_num) {
		this.flight_num = flight_num;
	}
	public String getDep_date() {
		return dep_date;
	}
	public void setDep_date(String dep_date) {
		this.dep_date = dep_date;
	}
	public String getDep_time() {
		return dep_time;
	}
	public void setDep_time(String dep_time) {
		this.dep_time = dep_time;
	}
	public String getDes_date() {
		return des_date;
	}
	public void setDes_date(String des_date) {
		this.des_date = des_date;
	}
	public String getDes_time() {
		return des_time;
	}
	public void setDes_time(String des_time) {
		this.des_time = des_time;
	}
	public String getFlight_time() {
		return flight_time;
	}
	public void setFlight_time(String flight_time) {
		this.flight_time = flight_time;
	}
	public String getAirline() {
		return airline;
	}
	public void setAirline(String airline) {
		this.airline = airline;
	}
	public String getAlrline_class() {
		return alrline_class;
	}
	public void setAlrline_class(String alrline_class) {
		this.alrline_class = alrline_class;
	}
	public String getDep_place() {
		return dep_place;
	}
	public void setDep_place(String dep_place) {
		this.dep_place = dep_place;
	}
	public String getDes_place() {
		return des_place;
	}
	public void setDes_place(String des_place) {
		this.des_place = des_place;
	}

	@Override
	public String toString() {
		return "Flight [flight_num=" + flight_num + ", dep_date=" + dep_date + ", dep_time=" + dep_time + ", des_date="
				+ des_date + ", des_time=" + des_time + ", flight_time=" + flight_time + ", airline=" + airline
				+ ", alrline_class=" + alrline_class + ", dep_place=" + dep_place + ", des_place=" + des_place + "]";
	}
	
}
