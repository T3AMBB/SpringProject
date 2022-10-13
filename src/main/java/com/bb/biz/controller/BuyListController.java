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
      List<ProductVO> cart =(List<ProductVO>) session.getAttribute("cart");
       String mid=(String) session.getAttribute("member");
       int total =0;
       int totalsum=0;
      for(int i=0;i<cart.size();i++) {
    	  
         pVO.setPid(cart.get(i).getPid());
         pVO.setPcnt(cart.get(i).getCnt());
         productService.updateProduct(pVO);
         
         total = cart.get(i).getPrice()*cart.get(i).getCnt();
         System.out.println("total1 " + total);
         totalsum += total;
         
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
         
         
         
      }
    
      
      
      double total_point = totalsum * 0.01;
      if(totalsum <30000) {
    	  totalsum+=3000;
      }
      System.out.println("total_point :" + total_point);
      buylistService.insertBuylist(bVO);
      
      if(cVO.getCid()!=0) {
         couponService.updateCoupon(cVO);
         cVO=couponService.selectOneCoupon(cVO);
         int coupontotal = ((int)Math.round(totalsum*(1-cVO.getDcrate())));
         model.addAttribute("coupontotal", coupontotal);
         model.addAttribute("coupon", cVO);
         System.out.println("쿠폰 실행 " + cVO.getCode());
      }
      else if(mVO.getMileage()<=0) {
    	  mVO.setMileage((int)Math.round(total_point));
    	  model.addAttribute("mileage", mVO.getMileage());
    	  System.out.println("적립금 실행 " + mVO.getMileage());
    	  memberService.updateMileage(mVO);    	 
      }
      else {
    	  mVO.setMileage(mVO.getMileage()*-1);
    	  model.addAttribute("mileage", mVO.getMileage());
    	  System.out.println("적립금 사용 실행 " + mVO.getMileage());
    	  memberService.updateMileage(mVO);  
      }
      
      
      bVO.setMid(mid);
      List<BuylistVO> buyProduct= buylistService.selectAllBuylist(bVO);
      model.addAttribute("total", totalsum);
      model.addAttribute("buyProduct", buyProduct); 
      model.addAttribute("buy", cart); 
      
      
      
      session.removeAttribute("cart");
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