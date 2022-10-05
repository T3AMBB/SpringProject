package com.bb.biz.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bb.biz.product.ProductService;
import com.bb.biz.product.ProductVO;

@Controller
public class ProductController {
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value="/boardP.do")
	public String selectOneProduct(Model model,ProductVO pVO){

		pVO=productService.selectOneProduct(pVO);
	
		model.addAttribute("product", pVO);
		return "productDetail.jsp";
		
	}
	
	@RequestMapping(value="/main.do")
	public String main(ProductVO pVO, Model model) {
		
		List<ProductVO> products=productService.selectAllProduct(pVO);
		
		model.addAttribute("products", products);
		return "main.jsp";

	}
	
	@RequestMapping(value="/selectAllP.do")
	public String selectAllProduct(ProductVO pVO,Model model) {
		
		List<ProductVO> products=productService.selectAllProduct(pVO);
		
		model.addAttribute("products", products);
		return "product.jsp";
		
	}
	@ResponseBody
	@RequestMapping(value="/cart.do") // 장바구니 추가
	public String cart(ProductVO vo,HttpSession session,HttpServletRequest request){
		
	   int cnt= Integer.parseInt(request.getParameter("cnt"));
	   
	   List<ProductVO> cart =(List<ProductVO>) session.getAttribute("cart"); 
	   
	   if(cart==null){ 
	   
	    cart= new ArrayList<ProductVO>(); 
	   session.setAttribute("cart", cart);
	   }
	   vo = productService.selectOneProduct(vo);
	   
	  
	   vo.setCnt(Integer.parseInt(request.getParameter("cnt")));
	   cart.add(vo);
	   session.setAttribute("cart", cart);
	   System.out.println(cart);
	   return "success";
	     
	}
	
	@ResponseBody
	@RequestMapping(value="/cartU.do") // 장바구니 수량수정
	public String cartUpdate(ProductVO vo,HttpSession session,HttpServletRequest request) {
		int cnt= Integer.parseInt(request.getParameter("cnt"));
		List<ProductVO> cart =(List<ProductVO>) session.getAttribute("cart");

		for(int i=0;i<cart.size();i++) {
			if(cart.get(i).getPid()==Integer.parseInt(request.getParameter("pid"))){			
				cart.get(i).setCnt(cnt);			
			}	
		}
		
			
			 session.setAttribute("cart", cart);
			return "success";
		
		
	}
	
	@ResponseBody
	@RequestMapping(value="/cartD.do") // 장바구니 상품 삭제
	public String cartDelete(ProductVO vo,HttpSession session,HttpServletRequest request) {
		List<ProductVO> cart =(List<ProductVO>) session.getAttribute("cart");

		for(int i=0;i<cart.size();i++) {
			if(cart.get(i).equals(request.getParameter("pid"))){			
				cart.remove(cart.get(i));			
			}	
		}
		session.setAttribute("cart", cart);
		
		return "success";
	}
	@RequestMapping(value="/cartM.do") // 장바구니 비우기 
	public String cartEmpty(ProductVO vo,HttpSession session,HttpServletRequest request) {
		List<ProductVO> cart =(List<ProductVO>) session.getAttribute("cart");
		session.setAttribute("cart", cart);
		session.removeAttribute("cart");
		
		return "cart.jsp";
	}
	@RequestMapping(value="/pay.do" ,method=RequestMethod.POST)
	public String pay(ProductVO vo,Model model,HttpServletRequest request) {
		
		vo=productService.selectOneProduct(vo);
		vo.setCnt(Integer.parseInt(request.getParameter("cnt")));
		model.addAttribute("pay", vo);
		
		return "payment.jsp";
	}
	@RequestMapping(value="/pay.do" ,method=RequestMethod.GET)
	public String pay() {
		
		
		return "payment.jsp";
	}

	
}
