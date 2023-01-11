package com.spring.project;

import java.io.File;
import java.net.URLDecoder;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.project.service.GoodsService;
import com.spring.project.service.UserService;
import com.spring.project.util.Util;
import com.spring.project.vo.GoodsVO;
import com.spring.project.vo.PageVO;

import net.coobird.thumbnailator.Thumbnails;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AdminController {	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	UserService userService;
	
	@Autowired
	GoodsService goodsService;

	@RequestMapping(value = "/admin/adminMain.do", method = RequestMethod.GET)
	public String adminMain(Model model) {
		logger.info("메인");
		
		return "/admin/adminMain";
	}
	
	@RequestMapping(value = "/admin/userList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String memberList(Model model) {
		logger.info("회원 리스트");
		
		int amount = 10;
		Map<String, Object> inpoMap = new HashMap<String, Object>();
		inpoMap.put("searchType", "");
		inpoMap.put("keyword", "");
		int total = userService.totalUsers(inpoMap);
		PageVO pageVO = new PageVO(1, amount, total);
		inpoMap.put("pageVO", pageVO);
		
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("list", userService.listUsers(inpoMap));
		
		return "/admin/userList";
	}
	
	@RequestMapping(value = "/admin/goodsList.do", method = RequestMethod.GET)
	public String goodsList() {
		logger.info("상품 리스트");
		
		return "/admin/goodsList";
	}
	
	@RequestMapping(value = "/admin/goodsRegisterForm.do", method = RequestMethod.GET)
	public String goodsRegisterForm() {
		logger.info("상품 등록 페이지");
		
		return "/admin/goodsRegisterForm";
	}
	
	@RequestMapping(value = "/admin/goodsRegister.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> goodsRegister(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) {
		logger.info("상품 등록 페이지");
		Map<String, Object> resultMap = new HashMap<>();
		
		try {
			Map<String, String> map = new HashMap<>();
			Enumeration<?> en = multipartRequest.getParameterNames();
			
			while(en.hasMoreElements()) {
				String key = (String) en.nextElement();
				String tmp = multipartRequest.getParameter(key).replace("%", "%25");
				map.put(key, URLDecoder.decode(tmp, "UTF8"));
				map.get(key).replace("%25", "%");
			}
			
			GoodsVO vo = GoodsVO.builder()
					.goods_id(0)
					.status_name(map.get("status_id"))
					.book_title(map.get("title"))
					.price(Integer.parseInt(map.get("price")))
					.author(map.get("author"))
					.publisher(map.get("publisher"))
					.publisher_content(map.get("publisher_content"))
					.book_index(map.get("book_index"))
					.introduce(map.get("introduce"))
					.release_date(map.get("release_date"))
					.page_number(Integer.parseInt(map.get("page_number")))
					.book_size(map.get("book_size"))
					.point(map.get("point")).build();
			
			Iterator<String> fileNames = multipartRequest.getFileNames();
//			List<BoardFile> boardFileList = new ArrayList<>();
			
			while(fileNames.hasNext()) {
				String fileName = fileNames.next();
				MultipartFile mFile = multipartRequest.getFile(fileName);
				
				if (mFile.getSize() == 0) continue;
				String coverName = "cover_" + String.valueOf(System.nanoTime());
				String thumbnail = "thumbnail_" + String.valueOf(System.nanoTime());
				String content = "content_" + String.valueOf(System.nanoTime());
				String contentType = mFile.getContentType().toLowerCase();
				
				if (mFile.getName().equals("content_image")) {
					File file = new File("C:\\book\\content\\" + content);
					mFile.transferTo(file);
					vo.setContent_image(mFile.getOriginalFilename());
					vo.setReal_content_image(content);
				} else if (mFile.getName().equals("image")) {
					if (contentType.contains("image")) {
						File file = new File("C:\\book\\image\\" + coverName);
						mFile.transferTo(file);
						vo.setCover(mFile.getOriginalFilename());
						vo.setReal_cover(coverName);
						
						File thumbFile = new File(String.valueOf("C:\\book\\thumbnail\\" + thumbnail));
						Thumbnails.of(file).size(220, 270).outputFormat("png").toFile(thumbFile);
						vo.setReal_thumbnail(thumbnail);
						vo.setThumbnail(mFile.getOriginalFilename().substring(0, mFile.getOriginalFilename().indexOf(".")) + ".png");
					}
				}
			}
			logger.info("" + vo);
			goodsService.register(vo);
			resultMap.put("status", true);
			resultMap.put("message", "상품 등록 성공");
			resultMap.put("url", "/project/admin/goodsList.do");		
			
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("status", false);
			resultMap.put("message", "오류");
		}
		
		return resultMap;
	}
}