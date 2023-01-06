package com.spring.project.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class VisitCountVO {
	private int visit_id;
    private String visit_ip;
    private Timestamp visit_time;
    private String visit_refer;
    private String visit_agent;
}