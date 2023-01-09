package com.spring.project;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.project.service.UserService;
import com.spring.project.service.VisitService;
import com.spring.project.vo.UserVO;

@Controller
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	UserService userService;
	
	@RequestMapping("/goods/test.do")
	public String test() {
		logger.info("회원가입 페이지");
		
		return "/goods/test";
	}
	
	@RequestMapping("/user/registerForm.do")
	public String registerForm() {
		logger.info("회원가입 페이지");
		
		return "/user/registerForm";
	}
	
	@RequestMapping(value = "/user/register.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> register(@RequestBody UserVO vo) {
		logger.info("회원가입");
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			logger.info("" + vo);
			userService.register(vo);
			
			resultMap.put("status", true);
			resultMap.put("message", vo.getName() + "님 회원가입을 축하합니다.");
			resultMap.put("url", "/project/user/loginForm.do");
		} catch (SQLException e) {
			e.printStackTrace();
			resultMap.put("status", false);
			resultMap.put("message", "중복 아이디");
		}
		
		return resultMap;
	}
	
	@RequestMapping("/user/loginForm.do")
	public String loginForm() {
		logger.info("로그인 페이지");
		
		return "/user/loginForm";
	}
	
	@RequestMapping(value = "/user/login.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> login(@RequestBody Map<String, String> map, HttpSession session) {
		logger.info("로그인");
		
		UserVO vo;
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			vo = userService.login(map.get("userid"));
			logger.info("" + vo);
			
			if (vo != null && vo.getPwd().equals(map.get("pwd"))) {
				if ("T".equals(vo.getAdmin_check())) {
					session.setMaxInactiveInterval(-1);
					session.setAttribute("adminLogin", true);
					resultMap.put("status", true);
					resultMap.put("message", "안녕하세요. 관리자님");
					resultMap.put("url", "/project/admin/adminMain.do");
				} else {
					if("T".equals(vo.getLogin_Check())) {
						userService.loginTimeUpdate(map.get("userid"));
						session.setMaxInactiveInterval(-1);
						session.setAttribute("userLogin", true);
						session.setAttribute("userVO", vo);
						resultMap.put("status", true);
						resultMap.put("message", "안녕하세요. " + vo.getName() + "님");
						resultMap.put("url", "/project/main/userMain.do");
					} else {
						resultMap.put("status", false);
						resultMap.put("message", "관리자한테 문의하세요.");
					}
				}
			} else {
				resultMap.put("status", false);
				resultMap.put("message", "회원 정보가 없습니다.");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			resultMap.put("status", false);
			resultMap.put("message", "회원 정보가 없습니다.");
		}
		
		return resultMap;
	}
	
	@RequestMapping("/user/findIdForm.do")
	public String findIdForm() {
		logger.info("아이디 찾기 페이지");
		
		return "/user/findIdForm";
	}
	
	@RequestMapping(value = "/user/findId.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> findId(@RequestBody Map<String, String> map) {
		logger.info("아이디 찾기");
		
		Map<String , Object> resultMap = new HashMap<String, Object>();
		
		try {
			logger.info("" + map);
			String userid = userService.findId(map);
			
			resultMap.put("status", true);
			resultMap.put("message", "아이디는 [" + userid + "] 입니다.");
			resultMap.put("url", "/project/user/loginForm.do");
		} catch (SQLException e) {
			e.printStackTrace();
			resultMap.put("status", false);
			resultMap.put("message", "회원 정보가 없습니다.");
		}
		
		return resultMap;
	}
	
	@RequestMapping("/user/findPwForm.do")
	public String findPwForm() {
		logger.info("비밀번호 찾기 페이지");
		
		return "/user/findPwForm";
	}
	
	@RequestMapping(value = "/user/findPw.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> findPw(@RequestBody Map<String, String> map) {
		logger.info("비밀번호 찾기");
		//TODO 초기화하기 그래서 로그인후에 할껀지 바로 할껀지
		Map<String , Object> resultMap = new HashMap<String, Object>();
		
		try {
			logger.info("" + map);
			userService.findPw(map);
			
			resultMap.put("status", true);
			resultMap.put("message", "새로운 비밀번호로 변경해주세요.");
			resultMap.put("url", "/project/user/updatePwForm.do");
		} catch (SQLException e) {
			e.printStackTrace();
			resultMap.put("status", false);
			resultMap.put("message", "회원 정보가 없습니다.");
		}
		
		return resultMap;
	}
	
	@RequestMapping("/user/updatePwForm.do")
	public String updatePwForm() {
		logger.info("비밀번호 변경 페이지");
		//TODO 비밀번호 어떻게 할꺼냐
		return "/user/updatePwForm";
	}
	
	@RequestMapping(value = "/user/updatePw.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> updatePw(@RequestBody Map<String, String> map) {
		logger.info("비밀번호 변경");
		//TODO sad
		Map<String , Object> resultMap = new HashMap<String, Object>();
		
		try {
			logger.info("" + map);
			userService.updatePw(map);
			
			resultMap.put("status", true);
			resultMap.put("message", "정상적으로 비밀번호가 변경되었습니다.");
			resultMap.put("url", "/project/user/loginForm.do");
		} catch (SQLException e) {
			e.printStackTrace();
			resultMap.put("status", false);
			resultMap.put("message", "오류");
		}
		
		return resultMap;
	}
	
	@RequestMapping("/user/userView.do")
	public String userView(HttpSession session, Model model) {
		logger.info("회원 정보 보기");
		
		model.addAttribute("userVO", session.getAttribute("userVO"));
		
		return "/user/userView";
	}
	
	@RequestMapping("/user/updateForm.do")
	public String updateForm(HttpSession session, Model model) {
		logger.info("회원 정보 수정 페이지");
		
		UserVO vo = (UserVO) session.getAttribute("userVO");
		String phone = vo.getPhone();
		StringTokenizer st = new StringTokenizer(phone, "-");
		model.addAttribute("userVO", vo);
		model.addAttribute("num1", st.nextToken());
		model.addAttribute("num2", st.nextToken());
		model.addAttribute("num3", st.nextToken());
		
		return "/user/updateForm";
	}
	
	@RequestMapping(value = "/user/update.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> update(HttpSession session, @RequestBody UserVO vo) {
		logger.info("회원 정보 수정");
		
		Map<String , Object> resultMap = new HashMap<String, Object>();
		
		try {
			logger.info("" + vo);
			userService.updateUser(vo);
			session.setAttribute("userVO", userService.login(vo.getUserid()));
			resultMap.put("status", true);
			resultMap.put("message", "정상적으로 회원정보가 변경되었습니다.");
			resultMap.put("url", "/project/user/userView.do");
		} catch (SQLException e) {
			e.printStackTrace();
			resultMap.put("status", false);
			resultMap.put("message", "오류");
		}
		
		return resultMap;
	}
	
	@RequestMapping(value = "/user/userDelete.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> userDelete(HttpSession session, @RequestBody Map<String, String> map) {
		logger.info("회원 정보 삭제");
		
		Map<String , Object> resultMap = new HashMap<String, Object>();
		
		try {
			logger.info("" + map);
			UserVO vo = (UserVO) session.getAttribute("userVO");

			if (map.get("pwd").equals(vo.getPwd())) {
				userService.deleteUser(vo);
				session.invalidate();
				resultMap.put("status", true);
				resultMap.put("message", "정상적으로 탈퇴되었습니다.\n이용해 주셔서 감사합니다.");
				resultMap.put("url", "/project/main/userMain.do");
			} else {
				resultMap.put("status", false);
				resultMap.put("message", "오류");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			resultMap.put("status", false);
			resultMap.put("message", "오류");
		}
		
		return resultMap;
	}
	
	@RequestMapping("/user/logout.do")
	public String logout(HttpSession session, Model model) {
		logger.info("로그아웃");
		
		session.invalidate();
		
		return "redirect:/main/userMain.do";
	}
}