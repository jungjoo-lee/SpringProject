package com.spring.project.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.mappers.UserDAO;
import com.spring.project.vo.PageVO;
import com.spring.project.vo.UserVO;

@Service
public class UserService {
	@Autowired
	UserDAO userDAO;
	
	public List<UserVO> listUsers(PageVO vo) {
		return userDAO.listUsers(vo);
	}
	
	public int totalUsers() {
		return userDAO.totalUsers();
	}
	
	public UserVO login(String userid) throws SQLException {
		return userDAO.findByID(userid);
	}
	
	public void register(UserVO vo) throws SQLException {
		userDAO.register(vo);
	}
	
	public String findId(Map<String, String> map) throws SQLException {
		return userDAO.findId(map);
	}
	
	public UserVO findPw(Map<String, String> map) throws SQLException {
		return userDAO.findPw(map);
	}
	
	public void updatePw(Map<String, String> map) throws SQLException {
		userDAO.updatePw(map);
	}
}