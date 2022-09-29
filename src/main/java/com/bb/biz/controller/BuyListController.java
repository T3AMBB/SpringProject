package com.bb.biz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bb.biz.buylist.BuylistService;
import com.bb.biz.buylist.BuylistVO;


@Controller
public class BuyListController {
	@Autowired
	private BuylistService buylistService;
	
	@RequestMapping(value="/insertF.do")
	public String InsertBuylist(BuylistVO bVO) {
		buylistService.insertBuylist(bVO);
		return "redirect:main.jsp";
	}
	@RequestMapping(value="/selectAllB.do")
	public String SelectAllBuylist(BuylistVO bVO, Model model) {
		List<BuylistVO> buylist =buylistService.selectAllBuylist(bVO);
		
		model.addAttribute("buylist", buylist);
		return "main.jsp";
	}
}
