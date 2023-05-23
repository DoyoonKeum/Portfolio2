package com.studycafe.food.service;

import java.util.List;
import java.util.Map;

import com.studycafe.food.domain.Cart;
import com.studycafe.food.domain.Food;
import com.studycafe.food.domain.Order;

public interface FoodService {
	
	//전체 목록 조회
	public List<Food> getFoodList() throws Exception;
	
	//특정 종류 조회
	public List<Food> getTypeFoodList(int type) throws Exception;
	
	//장바구니 조회
	public List<Cart> getCart(int u_number) throws Exception;
	
	//장바구니 상품 존재하는지
	public Cart existCart(Cart cart) throws Exception;
	
	//장바구니에 상품 추가
	public void addCart(Cart cart) throws Exception;
	
	//장바구니 상품 수량+
	public void upQuantity(Cart cart) throws Exception;
	
	//장바구니 상품 수량-
	public void downQuantity(Cart cart) throws Exception;
	
	//장바구니 상품 삭제
	public void deleteCart(Cart cart) throws Exception;
	
	//장바구니 상품 전부 삭제
	public void deleteAllCart(int u_number) throws Exception;
	
	//결제 완료 후 주문 추가
	public void insertOrder(Map<String, Object> map) throws Exception;
	
	//결제 완료 후 상세 주문 추가
	public void insertDeatil(Map<String, Object> map) throws Exception;
	
	//주문번호로 주문정보 가져오기
	public Order getOrderByNo(String order_no) throws Exception;
	
	
}
