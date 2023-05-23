package com.studycafe.food.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.studycafe.food.domain.Cart;
import com.studycafe.food.domain.Food;
import com.studycafe.food.domain.Order;
import com.studycafe.food.service.FoodService;
import com.studycafe.user.domain.User;


@Controller
public class FoodController {

	private static final Logger logger = LoggerFactory.getLogger(FoodController.class);
	
	@Autowired
	FoodService foodService;
	
	@GetMapping(value="/food/main")
	public String reqMain(Model model, HttpServletRequest req) throws Exception {
		List<Food> list = foodService.getFoodList();
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("AUTHUSER");
		int u_number = user.getU_number();
		model.addAttribute("list", list);
		model.addAttribute("u_number", u_number);
		return "/food/mainP";
	}
	
	//main페이지 호출
	@RequestMapping(value="/food/mainC", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> reqMainC(HttpServletRequest req) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("AUTHUSER");
		int u_number = user.getU_number();
		List<Cart> cartList = foodService.getCart(u_number);
		map.put("cartList", cartList);
		return map;
	}
	
	//장바구니에 상품 추가
	@RequestMapping(value="/food/addCart", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addCart(int food_no, HttpServletRequest req) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("AUTHUSER");
		int u_number = user.getU_number();
		Cart cart = new Cart(u_number, food_no);
		foodService.addCart(cart);
		List<Cart> cartList = foodService.getCart(u_number);
		map.put("cartList", cartList);
		return map;
	}
	
	//장바구니 수량 변경
	@RequestMapping(value="/food/changeQ", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> changeQuantity(int pm, int food_no, HttpServletRequest req) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("AUTHUSER");
		int u_number = user.getU_number();
		Cart cart = new Cart(u_number, food_no);
		if(pm == 1) {
			foodService.upQuantity(cart);
		}else {
			foodService.downQuantity(cart);
		}
		List<Cart> cartList = foodService.getCart(u_number);
		map.put("cartList", cartList);
		return map;
		
	}
	
	@RequestMapping(value="/food/deleteCart", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteCart(int food_no, HttpServletRequest req) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("AUTHUSER");
		int u_number = user.getU_number();
		if(food_no == 0) {
			foodService.deleteAllCart(u_number);
		}else {
			Cart cart = new Cart(u_number, food_no);
			foodService.deleteCart(cart);
		}
		List<Cart> cartList = foodService.getCart(u_number);
		map.put("cartList", cartList);
		return map;
	}
	
	
	@GetMapping("/food/order")
	public String order(String order_no, int order_price, Model model, HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("AUTHUSER");
		int u_number = user.getU_number();
		Map<String,Object> map = new HashMap<String, Object>();
		List<Cart> cart = foodService.getCart(u_number);
		map.put("order_no", order_no);
		map.put("u_number", u_number);
		map.put("order_price", order_price);
		map.put("cart", cart);
		foodService.insertOrder(map);
		foodService.insertDeatil(map);
		foodService.deleteAllCart(u_number);
		Order order = foodService.getOrderByNo(order_no);
		model.addAttribute("order", order);
		
		return "/food/success";
		
	}
	
	
	 
}

