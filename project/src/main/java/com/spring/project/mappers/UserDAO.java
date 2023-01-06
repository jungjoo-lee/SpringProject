package com.spring.project.mappers;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.spring.project.vo.PageVO;
import com.spring.project.vo.UserVO;

@Repository
public interface UserDAO {
	List<UserVO> listUsers(PageVO vo);
	int totalUsers();
	UserVO findByID(String userid) throws SQLException;
	void loginTimeUpdate(String userid) throws SQLException;
	void register(UserVO vo) throws SQLException;
	String findId(Map<String, String> map) throws SQLException;
	UserVO findPw(Map<String, String> map) throws SQLException;
	void updatePw(Map<String, String> map) throws SQLException;
	void updateUser(UserVO vo) throws SQLException;
	void deleteUser(UserVO vo) throws SQLException;
}