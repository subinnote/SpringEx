package com.momo.vo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;

public class MemberList {
	List<Member> list;
	
	public MemberList() {
		list = new ArrayList<Member>();
	}
	
	@GetMapping("getMappingMemberList")
	public String getMappingMemberList(MemberList list) {
		System.out.println(list);
		return "mapping";
	}
}
