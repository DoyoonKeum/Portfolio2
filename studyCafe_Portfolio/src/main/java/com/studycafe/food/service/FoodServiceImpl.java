package com.studycafe.food.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studycafe.food.domain.Cart;
import com.studycafe.food.domain.Food;
import com.studycafe.food.domain.Order;
import com.studycafe.food.repository.FoodRepository;

@Service
public class FoodServiceImpl implements FoodService {
	
	@Autowired
	FoodRepository foodRepository; 
	
	//전체 목록 조회
	@Override
	public List<Food> getFoodList() throws Exception{
		return foodRepository.getFoodList();
	}
	
	//특정 종류 조회
	@Override
	public List<Food> getTypeFoodList(int type) throws Exception{
		return foodRepository.getTypeFoodList(type);
	}
	
	//장바구니 조회
	@Override
	public List<Cart> getCart(int u_number) throws Exception{
		return foodRepository.getCart(u_number);
	}
	
	//장바구니 상품 존재하는지
	@Override
	public Cart existCart(Cart cart) throws Exception{
		return foodRepository.existCart(cart);
	}
	
	//장바구니에 상품 추가
	@Override
	public void addCart(Cart cart) throws Exception {
		foodRepository.addCart(cart);
	}
	
	//장바구니 상품 수량+
	@Override
	public void upQuantity(Cart cart) throws Exception {
		foodRepository.upQuantity(cart);
	}
	
	//장바구니 상품 수량-
	@Override
	public void downQuantity(Cart cart) throws Exception {
		foodRepository.downQuantity(cart);
	}
	
	//장바구니 상품 삭제
	@Override
	public void deleteCart(Cart cart) throws Exception {
		foodRepository.deleteCart(cart);
	}
	
	//장바구니 상품 전부 삭제
	@Override
	public void deleteAllCart(int u_number) throws Exception {
		foodRepository.deleteAllCart(u_number);
	}
	
	//결제 완료 후 주문 추가
	@Override
	public void insertOrder(Map<String, Object> map) throws Exception {
		foodRepository.insertOrder(map);
	}
	
	//결제 완료 후 상세 주문 추가
	@Override
	public void insertDeatil(Map<String, Object> map) throws Exception {
		foodRepository.insertDetail(map);
	}
	
	//주문번호로 주문정보 가져오기
	@Override
	public Order getOrderByNo(String order_no) throws Exception {
		return foodRepository.getOrderByNo(order_no);
	}
}
