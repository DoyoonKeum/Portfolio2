package com.studycafe.reservation.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.studycafe.reservation.domain.RoomReservation;
import com.studycafe.reservation.service.RoomReservationService;
import com.studycafe.user.domain.User;

import net.sf.json.JSONObject;





@Controller
public class RoomReservationController {

	@Autowired
	RoomReservationService roomReservationService;
	
	//예약 메인페이지 연결
	@GetMapping("/reservation/Main")
	public String reservation() {
		return "reservationMain";
	}
	
	//A룸 조회
	@GetMapping("/reservation/DetailA")
	public String getReservationDetailA(Model model) throws Exception {
		return "reservationDetailA";
	}
	
	@GetMapping("/reservation/DetailB")
	public String getReservationDetailB(Model model) throws Exception {
		return "reservationDetailB";
	}
	
	@GetMapping("/reservation/DetailC")
	public String getReservationDetailC(Model model) throws Exception {
		return "reservationDetailC";
	}
	
	@GetMapping("/reservation/DetailD")
	public String getReservationDetailD(Model model) throws Exception {
		return "reservationDetailD";
	}
	
	@PostMapping("/reservation/Success")
	public String reservationSuccess(RoomReservation roomReservation) throws Exception {
		int cnt = roomReservationService.insertRoomReservation(roomReservation);
		System.out.println("cnt="+cnt);
		return "reservationSuccess";
	}
	
	@GetMapping("/reservation/Confirm")
	public String getReservationConfirm(HttpServletRequest request, Model model) throws Exception {
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("AUTHUSER");
		List<RoomReservation> list = roomReservationService.getReservationDetail(user.getU_number()); 
		model.addAttribute("list",list);
		return "reservationConfirm";
	}
	
	
   @RequestMapping(value="/timeCheckA",
   method=RequestMethod.POST,
   produces="application/text;charset=utf8")
   @ResponseBody
   public String timeCheckA(@RequestParam("rs_date") String rs_date) throws Exception {

   if(rs_date==null)
       return null;
    
   List<RoomReservation> roomReservation = roomReservationService.timeCheckA(rs_date);
    
   JSONObject jsonObject = new JSONObject();
   jsonObject.put("time", roomReservation);
   String jsonInfo = jsonObject.toString();
    
    return jsonInfo; //클라이언트에게 응답
	 }
   
   @RequestMapping(value="/timeCheckB",
   method=RequestMethod.POST,
   produces="application/text;charset=utf8")
   @ResponseBody
   public String timeCheckB(@RequestParam("rs_date") String rs_date) throws Exception {

   if(rs_date==null)
       return null;
    
   List<RoomReservation> roomReservation = roomReservationService.timeCheckB(rs_date);
    
   JSONObject jsonObject = new JSONObject();
   jsonObject.put("time", roomReservation);
   String jsonInfo = jsonObject.toString();
    
    return jsonInfo; //클라이언트에게 응답
	 }
   
   @RequestMapping(value="/timeCheckC",
   method=RequestMethod.POST,
   produces="application/text;charset=utf8")
   @ResponseBody
   public String timeCheckC(@RequestParam("rs_date") String rs_date) throws Exception {

   if(rs_date==null)
       return null;
    

   List<RoomReservation> roomReservation = roomReservationService.timeCheckC(rs_date);
    
   JSONObject jsonObject = new JSONObject();
   jsonObject.put("time", roomReservation);
   String jsonInfo = jsonObject.toString();
    
    return jsonInfo; //클라이언트에게 응답
	 }
   
   @RequestMapping(value="/timeCheckD",
   method=RequestMethod.POST,
   produces="application/text;charset=utf8")
   @ResponseBody
   public String timeCheckD(@RequestParam("rs_date") String rs_date) throws Exception {

   if(rs_date==null)
       return null;
    

   List<RoomReservation> roomReservation = roomReservationService.timeCheckD(rs_date);
    
   JSONObject jsonObject = new JSONObject();
   jsonObject.put("time", roomReservation);
   String jsonInfo = jsonObject.toString();
    
    return jsonInfo; //클라이언트에게 응답
	 }
   
	
	@GetMapping("/slider")
	public String slider() {
		
		return "/reservation/slider";
	}
	
	
}
