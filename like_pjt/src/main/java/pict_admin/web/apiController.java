package pict_admin.web;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import pict_admin.service.PictService;
import pict_admin.service.PictVO;
import pict_admin.service.AdminService;
import pict_admin.service.AdminVO;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.json.JSONArray;

import org.apache.commons.codec.binary.Base64;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class apiController {
	@Resource(name = "pictService")
	private PictService pictService;
	
	@Resource(name = "adminService")
	private AdminService adminService;
	
	@GetMapping("api/inventory_list.do")
	@ResponseBody
	public void inventory_list(HttpServletResponse response, HttpServletRequest request, @ModelAttribute("searchVO") PictVO pictVO, ModelMap model, @ModelAttribute("adminVO") AdminVO adminVO) throws Exception {
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("Content-Type", "application/xml");
		response.setContentType("text/xml;charset=UTF-8");
		response.setCharacterEncoding("utf-8");
		response.setHeader("Access-Control-Allow-Methods", "GET");
		
		String user_id = request.getParameter("user_id");
		String type = request.getParameter("type");
		
		pictVO.setUser_id(user_id);
		pictVO.setType(type);
		ArrayList<Map<String, Object>> list = new ArrayList();
		
		if(type.equals("badge")) {
			List<PictVO> badgeList = pictService.api_get_badge(pictVO);
			for(PictVO a : badgeList){
				Map<String, Object> map = new HashMap<>();
				map.put("key_id" , a.getKey_id()); 
				map.put("user_id" , a.getUser_id());
				map.put("title" , a.getTitle());
				map.put("content" , a.getContent());
				map.put("reg_date" , a.getReg_date());
				list.add(map);
			}
			
		}
		else if(type.equals("coin")) {
			System.out.println(":::::::::::::coin");
			List<PictVO> coinList = pictService.api_get_coin(pictVO);
			for(PictVO a : coinList){
				Map<String, Object> map = new HashMap<>();
				map.put("key_id" , a.getKey_id()); 
				map.put("user_id" , a.getUser_id());
				map.put("title" , a.getTitle());
				map.put("content" , a.getContent());
				map.put("coin_text" , a.getCoin_text());
				map.put("reg_date" , a.getReg_date());
				map.put("type" , a.getType());
				list.add(map);
			}
		}
		
		System.out.println(list);
		
		PrintWriter out = response.getWriter();
		JSONArray js = JSONArray.fromObject(list);
		out.print(js);
		out.flush();
		
		
	}
	
	@GetMapping("api/get_avata.do")
	@ResponseBody
	public void get_avata(HttpServletResponse response, HttpServletRequest request, @ModelAttribute("searchVO") PictVO pictVO, ModelMap model, @ModelAttribute("adminVO") AdminVO adminVO) throws Exception {
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("Content-Type", "application/xml");
		response.setContentType("text/xml;charset=UTF-8");
		response.setCharacterEncoding("utf-8");
		response.setHeader("Access-Control-Allow-Methods", "GET");
		
		String user_id = request.getParameter("user_id");
		pictVO.setUser_id(user_id);
		pictVO = pictService.api_get_avata(pictVO);
		
		Map<String, Object> map = new HashMap<>();
		map.put("name" , pictVO.getName()); 
		map.put("user_id" , pictVO.getUser_id());
		map.put("position_x" , pictVO.getPosition_x());
		map.put("position_y" , pictVO.getPosition_y());
		map.put("position_z" , pictVO.getPosition_z());
		map.put("rotation_x" , pictVO.getRotation_x());
		map.put("rotation_y" , pictVO.getRotation_y());
		map.put("rotation_z" , pictVO.getRotation_z());
		
		map.put("cloth_id" , pictVO.getCloth_id());
		map.put("face_id" , pictVO.getFace_id());
		map.put("hair_id" , pictVO.getHair_id());
		map.put("shoes_id" , pictVO.getShoes_id());
		map.put("body" , pictVO.getBody());
		
		
		PrintWriter out = response.getWriter();
		JSONArray js = JSONArray.fromObject(map);
		out.print(js);
		out.flush();
	}
	
	
	@SuppressWarnings("null")
	@PostMapping("api/save_avata.do")
	@ResponseBody
	public void save_avata(HttpServletResponse response, HttpServletRequest request, @ModelAttribute("searchVO") PictVO pictVO, ModelMap model, @ModelAttribute("adminVO") AdminVO adminVO) throws Exception {
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("Content-Type", "application/xml");
		response.setContentType("text/xml;charset=UTF-8");
		response.setCharacterEncoding("utf-8");
		response.setHeader("Access-Control-Allow-Methods", "POST");
		
		String user_id = request.getParameter("user_id");
		pictVO.setUser_id(user_id);
		pictVO = pictService.api_get_avata(pictVO);
		
		if(pictVO == null) {
			PictVO vo = new PictVO();
			System.out.println("여기 오면 널임");
			vo.setUser_id(user_id);
			vo.setPosition_x(request.getParameter("position_x"));
			vo.setPosition_y(request.getParameter("position_y"));
			vo.setPosition_z(request.getParameter("position_z"));
			
			vo.setRotation_x(request.getParameter("rotation_x"));
			vo.setRotation_y(request.getParameter("rotation_y"));
			vo.setRotation_z(request.getParameter("rotation_z"));
			
			vo.setCloth(request.getParameter("cloth"));
			vo.setFace(request.getParameter("face"));
			vo.setHair(request.getParameter("hair"));
			vo.setShoes(request.getParameter("shoes"));
			vo.setBody(request.getParameter("body"));
			
			pictService.insert_avata(vo);
		}
		else {
			System.out.println("여기 오면 널아님");
			if(request.getParameter("position_x") != null) pictVO.setPosition_x(request.getParameter("position_x"));
			if(request.getParameter("position_y") != null) pictVO.setPosition_y(request.getParameter("position_y"));
			if(request.getParameter("position_z") != null) pictVO.setPosition_z(request.getParameter("position_z"));
			
			if(request.getParameter("rotation_x") != null) pictVO.setRotation_x(request.getParameter("rotation_x"));
			if(request.getParameter("rotation_y") != null) pictVO.setRotation_y(request.getParameter("rotation_y"));
			if(request.getParameter("rotation_z") != null) pictVO.setRotation_z(request.getParameter("rotation_z"));
			
			if(request.getParameter("cloth") != null) pictVO.setCloth(request.getParameter("cloth"));
			if(request.getParameter("face") != null) pictVO.setFace(request.getParameter("face"));
			if(request.getParameter("hair") != null) pictVO.setHair(request.getParameter("hair"));
			if(request.getParameter("shoes") != null) pictVO.setShoes(request.getParameter("shoes"));
			if(request.getParameter("body") != null) pictVO.setBody(request.getParameter("body"));
			
			pictService.update_avata(pictVO);
		}
		pictVO = pictService.api_get_avata(pictVO);
		Map<String, Object> map = new HashMap<>();
		map.put("name" , pictVO.getName()); 
		map.put("user_id" , pictVO.getUser_id());
		map.put("position_x" , pictVO.getPosition_x());
		map.put("position_y" , pictVO.getPosition_y());
		map.put("position_z" , pictVO.getPosition_z());
		map.put("rotation_x" , pictVO.getRotation_x());
		map.put("rotation_y" , pictVO.getRotation_y());
		map.put("rotation_z" , pictVO.getRotation_z());
		
		map.put("cloth_id" , pictVO.getCloth_id());
		map.put("face_id" , pictVO.getFace_id());
		map.put("hair_id" , pictVO.getHair_id());
		map.put("shoes_id" , pictVO.getShoes_id());
		map.put("body" , pictVO.getBody());
		
		
		PrintWriter out = response.getWriter();
		JSONArray js = JSONArray.fromObject(map);
		out.print(js);
		out.flush();
	}
	
	@PostMapping("api/attendance_save.do")
	@ResponseBody
	public void attendance_save(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("Content-Type", "application/xml");
		response.setContentType("text/xml;charset=UTF-8");
		response.setCharacterEncoding("utf-8");
		response.setHeader("Access-Control-Allow-Methods", "POST");
		
		SimpleDateFormat sp = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String now = sp.format(new Date());
		
		
		String name = request.getParameter("name");
		String std_num = request.getParameter("std_num");
		String in_out = request.getParameter("in_out");
		String week_count = request.getParameter("week_count");
		String week_cha = request.getParameter("week_cha");
		String title = request.getParameter("title");
		
		
		pictVO.setWeek_cha(week_cha);
		pictVO.setWeek_count(week_count);
		pictVO.setName(name);
		pictVO.setStd_num(std_num);
		pictVO.setTitle(title);

		System.out.println(in_out);
		if(in_out.equals("in")) {
			pictVO.setIn_date(now);
			pictService.attendance_save(pictVO);
			
		}
		else {
			PictVO vo = pictService.attendance_select_one(pictVO);
			vo.setOut_date(now);
			pictService.attendance_save_update(vo);
		}
		
		PrintWriter out = response.getWriter();
		Map<String, Object> map = new HashMap<>();
		map.put("result", 200);
		JSONArray js = JSONArray.fromObject(map);
		out.print(js);
		out.flush();
	}

	@GetMapping("api/lecture_list.do")
	@ResponseBody
	public void lecture_list(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("Content-Type", "application/xml");
		response.setContentType("text/xml;charset=UTF-8");
		response.setCharacterEncoding("utf-8");
		response.setHeader("Access-Control-Allow-Methods", "GET");
		List<PictVO> lecture_list = pictService.api_lecture_list(pictVO);
		
		ArrayList<Map<String, Object>> list = new ArrayList();
		for(PictVO a : lecture_list){
			Map<String, Object> map = new HashMap<>();
			map.put("idx" , a.getIdx()); 
			map.put("title" , a.getTitle());
			map.put("name" , a.getName());
			map.put("link_url" , a.getLink_url());
			list.add(map);
		}
		
		PrintWriter out = response.getWriter();
		JSONArray js = JSONArray.fromObject(list);
		out.print(js);
		out.flush();
	}
	
	@GetMapping("api/lecture_attendance.do")
	@ResponseBody
	public void lecture_attendance(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("Content-Type", "application/xml");
		response.setContentType("text/xml;charset=UTF-8");
		response.setCharacterEncoding("utf-8");
		response.setHeader("Access-Control-Allow-Methods", "GET");
		
		String idx = request.getParameter("idx");
		pictVO.setIdx(Integer.parseInt(idx));
		List<PictVO> attendance_list = pictService.lecture_attendance_api(pictVO);
		
		ArrayList<Map<String, Object>> list = new ArrayList();
		for(PictVO a : attendance_list){
			Map<String, Object> map = new HashMap<>();
			map.put("idx" , a.getIdx()); 
			map.put("title" , a.getTitle());
			map.put("professor" , a.getProfessor());
			map.put("name" , a.getName());
			map.put("in_date" , a.getIn_date());
			map.put("out_date" , a.getOut_date());
			map.put("std_num" , a.getStd_num());
			map.put("timediff" , a.getTimediff());
			map.put("category_cnt" , a.getCategory_cnt());
			map.put("whole_timediff" , a.getWhole_timediff());
			
			list.add(map);
		}
		
		PrintWriter out = response.getWriter();
		JSONArray js = JSONArray.fromObject(list);
		out.print(js);
		out.flush();
	
	}

	public static String encryptPassword(String password, String id) throws Exception {
		if (password == null) return "";
		if (id == null) return ""; // KISA 보안약점 조치 (2018-12-11, 신용호)
		byte[] hashValue = null; // 해쉬값
	
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		md.reset();
		md.update(id.getBytes());
		hashValue = md.digest(password.getBytes());
	
		return new String(Base64.encodeBase64(hashValue));
    }

	
	/*
	 * //qr코드
	 * 
	 * @PostMapping("api/qrcode.do") public void barcode(@RequestParam("id") String
	 * id) throws Exception{ System.out.println("카카카카카"); String ccc = "1"; String
	 * c_id = encryptPassword("pict", ccc); String data =
	 * "http://192.168.1.22:8080/apicoupon.do?id=" + c_id; String path =
	 * "C:\\Users\\82105\\Desktop\\bc.png";
	 * 
	 * String charset = "UTF-8";
	 * 
	 * Map<EncodeHintType, ErrorCorrectionLevel> hashMap = new
	 * HashMap<EncodeHintType,ErrorCorrectionLevel>();
	 * 
	 * hashMap.put(EncodeHintType.ERROR_CORRECTION,ErrorCorrectionLevel.L);
	 * 
	 * createQR(data, path, charset, hashMap, 200, 200);
	 * System.out.println("QR Code Generated!!! "); }
	 * 
	 * @RequestMapping(value = "/apicoupon.do") public void
	 * zzzzz(@RequestParam("id") String id) throws Exception {
	 * System.out.println("드오나!"); }
	 * 
	 * public static void createQR(String data, String path, String charset, Map
	 * hashMap, int height, int width) throws WriterException, IOException{
	 * BitMatrix matrix = new MultiFormatWriter().encode(new
	 * String(data.getBytes(charset), charset), BarcodeFormat.QR_CODE, width,
	 * height); MatrixToImageWriter.writeToFile(matrix,
	 * path.substring(path.lastIndexOf('.') + 1), new File(path)); }
	 */
}