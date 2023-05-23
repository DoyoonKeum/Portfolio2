package com.studycafe.seat.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.studycafe.seat.domain.History;
import com.studycafe.seat.service.HistoryService;

	

@Controller
public class HistoryController {
	@Autowired
	HistoryService historyService;
	
	@GetMapping("/studycafe/historyList")
	public String historyList(@RequestParam("userNo")int userNo,Model model) throws Exception {
		List<History> historyList = new ArrayList<History>();
		
		historyList=historyService.historyList();
		
		model.addAttribute("userNo",userNo);
		model.addAttribute("historyList",historyList);
		  
		return "history/historyList";
	  }
	
	@GetMapping("/studycafe/historySearch")
	public String historySearch(@RequestParam String historySearch,int userNo,Model model) throws Exception {
		History history = historyService.historySearch(historySearch);
		System.out.println("search Controller"+history);
		model.addAttribute("history",history);
		model.addAttribute("userNo",userNo);
		return "history/historyOne";
	}
	
	@GetMapping("/studycafe/chargeMoney999")
	public String insertChargeMoney(@RequestParam("hno") int hno, int userNo, Model model) throws Exception {
		History history=historyService.showUser(hno);
		System.out.println("history"+history);
		model.addAttribute("history",history);
		model.addAttribute("userNo",userNo);
		return "history/chargeMoney999";
	}
	
	@PostMapping("/studycafe/chargeMoney999")
	public String insertChargeMoney(@RequestParam("showMeTheMoney") int money,int userNo,@RequestParam("hno") int hno,Model model ) throws Exception {
		History history=historyService.showUser(hno);
		history.setH_wallet(history.getH_wallet()+money);
		System.out.println("chargeMoney99에서 "+history);
		historyService.updateMoney(history);
		
		return "redirect:./historyList?userNo="+userNo;
	}

	
}
