package com.bb.biz.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bb.biz.coupon.CouponService;
import com.bb.biz.coupon.CouponVO;
import com.bb.biz.favorite.FavoriteService;
import com.bb.biz.favorite.FavoriteVO;
import com.bb.biz.product.ProductService;
import com.bb.biz.product.ProductVO;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	@Autowired
	private CouponService couponService;
	
	@Autowired
	private FavoriteService favoriteService;
	
	
	@RequestMapping(value="/boardP.do")
	public String selectOneProduct(Model model,ProductVO pVO,FavoriteVO fVO,HttpSession session){
		
		List<ProductVO> cart =(List<ProductVO>) session.getAttribute("cart");
		if(cart==null){ 
			   
		    cart= new ArrayList<ProductVO>(); 
		   session.setAttribute("cart", cart);
		   }
		pVO=productService.selectOneProduct(pVO);
		
		fVO.setMid((String)session.getAttribute("member"));
		fVO.setPid(pVO.getPid());
		
		if(favoriteService.selectOneFavorite(fVO)!=null) {
			pVO.setFav(1);
		}
		for(int i=0;i<cart.size();i++) {
			if(cart.get(i).getPid()==pVO.getPid()) {
				pVO.setStatus(1);
			}
		}
		
		
		model.addAttribute("product", pVO);
		return "productDetail.jsp";
		
	}
	
	@RequestMapping(value="/main.do")
	public String main(ProductVO pVO, Model model,FavoriteVO fVO, HttpSession session) {
		
		fVO.setMid((String)session.getAttribute("member"));
		
		List<ProductVO> products=productService.selectAllProduct(pVO);
		List<FavoriteVO> favorite = favoriteService.selectAllFavorite(fVO);
		
		for(int i=0; i<favorite.size();i++) {
			for(int j=0; j<products.size();j++) {
				if(products.get(j).getPid()==favorite.get(i).getPid()) {
					products.get(j).setFav(1);
					break;
				}
			}
			
		}
		
		model.addAttribute("products", products);
		return "main.jsp";

	}

	@ResponseBody
	@RequestMapping(value="/sortPrice.do")
	public List<ProductVO> sortPrice(ProductVO pVO, Model model) {
		
//		System.out.println("sortPrice.do 로그"+pVO.getPdetail());
		List<ProductVO> products=productService.selectAllProduct(pVO);
		
		return products;
		
	}

	@RequestMapping(value="/filter.do")
	public String filter(ProductVO pVO, Model model) {
		System.out.println("필터 : "+pVO);
		
		model.addAttribute("pname",pVO.getPname());
		model.addAttribute("pcom", pVO.getPcom());
		model.addAttribute("pmat", pVO.getPmat());
		model.addAttribute("price", pVO.getPrice());
		model.addAttribute("price2", pVO.getPrice2());
		model.addAttribute("psize", pVO.getPsize());
		model.addAttribute("psize2", pVO.getPsize2());
		
		pVO.setPdetail("search");
		List<ProductVO> products=productService.selectAllProduct(pVO);
		
		model.addAttribute("products", products);
		return "product.jsp";
		
	}
	@RequestMapping(value="/searchName.do")
	public String searchName(ProductVO pVO, Model model) {
		pVO.setPdetail("pname");
		List<ProductVO> products=productService.selectAllProduct(pVO);
		
		model.addAttribute("products", products);
		return "product.jsp";
		
	}
	
	@RequestMapping(value="/selectAllP.do")
	public String selectAllProduct(ProductVO pVO,Model model, FavoriteVO fVO, HttpSession session) {
		
		fVO.setMid((String)session.getAttribute("member"));
		
		List<ProductVO> products=productService.selectAllProduct(pVO);
		List<FavoriteVO> favorite = favoriteService.selectAllFavorite(fVO);
		
		for(int i=0; i<favorite.size();i++) {
			for(int j=0; j<products.size();j++) {
				if(products.get(j).getPid()==favorite.get(i).getPid()) {
					products.get(j).setFav(1);
					break;
				}
			}
			
		}
		
		model.addAttribute("products", products);
		return "product.jsp";
		
	}
	@ResponseBody
	@RequestMapping(value="/selectAllPajax.do")
	public HashMap<String,Object> selectAllProductajax(ProductVO pVO,HttpServletRequest request) {
		request.getParameter("cnt");
		int cnt = pVO.getCnt();
		List<ProductVO> products=productService.selectAllProduct(pVO);
		HashMap<String,Object> hm = new HashMap<String,Object>();
		List<ProductVO> pro = new ArrayList<ProductVO>();
		
		pVO.setCnt(cnt+24);
		if(cnt+24 < products.size()) {
			for(int i=cnt; i<cnt+24;i++ ) {
				pro.add(products.get(i));
				hm.put("more",1);
			}
		}
		else {	
			for(int i=cnt; i < products.size();i++) {
				pro.add(products.get(i));
				hm.put("more",0);
			}		
		}
		hm.put("pro", pro);
		
		System.out.println("로그: "+products);
		return hm;
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="/cart.do") // 장바구니 추가
	public String cart(ProductVO pVO,HttpSession session,HttpServletRequest request){
		System.out.println("cart.do 로그: "+pVO);
	   int cnt= Integer.parseInt(request.getParameter("cnt"));
	   
	   List<ProductVO> cart =(List<ProductVO>) session.getAttribute("cart"); 
	   
	   if(cart==null){ 
	   
	    cart= new ArrayList<ProductVO>(); 
	   session.setAttribute("cart", cart);
	   }
	   pVO = productService.selectOneProduct(pVO);
	   
	  
	   pVO.setCnt(Integer.parseInt(request.getParameter("cnt")));
	   cart.add(pVO);
	   session.setAttribute("cart", cart);
	   System.out.println(cart);
	   return "success";
	     
	}
	
	@ResponseBody
	@RequestMapping(value="/cartU.do") // 장바구니 수량수정
	public String cartUpdate(ProductVO pVO,HttpSession session,HttpServletRequest request) {
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
	public String cartDelete(ProductVO pVO,HttpSession session,HttpServletRequest request) {
		List<ProductVO> cart =(List<ProductVO>) session.getAttribute("cart");

		for(int i=0;i<cart.size();i++) {
			if(cart.get(i).getPid()==Integer.parseInt(request.getParameter("pid"))){			
				cart.remove(cart.get(i));			
			}	
		}
		session.setAttribute("cart", cart);
		
		return "success";
	}
	
	@RequestMapping(value="/cartM.do") // 장바구니 비우기 
	public String cartEmpty(ProductVO pVO,HttpSession session,HttpServletRequest request) {
		List<ProductVO> cart =(List<ProductVO>) session.getAttribute("cart");
		session.setAttribute("cart", cart);
		session.removeAttribute("cart");
		
		return "cart.jsp";
	}
	@RequestMapping(value="/pay.do" ,method=RequestMethod.POST)
	public String pay(CouponVO cVO,ProductVO pVO,Model model,HttpServletRequest request) {
		
		List<CouponVO> coupon = couponService.selectAllCoupon(cVO);
		
		pVO=productService.selectOneProduct(pVO);
		pVO.setCnt(Integer.parseInt(request.getParameter("cnt")));
		model.addAttribute("pay", pVO);
		model.addAttribute("coupon", coupon);
		
		return "payment.jsp";
	}
	@RequestMapping(value="/pay.do" ,method=RequestMethod.GET)
	public String pay() {
		
		
		return "payment.jsp";
	}
	@RequestMapping(value="/cartP.do")
	public String cartPay(ProductVO pVO,HttpSession session,HttpServletRequest request) {
		
		List<ProductVO> cart =(List<ProductVO>) session.getAttribute("cart");
		
		pVO=productService.selectOneProduct(pVO);
		for(int i=0; i<cart.size();i++) {
			if(cart.get(i).getPid()==pVO.getPid()) {
			int	cnt =(cart.get(i).getCnt()+Integer.parseInt(request.getParameter("cnt")));
			cart.get(i).setCnt(cnt);
			session.setAttribute("cart", cart);
			return "cart.jsp";
			}
		}
		pVO.setCnt(Integer.parseInt(request.getParameter("cnt")));
		cart.add(pVO);
		session.setAttribute("cart", cart);
		
		return "cart.jsp";
	}
	
	

	
}