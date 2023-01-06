package com.spring.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.mappers.CommentDAO;

@Service
public class CommentService {
	@Autowired
	CommentDAO commentDAO;
}