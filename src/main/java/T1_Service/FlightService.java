package T1_Service;

import java.util.ArrayList;

import T1_Dao.FlightDao;
import T1_Dto.Flight;

public class FlightService {

	FlightDao dao;
	
	public FlightService() {}
	
	public FlightService(FlightDao dao) {
		this.dao = dao;
	}
	
	public ArrayList<Flight> flightlist() {
		ArrayList<Flight> flightlist = new ArrayList<>();
		flightlist = this.dao.list();
		return flightlist;
	}
	
	
	
	public static void main(String[] args) {
		
		FlightService service = new FlightService( new FlightDao());
		ArrayList<Flight>  list  = service.flightlist();
			
		
		for( Flight flight: list) {
			System.out.println( flight);
		}
	}
	
}
