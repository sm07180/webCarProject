package com.hanul.car;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import common.TranslateXY;
import common.TranslatexyVO;
import member.MemberDAO;
import member.MemberVO;
import mymanage.ManageService;
import myrecord.RecordVO;

@Controller
public class MycarController {
	@Autowired
	private ManageService service;

	// 오늘 시간 만들기
	private String time() {
		SimpleDateFormat sdf2 = new SimpleDateFormat("kkmm");
		Date now = new Date();
		int val = Integer.parseInt(sdf2.format(now));
		if (val >= 210 && val <= 510) {
			return "0200";
		} else if (val > 510 && val <= 810) {
			return "0500";
		} else if (val > 810 && val <= 1110) {
			return "0800";
		} else if (val > 1110 && val <= 1410) {
			return "1100";
		} else if (val > 1410 && val <= 2010) {
			return "1400";
		} else if (val > 2010 && val <= 2310) {
			return "1700";
		} else {
			return "2300";
		}
	}

	// 오늘의 날씨를 알아보자
	@ResponseBody
	@RequestMapping("/weather.my")
	public String[] weather(@RequestBody HashMap<String, String> map) {
		String x = map.get("x");
		String y = map.get("y");

		double weather_x = Double.parseDouble(x);
		double weather_y = Double.parseDouble(y);
		TranslateXY xy = new TranslateXY();
		TranslatexyVO vo = xy.getTransXY(weather_x, weather_y);
		String weather_xx = String.valueOf(vo.getX());
		String weather_yy = String.valueOf(vo.getY());

		int fcstValue;
		String today_weather = "";

		/*
		 * http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/
		 * ForecastSpaceData?ServiceKey=
		 * 1oLS8rsU8PJgMtE6w%2BObNMM9dRIt6LKViXokg5%2Fe3j9OPopWAst%
		 * 2FH3fOwBm5UDe50U81YCk1S3%2B5319jyw0mEg%3D%3D%3D&
		 * base_date=20190606&base_time=1400&nx=59&ny=74&_type=json
		 */

		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMdd");
		// 성민
		String key = "Xy5yLMuI2f9%2Fz7KtvVjEKEOZraKkf0%2F10rrIHZI4yG5ZnLEi2l%2BLB1%2BInn1PRTGuLmzUtQonrLUfoj1BvlBpaA%3D%3D";
		// 처리
		String key2 = "7yVeHeB4RQMlqi6UOTxYhZ5Px5Est6psR%2F66FQBNsBaaUzE5nV5yU0lEVGqw1s2dQwuI0dIu3T4KMw0cswBaFw%3D%3D";
		Date now = new Date();
		String urlstr = "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastSpaceData";
		String ServiceKey = "?ServiceKey=" + key;
		String date = "&base_date=" + sdf1.format(now);
		String time = "&base_time=" + time();
		String nx_ny = "&nx=" + weather_xx + "&ny=" + weather_yy;
		String type = "&_type=json";

		String total_url = urlstr + ServiceKey + date + time + nx_ny + type;
		String result = "";
		HttpURLConnection conn;
		try {
			conn = (HttpURLConnection) new URL(total_url).openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			// System.out.println("Response code: " + conn.getResponseCode());
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
		if (result.equals("[]")) {
			result = result.substring(result.indexOf("["), result.indexOf("]") + 1).trim();

			JSONArray jsonArray = new JSONArray(result);
			for (int i = 0; i < jsonArray.length(); i++) {
				JSONObject row = jsonArray.getJSONObject(i);
				String category = (String) row.getString("category");

				if (category.equals("SKY")) {
					fcstValue = row.getInt("fcstValue");
					today_weather += String.valueOf(fcstValue) + ",";
				} else if (category.equals("PTY")) {
					fcstValue = row.getInt("fcstValue");
					today_weather += String.valueOf(fcstValue) + ",";
				} else if (category.equals("T3H")) {
					fcstValue = row.getInt("fcstValue");
					today_weather += String.valueOf(fcstValue);
				}
			}

		} else {
			today_weather = "0,1,27,";
		}
		String test = "0,1,27,";
		String[] list = today_weather.split(",");
		return list;
	}

	// 차량관리
	@RequestMapping("/manage.my")
	public String manage(Model model, HttpSession session) {
		String user_id = ((MemberVO) session.getAttribute("login_info")).getUser_id();
		String car_name = ((MemberVO) session.getAttribute("login_info")).getCar_name();

//		System.out.println(car_name);
		String efficiency = service.efficiency(car_name);
		model.addAttribute("efficiency", efficiency);
//		System.out.println(efficiency);

		RecordVO vo = new RecordVO();
		vo = service.mycar_eff(user_id);

		// 만족도, 연비순위
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("user_id", user_id);
		map.put("car_name", car_name);

		// 오너연비
		int oil_cost = Integer.parseInt(vo.getOil_cost());

		if (vo.getAvg_mileage() != 0) {
			DecimalFormat df = new DecimalFormat("#.0");
			double result = (vo.getAvg_mileage() + Integer.parseInt(efficiency)) / 2;
			model.addAttribute("rank", service.rank(map));

			double my_money = oil_cost / result;
			model.addAttribute("result", df.format(result));
			model.addAttribute("my_money", df.format(my_money));
		} else {
			model.addAttribute("result", efficiency);
			model.addAttribute("rank", "-");
			model.addAttribute("my_money", "-");
		}

		model.addAttribute("vo", service.mycar_manage_list(user_id));

		return "mymanage/manage";
	}

	// 통계
	@RequestMapping("/chart.my")
	public String chart() {

		return "mychart/chart";
	}

}
