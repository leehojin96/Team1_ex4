package T1_Service;

import java.util.ArrayList;

import T1_Dao.PackageDao;

public class PackageService {

	PackageDao dao;
	
	public PackageService() {}
	
	public PackageService(PackageDao dao) {
		this.dao = dao;
	}
	
	public ArrayList<T1_Dto.Package> packagelist() {
		ArrayList<T1_Dto.Package> list = new ArrayList<>();
		list = this.dao.packagelist();
		return list;
	}
	
}
