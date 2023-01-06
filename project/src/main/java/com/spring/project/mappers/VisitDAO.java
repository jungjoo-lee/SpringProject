package com.spring.project.mappers;

import org.springframework.stereotype.Repository;

import com.spring.project.vo.VisitCountVO;

@Repository
public interface VisitDAO {
	public int insertVisitor(VisitCountVO vo) throws Exception;
}