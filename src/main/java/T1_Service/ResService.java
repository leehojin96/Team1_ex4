package T1_Service;

import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import T1_Dao.ResDao;
import T1_Dto.Res;

public class ResService {
	ResDao resdao;

	public ResService() {
	}

	public ResService(ResDao resdao) {
		this.resdao = resdao;
	}
	public void setResDao(ResDao resdao) {
		this.resdao = resdao;
	}
	
	public String getResList(String pay_code) {
		ArrayList<Res> reslist = resdao.res(pay_code);
		JSONArray list = new JSONArray();
		
		for(Res res : reslist) {
			JSONObject json = new JSONObject();
			json.put("res_code", res.getRes_code());
			json.put("pay_code", res.getPay_code());
			json.put("name", res.getName());
			json.put("eng_name", res.getEng_name());
			json.put("birth", res.getBirth());
			json.put("phone", res.getPhone());
			json.put("gender", res.getGender());
			list.add(json);
		}
		JSONObject result = new JSONObject();
		result.put("result", list);
		
		return result.toString();
	}
	public static void main(String[]args) {
		ResDao resdao = new ResDao();
		ResService resservice = new ResService(resdao);
		
		String st = resservice.getResList("tuy765@naver.com");
		System.out.print(st);
	}
	
	
}
