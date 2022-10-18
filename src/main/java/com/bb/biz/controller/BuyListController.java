package com.bb.biz.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bb.biz.buylist.BuylistService;
import com.bb.biz.buylist.BuylistVO;
import com.bb.biz.coupon.CouponService;
import com.bb.biz.coupon.CouponVO;
import com.bb.biz.member.MemberService;
import com.bb.biz.member.MemberVO;
import com.bb.biz.product.ProductService;
import com.bb.biz.product.ProductVO;

@Controller
public class BuyListController {
   
   @Autowired
   private BuylistService buylistService;
   @Autowired
   private CouponService couponService;
   @Autowired
   private MemberService memberService;
   @Autowired
   private ProductService productService;
   
   @RequestMapping(value="/insertB.do")
   public String InsertBuylist(BuylistVO bVO, CouponVO cVO, MemberVO mVO,ProductVO pVO, Model model, HttpSession session) {
      List<ProductVO> cart =(List<ProductVO>) session.getAttribute("cart"); // 세션에 있는 장바구니 가져오기
       String mid=(String) session.getAttribute("member"); // 로그인한 멤버 가져오기
       int total =0; // 합계금액
       int totalsum=0; // 총 합계금액
      for(int i=0;i<cart.size();i++) { // 장바구니에 담긴 상품개수만큼 반복
    	  
         pVO.setPid(cart.get(i).getPid()); // 장바구에 담긴 상품의 PID를 set
         pVO.setPcnt(cart.get(i).getCnt()); // 장바구니에 담긴 상품 구매수량을 set
         productService.updateProduct(pVO); // 상품DB에 구매된 수량만큼 재고 차감
         
         total = cart.get(i).getPrice()*cart.get(i).getCnt(); // 수량*상품금액 계산
         System.out.println("total1 " + total);
         totalsum += total; // 총 합계금액 
         
         System.out.println("total2 " + totalsum);
         
         bVO.setMid(mid);
         bVO.setPid(cart.get(i).getPid());
         bVO.setBuycnt(cart.get(i).getCnt());
         System.out.println("1 : " + bVO.getMid());
         System.out.println("2 : " + bVO.getPid());
         System.out.println("3 : " + bVO.getBuycnt());
         System.out.println("4 : " + bVO.getShipping());
         System.out.println("5 : " + bVO.getPrcadr());
         System.out.println("6 : " + cVO.getCid());
         System.out.println("7 : " + mVO.getMileage());

      buylistService.insertBuylist(bVO);
      }
      
      double total_point = totalsum * 0.01; // 적립금 계산 (구매금액의 1%)
      System.out.println("total_point :" + total_point);

      if(totalsum <30000) { // 총 합계금액이 3만원 이하면
    	  totalsum+=3000; // 배송비 3천원 추가
      }

      if(cVO.getCid()!=0) { // 쿠폰을 사용했으면 
         couponService.updateCoupon(cVO); // 쿠폰의 상태 변경
         cVO=couponService.selectOneCoupon(cVO); // cid를 통해 해당 쿠폰 전체 정보 받아옴
         int coupontotal = ((int)Math.round(totalsum*(1-cVO.getDcrate()))); // 총합계금액*할인율 = "할인이 적용된 최종결제금액" 
         model.addAttribute("coupontotal", coupontotal); // 최종결제금액을 view에게 전달
         model.addAttribute("coupon", cVO); 
         System.out.println("쿠폰 실행 " + cVO.getCode());
      }
      else if(mVO.getMileage()<=0) { // 마일리지를 안썻으면
    	  mVO.setMileage((int)Math.round(total_point)); // 계산된 마일리지를 저장
    	  model.addAttribute("mileage", mVO.getMileage()); // 저장된 마일리지를 view에게 전달
    	  System.out.println("적립금 실행 " + mVO.getMileage()); 
    	  
    	  memberService.updateMileage(mVO); // 마일리지를 회원DB에 업데이트(마일리지 증가)
    	  
    	  // 마일리지 최신화(마이페이지 세션)
    	  mVO.setMid(mid);
    	  mVO=memberService.selectOneMember_CHECK(mVO);
    	  session.setAttribute("mileageU", mVO.getMileage());
      }
      else { // 마일리지를 썻으면
    	  mVO.setMileage(mVO.getMileage()*-1); // 음수 변환
    	  model.addAttribute("mileage", mVO.getMileage()); 
    	  System.out.println("적립금 사용 실행 " + mVO.getMileage());
    	  
    	  memberService.updateMileage(mVO); // 사용한 마일리지를 회원DB에 업데이트(마일리지 차감)
    	  // 마일리지 적립
    	  mVO.setMid(mid);
//    	  mVO.setMileage((int)Math.round(total_point));
//    	  memberService.updateMileage(mVO);
    	  
    	  // 마일리지 최신화(마이페이지 세션)
    	
    	  mVO=memberService.selectOneMember_CHECK(mVO);
    	  
    	  session.setAttribute("mileageU", mVO.getMileage());
      }
      
      List<BuylistVO> buyProduct= buylistService.selectAllBuylist(bVO);
      model.addAttribute("total", totalsum);
      model.addAttribute("buyProduct", buyProduct); 
      model.addAttribute("buy", cart); 
      
      session.removeAttribute("cart"); // 구매한 장바구니 초기화
      /*
       * List cart =(List)session.getAttribute("cart");
       * session.removeAttribute("cart");
       */
      
      return "success.jsp";
      
   }
   
   @RequestMapping(value="/selectAllB.do")
   public String SelectAllBuylist(BuylistVO bVO, Model model, HttpSession session) {
   
	   bVO.setMid((String)session.getAttribute("member"));
	   List<BuylistVO> buylist =buylistService.selectAllBuylist(bVO);

	   model.addAttribute("buylist", buylist);
      return "myBuylist.jsp";

   }
}