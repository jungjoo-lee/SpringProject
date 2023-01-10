package com.spring.project.mappers;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.spring.project.vo.GoodsVO;

@Repository
public interface GoodsDAO {
	List<GoodsVO> listGoods(Map<String, Object> inpoMap) throws SQLException;
	int totalGoods(Map<String, Object> inpoMap) throws SQLException;
	void register(GoodsVO vo) throws SQLException;
}