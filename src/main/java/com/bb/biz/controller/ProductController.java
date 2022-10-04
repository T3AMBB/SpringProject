package com.bb.biz.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
	@RequestMapping(value="/cart.do")
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
	
	@RequestMapping(value="/cartU.do")
	public String cartUpdate(ProductVO vo,HttpSession session,HttpServletRequest request) {
		int cnt= Integer.parseInt(request.getParameter("cnt"));
		List<ProductVO> cart =(List<ProductVO>) session.getAttribute("cart");
//		vo=productService.selectOneProduct(vo);
		for(int i=0;i<cart.size();i++) {
			if(cart.get(i).getPid()==Integer.parseInt(request.getParameter("pid"))){			
				cart.get(i).setCnt(cnt);			
			}	
		}
		
			
			 session.setAttribute("cart", cart);
			return "cart.jsp";
		
		
	}
	@RequestMapping(value="/cartD.do")
	public String cartDelete(ProductVO vo,HttpSession session,HttpServletRequest request) {
		List<ProductVO> cart =(List<ProductVO>) session.getAttribute("cart");
//		vo=productService.selectOneProduct(vo);
		for(int i=0;i<cart.size();i++) {
			if(cart.get(i).equals(request.getParameter("pid"))){			
				cart.remove(cart.get(i));			
			}	
		}
		
		
		return "cart.jsp";
	}

	
}
