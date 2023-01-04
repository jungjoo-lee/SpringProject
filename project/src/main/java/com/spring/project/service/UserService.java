package com.spring.project.service;

import java.util.List;

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
}