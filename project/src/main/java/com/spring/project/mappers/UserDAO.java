package com.spring.project.mappers;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.project.vo.PageVO;
import com.spring.project.vo.UserVO;

@Repository
public interface UserDAO {
	List<UserVO> listUsers(PageVO vo);
	int totalUsers();
}