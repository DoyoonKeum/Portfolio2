package com.studycafe.seat.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.studycafe.seat.domain.History;
import com.studycafe.seat.domain.Seat;
import com.studycafe.seat.service.SeatServiceImpl;
import com.studycafe.user.domain.User;



@Controller
public class SeatController {
	
	@Autowired
	SeatServiceImpl seatService;
	

	//===================================================================================
	//좌석 보여줘
	@GetMapping("/studycafe/seatSelect")
	public String showSeat(@RequestParam("userNo") int hno,Model model) throws Exception {
		//user의 이용내역을 보여주는 history 불러오기
		History history=seatService.showUser(hno);
		//예약할 수 있는 모든 좌석 불러오기
		List<Seat>seat=seatService.showSeat();
		
		model.addAttribute("seat",seat);
		model.addAttribute("history",history);
		return "seat/seatSelect";
	}

	  @PostMapping("/studycafe/choiceSeat")
	  @ResponseBody
	  public Map<String, Object> choiceSeat(@RequestParam int seatNumber, @RequestParam int hno) {
		
		
		Map<String, Object> result = new HashMap<String, Object>();
	    try {
	    
	    boolean success = seatService.reserveSeat(seatNumber,hno);
	      result.put("success", success);
	      
	      if (!success) {
	    	  History history=seatService.showUser(hno);
	    	  if(history.getH_wallet()<3000) {
	    		  result.put("message", "금액이 부족합니다");
	    	  }else {
	    	  
	    	  result.put("message", "이미 예약중입니다.");}
	      }
	    	} catch (Exception e) {
	    		result.put("success", false);
	    		result.put("message", e.getMessage());
	    	}
	    return result;
	  }
	  
	  @PostMapping("/studycafe/cancelSeat")
	  @ResponseBody
	  public Map<String, Object> cancelSeat(@RequestParam("seatNumber") int seatNumber,@RequestParam int hno) {
		 Map<String, Object> result = new HashMap<String, Object>();
	    try {
	      
	      seatService.cancelSeat(seatNumber,hno);
	      result.put("success", true);
	      
	      
	    } catch (Exception e) {
	      result.put("success", false);
	      result.put("message", e.getMessage());
	    }

	    return result;
	  }
	  
		@GetMapping("/studycafe/seatSelect2")
		public String showSeat2(@RequestParam("hno") int hno,int userNo,Model model) throws Exception {
			//user의 이용내역을 보여주는 history 불러오기
			History history=seatService.showUser(hno);
			//예약할 수 있는 모든 좌석 불러오기
			List<Seat>seat=seatService.showSeat();
			model.addAttribute("userNo",userNo);
			model.addAttribute("seat", seat);
			model.addAttribute("history", history);
			return "seat/changeSeat";
		}
	  
	  @PostMapping("/studycafe/choiceSeat2")
	  @ResponseBody
	  public Map<String, Object> choiceSeat2(@RequestParam int seatNumber, @RequestParam int hno) {
		System.out.println("seatNumber"+seatNumber);
		System.out.println("회원번호"+hno);
		
		Map<String, Object> result = new HashMap<String, Object>();
	    try {
	    	//좌석번호랑 히스토리번호 왔어
	     
	    boolean success = seatService.reserveSeat2(seatNumber,hno);
	     
	      result.put("success", success);
	      
	      if (!success) {
	    	  History history=seatService.showUser(hno);
	    	  if(history.getH_isUsing()>0) {
	    	
	    	  result.put("message", "이미 예약중입니다.");}
	      }
	    	} catch (Exception e) {
	    		result.put("success", false);
	    		result.put("message", e.getMessage());
	    	}
	    return result;
	  }
	  
	  
	  @PostMapping("/studycafe/cancelSeat2")
	  @ResponseBody
	  public Map<String, Object> cancelSeat2(@RequestParam("seatNumber") int seatNumber,@RequestParam int hno) {
		 Map<String, Object> result = new HashMap<String, Object>();
	    try {
	      
	      seatService.cancelSeat2(seatNumber,hno);
	      result.put("success", true);
	      
	      
	    } catch (Exception e) {
	      result.put("success", false);
	      result.put("message", e.getMessage());
	    }

	    return result;
	  }
}//클래스 끝


	

