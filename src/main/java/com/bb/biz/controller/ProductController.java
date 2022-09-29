package com.bb.biz.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bb.biz.product.ProductService;
import com.bb.biz.product.ProductVO;

@Controller
public class ProductController {
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value="/boardP.do")
	public String selectOne(Model model,ProductVO pVO){

		pVO=productService.selectOne(pVO);
		if(pVO==null) {
			return "login.jsp";
		}
		else {
			
			
			model.addAttribute("product", pVO);
			return "redirect:main.do";
		}

	}
	@RequestMapping(value="/selectAllP.do", method=RequestMethod.GET)
	public String selectAll(ProductVO pVO,Model model) {
		
		
		List<ProductVO> products=productService.selectAll(pVO);
		
		model.addAttribute("products", products);
		return "redirect:main.do";

	}
	
	
	
}
