package com.studycafe.seat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.studycafe.seat.domain.History;
import com.studycafe.seat.service.HistoryService;


@Controller
public class MoneyController {
	
	@Autowired
	HistoryService historyService;
	
	@GetMapping("/studycafe/chargeMoney")
	public String chargeMoney(Model model,int userNo) throws Exception {
		System.out.println("chargeMoney에서 userNo"+userNo);
		History history=historyService.showUser(userNo);
		System.out.println("chargeMoney에서 history"+history);
		
		model.addAttribute("history",history);
		model.addAttribute("userNo",userNo);
		
		return "history/chargeMoney";
	}
}
