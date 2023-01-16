package com.spring.project;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
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

import com.spring.project.service.MailSendService;
import com.spring.project.service.UserService;
import com.spring.project.vo.UserVO;

@Controller
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	UserService userService;
	
	@Autowired
	MailSendService mailSendService;
	
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
	public @ResponseBody Map<String, Object> register(@RequestBody Map<String, String> map) {
		logger.info("회원가입");
		logger.info("" + map);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		UserVO vo = UserVO.builder()
				.userid(map.get("userid"))
				.pwd(map.get("pwd"))
				.name(map.get("name"))
				.sex(map.get("sex"))
				.phone(map.get("phone"))
				.birthday(map.get("birthday"))
				.email(map.get("email"))
				.postcode(Integer.parseInt(map.get("postcode")))
				.address(map.get("address"))
				.detailaddress(map.get("detailaddress"))
				.gno(1)
				.build();
		
		try {
			logger.info("" + map);
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
	public @ResponseBody Map<String, Object> findPw(@RequestBody Map<String, String> map, HttpServletRequest req) {
		logger.info("비밀번호 찾기");
		Map<String , Object> resultMap = new HashMap<String, Object>();
		
		try {
			userService.findPw(map);
			
			HttpSession session = req.getSession();
			String randomNum = mailSendService.makeRandomNumber();
			session.setAttribute("AuthNum", randomNum);
			session.setMaxInactiveInterval(300);
			
			BufferedReader reader = new BufferedReader(new InputStreamReader(getClass().getResourceAsStream("/mailTemplate/authTemplate.html"), "utf-8"));
	
			StringBuilder str = new StringBuilder();
			reader.lines().forEach(lineText -> {
				str.append(lineText);
			});
			String htmlStr = str.toString();
			htmlStr = htmlStr.replace("${AuthNumber}", randomNum);

			if (map.get("findpw") != null) {
				logger.info(""+ map.get("userid"));
				session.setAttribute("userid", map.get("userid"));
			}
			mailSendService.sendAuthMail(map.get("email"), "인증번호", htmlStr);
			resultMap.put("status", true);
			resultMap.put("message", "이메일로 발송된 인증번호를 가지고 새로운 비밀번호로 변경해주세요.");
			resultMap.put("url", "/project/user/updatePwForm.do");
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("status", false);
			resultMap.put("message", "회원 정보가 없습니다.");
		}
		
		return resultMap;
	}
	
	@RequestMapping("/user/updatePwForm.do")
	public String updatePwForm() {
		logger.info("비밀번호 변경 페이지");

		return "/user/updatePwForm";
	}
	
	@RequestMapping(value = "/user/updatePw.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> updatePw(@RequestBody Map<String, String> map, HttpServletRequest req) {
		logger.info("비밀번호 변경");
		
		Map<String , Object> resultMap = new HashMap<String, Object>();
		HttpSession session = req.getSession();
		
		try {
			map.put("userid", (String)session.getAttribute("userid"));
			userService.updatePw(map);
			session.invalidate();
			
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
	
	@RequestMapping("/user/send_auth.do")
	public @ResponseBody Map<String, Object> send_auth(@RequestBody Map<String, String> map, HttpServletRequest req) {
		logger.info("인증 번호 발송");
		
		Map<String, Object> resultMap = new HashMap<>();
		
		try {
			HttpSession session = req.getSession();
			String randomNum = mailSendService.makeRandomNumber();
			session.setAttribute("AuthNum", randomNum);
			session.setMaxInactiveInterval(300);
			
			BufferedReader reader = new BufferedReader(new InputStreamReader(getClass().getResourceAsStream("/mailTemplate/authTemplate.html"), "utf-8"));
	
			StringBuilder str = new StringBuilder();
			reader.lines().forEach(lineText -> {
				str.append(lineText);
			});
			String htmlStr = str.toString();
			htmlStr = htmlStr.replace("${AuthNumber}", randomNum);

			mailSendService.sendAuthMail(map.get("email"), "인증번호", htmlStr);
			
			resultMap.put("status", true);
			resultMap.put("message", "이메일 확인해주세요");
		} catch (Exception e) {
			resultMap.put("status", false);
			resultMap.put("message", "오류");
		}
		
		
		return resultMap;
	}
	
	@RequestMapping("/user/authentic.do")
	public @ResponseBody Map<String, Object> authentic(@RequestBody Map<String, String> map, HttpServletRequest req) {
		logger.info("인증 번호 확인");
		
		Map<String, Object> resultMap = new HashMap<>();
		
		try {
			HttpSession session = req.getSession();

			if (session.getAttribute("AuthNum").equals(map.get("AuthNum"))) {
				if (map.get("findpw") == null) {
					session.invalidate();
				}
				resultMap.put("status", true);
				resultMap.put("message", "인증되었습니다.");
			} else {
				resultMap.put("status", false);
				resultMap.put("message", "인증 실패");
			}
		} catch (Exception e) {
			resultMap.put("status", false);
			resultMap.put("message", "시간이 지났습니다. 다시 메일 인증 해주세요.");
		}
		
		
		return resultMap;
	}
	
	@RequestMapping("/user/overlabID.do")
	public @ResponseBody Map<String, Object> overlabID(@RequestBody Map<String, String> map) {
		logger.info("아이디 중복 체크");
		
		Map<String, Object> resultMap = new HashMap<>();
		
		try {
			UserVO vo = userService.overlabId(map.get("userid"));
			if (vo != null) {
				resultMap.put("status", false);
				resultMap.put("message", "사용 불가능한 아이디입니다.");
			} else {
				resultMap.put("status", true);
				resultMap.put("message", "사용 가능한 아이디입니다.");
			}
		} catch (Exception e) {
			resultMap.put("status", false);
			resultMap.put("message", "사용 불가능한 아이디입니다.");
		}
		
		return resultMap;
	}
}