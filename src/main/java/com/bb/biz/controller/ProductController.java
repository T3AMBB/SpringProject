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
	
}
