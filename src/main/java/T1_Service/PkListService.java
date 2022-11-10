package T1_Service;

import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import T1_Dao.PkDao;
import T1_Dto.package_info;

	
public class PkListService {

	PkDao pkdao ;
	
	//injection(dao받기)
	public void setPkDao(PkDao pkdao) {
		this.pkdao = pkdao ;
	}
	
	//서비스이므로 public, 패키지상품목록을 서비스 할 것 
	public String getListPk(String no){
		
		PkDao dao = new PkDao();
		no = "Pj123";
		no = "PA987";
		no= "PU456";
		package_info pk = pkdao.pk(no);		
		//JSONArray jArray = new JSONArray();
		
		JSONObject json = new JSONObject();
		json.put("pk_num", pk.getPk_num());
		json.put("pk_name",pk.getPk_name());
		json.put("schedule",pk.getSchedule());
		json.put("departure",pk.getDeparture());
		json.put("destination",pk.getDestination());
		json.put("price" , pk.getPrice());
		json.put("trv_place",pk.getTrv_place());
		json.put("ht_key",pk.getHt_key());
					 
		//response.getWriter().print( result); 페이지 이동없이데이터만 변경
		return json.toString();
	}

	//상세페이지위한 메서드 (패키지인포하나만 반환)
	public package_info getdetailPk(String pk_num) {
		
		package_info info = pkdao.pk(pk_num);
		return info;

	}
	
}	
	

	