package com.hanul.car;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import common.GeoPoint;
import common.GeoTrans;
import oil.MapVO;

@Controller
public class OilController {
	
	
	
		//주유소의 가격 가져오기
		@ResponseBody
		@RequestMapping("/compcode_search.oi")
		public List<MapVO> oilcompy_code(@RequestBody HashMap<String, String> map) {
			String compy_code = map.get("compy_code");
//			System.out.println(compy_code);
			String oil_url = "http://www.opinet.co.kr/api/detailById.do";
				
			StringBuilder url = new StringBuilder(oil_url);
			url.append("?code=F519190417");
			url.append("&id="+compy_code);
			url.append("&out=json");
			

			String result = url.toString();

			HttpURLConnection conn;
			try {
				conn = (HttpURLConnection) new URL(result).openConnection();
				conn.setRequestMethod("GET");
				conn.setRequestProperty("Content-type", "application/json");
//				System.out.println("Response code: " + conn.getResponseCode());
				BufferedReader rd;
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
				StringBuilder sb = new StringBuilder();
				String line;
				while ((line = rd.readLine()) != null) {
					sb.append(line);
				}
				rd.close();
				conn.disconnect();
				result = sb.toString();

			} catch (Exception e) {
				e.printStackTrace();
			}
			
			result = result.substring(result.indexOf("[")+2, result.indexOf("]") + 1).trim();
			result = result.substring(result.indexOf("["), result.indexOf("]") + 1).trim();
			JSONArray reader = new JSONArray(result);
			List<MapVO> list = new ArrayList<MapVO>();
			 
	         //reader.length();
	         
			 MapVO vo =null;
	         for(int i = 0; i < reader.length();i++) {
	        	String oil_price = "";
	            String oil_code = "";
	        	JSONObject row = reader.getJSONObject(i);
	        	oil_code = (String)row.getString("PRODCD");
	        	oil_price = String.valueOf(row.getInt("PRICE"));
	        	vo= new MapVO();
	        	 
				vo.setOil_code(oil_code);
				vo.setOil_price(oil_price);
				list.add(vo);
	         }
			 return list;
		 }
	
	//주변 주유소 목록 보기
	@ResponseBody @RequestMapping("/oillist.oi")
	public List<MapVO> oillist(@RequestBody HashMap<String, String> map) {
		String prodcd = map.get("prodcd");
		String st_x = map.get("x");
		String st_y = map.get("y");
		String st_radius = map.get("radius");
		int radius = Integer.parseInt(st_radius);
		double x = Double.parseDouble(st_x);
		double y = Double.parseDouble(st_y);
//		System.out.println(x);
//		System.out.println(y);
//		System.out.println(prodcd);
		
		GeoPoint in_pt = new GeoPoint(y, x);
		GeoPoint tm_pt = GeoTrans.convert(GeoTrans.GEO, GeoTrans.TM, in_pt);
		GeoPoint katec_pt = GeoTrans.convert(GeoTrans.TM, GeoTrans.KATEC, tm_pt);
		
		String x_tude = String.valueOf(katec_pt.getX());
        String y_tude = String.valueOf(katec_pt.getY());
		
				
		String oil_url = "https://www.opinet.co.kr/api/aroundAll.do";
		StringBuilder url = new StringBuilder(oil_url);
		url.append("?code=F519190417");
		url.append("&x=" + x_tude);
		url.append("&y=" + y_tude);
		url.append("&radius=" + radius);
		url.append("&sort=1");
		url.append("&prodcd=" + prodcd);
		url.append("&out=json");

		String result = url.toString();

		HttpURLConnection conn;
		try {
			conn = (HttpURLConnection) new URL(result).openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			BufferedReader rd;
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
			StringBuilder sb = new StringBuilder();
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			rd.close();
			conn.disconnect();
			result = sb.toString();

		} catch (Exception e) {
			e.printStackTrace();
		}


		result = result.substring(result.indexOf("["), result.indexOf("]") + 1).trim();
		JSONArray reader = new JSONArray(result);
		
		 
		List<MapVO> list = new ArrayList<MapVO>();
		 
         //reader.length();
//         System.out.println(reader.length());
         
		 MapVO vo =null;
         for(int i = 0; i < reader.length();i++) {
        	 String comp_code = "";
             String oil_code = "",oil_price = "",distance = "",gis_x = "",gis_y = "",comp_name = "";
             	 
        	 JSONObject row = reader.getJSONObject(i);
        	
                comp_code = (String)row.getString("UNI_ID");
                oil_code = (String)row.getString("POLL_DIV_CD");
                comp_name = (String)row.getString("OS_NM");
                comp_name = comp_name.contains("(주)") ? comp_name.substring(comp_name.indexOf("(주)")) :comp_name ;
                comp_name = comp_name.contains("㈜") ? comp_name.substring(comp_name.indexOf("㈜")) :comp_name ;
                oil_price = String.valueOf(row.getInt("PRICE"));
                gis_x = String.valueOf(row.getDouble("GIS_X_COOR"));
                gis_y = String.valueOf(row.getDouble("GIS_Y_COOR"));
                
                Double goole_x = Double.valueOf(gis_x);
                Double goole_y = Double.valueOf(gis_y);
                
                katec_pt = new GeoPoint(goole_x, goole_y);
                GeoPoint out_pt = GeoTrans.convert(GeoTrans.KATEC, GeoTrans.GEO, katec_pt);
                gis_x = String.valueOf(out_pt.getY());
                gis_y = String.valueOf(out_pt.getX());
                
                vo= new MapVO();
                
        	    vo.setComp_code(comp_code);
        	    vo.setOil_code(oil_code);
        	    vo.setComp_name(comp_name);
        	    vo.setOil_price(oil_price);
        	    vo.setGis_x(gis_x);
        	    vo.setGis_y(gis_y);
        	    list.add(vo);
        	 
         }
		return list;
	}
	//주유소검색 페이지
	@RequestMapping("/search.oi")
	public String oilSearch() {
		
		return "oil/oilsearch";
	}
	
}
