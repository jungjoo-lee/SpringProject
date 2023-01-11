package com.spring.project.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.mappers.GoodsDAO;
import com.spring.project.vo.GoodsVO;

@Service
public class GoodsService {
	@Autowired
	GoodsDAO goodsDAO;

	public int totalGoods(Map<String, Object> inpoMap) throws SQLException {
		return goodsDAO.totalGoods(inpoMap);
	}

	public List<GoodsVO> listGoods(Map<String, Object> inpoMap) throws SQLException {
		return goodsDAO.listGoods(inpoMap);
	}
	
	public void register(GoodsVO vo) throws SQLException {
		goodsDAO.register(vo);
	}
	
	public GoodsVO goodsView(int goods_id) throws SQLException {
		return goodsDAO.goodsView(goods_id);
	}
}