package T1_BinResServlet;

public class ResCustomerService {
	
	ResCustomerDao dao;
	
	public ResCustomerService() {
		// TODO Auto-generated constructor stub
	}
	public ResCustomerService(ResCustomerDao dao) {
		this.dao = dao;
	}
	
	public void insert(ResCustomer cusomer) {
		dao.insert(cusomer);
	}

}