package com.spring.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.mappers.UserDAO;
import com.spring.project.vo.UserVO;

@Service
public class UserService {
	@Autowired
	UserDAO userDAO;

	public List<UserVO> listUsers() {
		System.out.println(userDAO.listUsers());
		return userDAO.listUsers();
	}
}