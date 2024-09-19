package pict_admin.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;



import java.security.MessageDigest;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.PasswordAuthentication;
import pict_admin.service.PictService;
import pict_admin.service.PictVO;
import pict_admin.service.AdminService;
import pict_admin.service.AdminVO;
import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.apache.commons.codec.binary.Base64;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.json.simple.parser.JSONParser;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;






//import io.socket.emitter.Emitter;
//import io.socket.emitter.Emitter.Listener;
//import io.socket.client.IO;
//import io.socket.client.Socket;

import java.net.URL;
import java.net.URLEncoder;
import java.net.HttpURLConnection;

@Controller
public class pictController {
	PasswordAuthentication pa;
	
	@Resource(name = "pictService")
	private PictService pictService;
	
	@Resource(name = "adminService")
	private AdminService adminService;
	
	
	@RequestMapping(value = "/main.do")
	public String main(@ModelAttribute("searchVO") AdminVO adminVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {
		String userAgent = request.getHeader("user-agent");
		boolean mobile1 = userAgent.matches( ".*(iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson).*");
		boolean mobile2 = userAgent.matches(".*(LG|SAMSUNG|Samsung).*"); 
		if (mobile1 || mobile2) {
		    //여기 모바일일 경우
			model.addAttribute("intype", "mobile");
		}
		else {
			model.addAttribute("intype", "pc");
		}
		
		return "pict/main/main";
	}
	
	@RequestMapping(value = "/board.do")
	public String board(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {
		String userAgent = request.getHeader("user-agent");
		boolean mobile1 = userAgent.matches( ".*(iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson).*");
		boolean mobile2 = userAgent.matches(".*(LG|SAMSUNG|Samsung).*"); 
		if (mobile1 || mobile2) {
		    //여기 모바일일 경우
			model.addAttribute("intype", "mobile");
		}
		else {
			model.addAttribute("intype", "pc");
		}
		
		List<?> board_list = pictService.board_list(pictVO);
		model.addAttribute("resultList", board_list);
		model.addAttribute("length", board_list.size());
		return "pict/board/board";
	}
	
	@RequestMapping(value = "/admin/board_list.do")
	public String admin_board_list(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {
		String userAgent = request.getHeader("user-agent");
		boolean mobile1 = userAgent.matches( ".*(iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson).*");
		boolean mobile2 = userAgent.matches(".*(LG|SAMSUNG|Samsung).*"); 
		if (mobile1 || mobile2) {
		    //여기 모바일일 경우
			model.addAttribute("intype", "mobile");
		}
		else {
			model.addAttribute("intype", "pc");
		}
		List<?> board_list = pictService.board_list(pictVO);
		model.addAttribute("resultList", board_list);
		model.addAttribute("pictVO", pictVO);
		
		return "pict/admin/board_list";
	}
	@RequestMapping(value = "/admin/board_register.do")
	public String board_register(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String userAgent = request.getHeader("user-agent");
		boolean mobile1 = userAgent.matches( ".*(iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson).*");
		boolean mobile2 = userAgent.matches(".*(LG|SAMSUNG|Samsung).*"); 
		if (mobile1 || mobile2) {
		    //여기 모바일일 경우
			model.addAttribute("intype", "mobile");
		}
		else {
			model.addAttribute("intype", "pc");
		}
		if(pictVO.getIdx() != 0) {
			//수정
			pictVO = pictService.board_list_one(pictVO);
			pictVO.setSaveType("update");
			
		}
		else {
			pictVO.setSaveType("insert");
		}
		
		model.addAttribute("pictVO", pictVO);
		return "pict/admin/board_register";
	}
	
	public String unscript(String data) {
        if (data == null || data.trim().equals("")) {
            return "";
        }
        
        String ret = data;
        
        ret = ret.replaceAll("<(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;script");
        ret = ret.replaceAll("</(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;/script");
        
        ret = ret.replaceAll("<(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;object");
        ret = ret.replaceAll("</(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;/object");
        
        ret = ret.replaceAll("<(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;applet");
        ret = ret.replaceAll("</(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;/applet");
        
        ret = ret.replaceAll("<(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");
        ret = ret.replaceAll("</(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");
        
        ret = ret.replaceAll("<(F|f)(O|o)(R|r)(M|m)", "&lt;form");
        ret = ret.replaceAll("</(F|f)(O|o)(R|r)(M|m)", "&lt;form");

        return ret;
    }
	public static String getStringToTag(String str) {
		str = str.replaceAll("&lt;", "<");
		str = str.replaceAll("&gt;", ">");
		str = str.replaceAll("&quot;", "\"");
		str = str.replaceAll("&#39;", "'");
		str = str.replaceAll("&apos;", "'");
		 
		return str;
	}
	
	@RequestMapping(value = "/admin/board_save.do")
	public String board_save(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String userAgent = request.getHeader("user-agent");
		boolean mobile1 = userAgent.matches( ".*(iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson).*");
		boolean mobile2 = userAgent.matches(".*(LG|SAMSUNG|Samsung).*"); 
		if (mobile1 || mobile2) {
		    //여기 모바일일 경우
			model.addAttribute("intype", "mobile");
		}
		else {
			model.addAttribute("intype", "pc");
		}
		if(pictVO.getSaveType() != null && pictVO.getSaveType().equals("update")) {
			System.out.println("업데이트!!!!!!!!!!!!!!!!");
			pictVO.setText(unscript(getStringToTag(pictVO.getText())));
			pictVO.setText(getStringToTag(pictVO.getText()));
			
			pictService.board_update(pictVO);
			model.addAttribute("message", "정상적으로 수정되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/admin/board_list.do");
			return "pict/main/message";
		}
		else {
			System.out.println("인설트!!!!!!!!!!!!!!!!");
			pictService.board_insert(pictVO);
			model.addAttribute("message", "정상적으로 저장되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/admin/board_list.do");
			return "pict/main/message";	
		}
		
	}
	
	@RequestMapping(value = "/admin/board_delete.do")
	public String board_delete(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String userAgent = request.getHeader("user-agent");
		boolean mobile1 = userAgent.matches( ".*(iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson).*");
		boolean mobile2 = userAgent.matches(".*(LG|SAMSUNG|Samsung).*"); 
		if (mobile1 || mobile2) {
		    //여기 모바일일 경우
			model.addAttribute("intype", "mobile");
		}
		else {
			model.addAttribute("intype", "pc");
		}
		pictService.board_delete(pictVO);
		
		model.addAttribute("message", "정상적으로 삭제되었습니다.");
		model.addAttribute("retType", ":location");
		model.addAttribute("retUrl", "/admin/board_list.do");
		return "pict/main/message";
		
	}


    
}
