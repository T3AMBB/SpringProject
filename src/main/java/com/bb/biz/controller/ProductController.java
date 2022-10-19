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
	public String selectOneProduct(Model model,ProductVO pVO,ProductVO pVO1,FavoriteVO fVO,HttpSession session){

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
	      List<ProductVO> recom = new ArrayList<ProductVO>();
	      pVO1.setPdetail("pname");
	      pVO1.setPname(pVO.getPname().substring(9, 13));
	      recom = productService.selectAllProduct(pVO1);
	      
	      model.addAttribute("recom", recom);
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
	@RequestMapping(value="/sortPrice.do") // 가격정렬
	public List<ProductVO> sortPrice(ProductVO pVO, Model model,HttpServletRequest request ) {
		int cnt = Integer.parseInt(request.getParameter("cnt"));
		System.out.println("sortPrice.do 로그"+pVO);
		List<ProductVO> products=productService.selectAllProduct(pVO);
		List<ProductVO> pro = new ArrayList<ProductVO>();

		if(products.size()>cnt) {

			for(int i=0; i<cnt;i++) {
				pro.add(products.get(i));
			}
			System.out.println("pro"+pro);
			return pro;		
		}
		return products;
	}
	@RequestMapping(value="/filter.do") // 필터검색
	public String filter(ProductVO pVO, Model model) {
		System.out.println("필터 : "+pVO);

		// 검색된 필터 속성 model에 저장 > 더보기, 가격정렬시 검색한 속성을 유지시키기 위해서
		model.addAttribute("pname",pVO.getPname());
		model.addAttribute("pcom", pVO.getPcom1());
		model.addAttribute("pmat", pVO.getPmat1());
		model.addAttribute("pmade", pVO.getPmade1());
		model.addAttribute("price", pVO.getPrice());
		model.addAttribute("price2", pVO.getPrice2());
		model.addAttribute("psize", pVO.getPsize());
		model.addAttribute("psize2", pVO.getPsize2());

		pVO.setPdetail("search");
		List<ProductVO> products=productService.selectAllProduct(pVO);
	
		model.addAttribute("pdetail", pVO.getPdetail());
		model.addAttribute("products", products);
		
		System.out.println("filter: "+products);
		return "product.jsp";

	}
	@RequestMapping(value="/searchName.do")
	public String searchName(ProductVO pVO, Model model) {
		
		pVO.setPdetail("search");
		pVO.setPrice(0);
		pVO.setPrice2(1000000);
		pVO.setPsize("0");
		pVO.setPsize2("50");
		System.out.println("이름검색 로그: "+ pVO.getPname());
		
		List<ProductVO> products=productService.selectAllProduct(pVO);

		model.addAttribute("pname",pVO.getPname());
		model.addAttribute("pdetail",pVO.getPdetail());
		model.addAttribute("price", pVO.getPrice());
		model.addAttribute("price2", pVO.getPrice2());
		model.addAttribute("psize", 0);
		model.addAttribute("psize2", 50);
		model.addAttribute("products", products);
		return "product.jsp";

	}

	@RequestMapping(value="/selectAllP.do") // 전체상품 보기
	public String selectAllProduct(ProductVO pVO,Model model, FavoriteVO fVO, HttpSession session) {

		List<ProductVO> products=productService.selectAllProduct(pVO); // 전체상품 데이터를 products에 저장

		fVO.setMid((String)session.getAttribute("member")); // 현재 로그인한 멤버 mid를 찜VO에 set
		List<FavoriteVO> favorite = favoriteService.selectAllFavorite(fVO); // 로그인한 멤버가 가지고 있는 찜정보(상품pid)를 favorite에 저장

		// 전체상품 products에 회원이 찜한 상품이 있는지 확인
		for(int i=0; i<favorite.size();i++) { // 찜한 상품수 만큼 반복
			for(int j=0; j<products.size();j++) { // 전체상품 데이터 크기만큼 반복 (=전체상품을 돌면서 찜한 상품이 있는지 확인)
				if(products.get(j).getPid()==favorite.get(i).getPid()) { // 좋아요한 상품이니? (찜테이블은 product테이블의 pid를 FK로 가짐)
					products.get(j).setFav(1); // 해당 상품에 fav를 1로 set => view에서 fav가 1이면 채워진 하트가 출력될 예정
					break;
				}
			}
		}
		
		// 가격,사이즈 범위 슬라이더 기본값 세팅
		model.addAttribute("price", 0); 
		model.addAttribute("price2", 1000000);
		model.addAttribute("psize", 0);
		model.addAttribute("psize2", 50);

		model.addAttribute("products", products);
		return "product.jsp";

	}
	@ResponseBody
	@RequestMapping(value="/selectAllPajax.do") // 더보기
	public HashMap<String,Object> selectAllProductajax(ProductVO pVO,HttpServletRequest request,Model model) {
		// 반환타입이 map인 이유 : 더보기 버튼표시의 유무를 저장할 String과, 더볼 데이터 List<ProductVO>를 함께 넘겨주기 위해서
		
		System.out.println("더보기"+pVO);
		// request.getParameter("cnt");  
		int cnt = pVO.getCnt(); // 사용자가 보고있는 데이터 개수

		List<ProductVO> products=productService.selectAllProduct(pVO); // 검색조건을 가진 pVO를 인자로 검색결과 데이터를 products에 저장 
		System.out.println("더보기 데이터:"+ products);

		HashMap<String,Object> hm = new HashMap<String,Object>(); 
		List<ProductVO> pro = new ArrayList<ProductVO>(); 

		if(cnt+24 < products.size()) { // 사용자에게 보여줄 데이터 < 검색결과 데이터(products) 
			for(int i=cnt; i<cnt+24 ;i++ ) { // 무조건 24번 반복
				pro.add(products.get(i));  // ex) 24~47번째 상품들을 pro에 저장, 48~71번째 상품들을 pro에 저장
				hm.put("more",1); // 더보기 버튼 활성화
			}
		}
		else {	// 사용자에게 보여줄 데이터 >= 검색결과 데이터(products) 
			for(int i=cnt; i < products.size();i++) { // 사용자가 보고있는 데이터개수 ~ 마지막 검색결과 데이터까지 반복
				pro.add(products.get(i)); 
				hm.put("more",0); // 더보기 버튼 비활성화
			}		
		}
		hm.put("pro", pro); // map에 "pro" 라는 키값으로 pro(List)를 value값으로 저장
		
		System.out.println("로그: "+pro);
		
		// 현재 hm에는 [{key:"more",value:"1 or 0"} , {key:"pro",value:pro(List<ProductVO>)}]
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
	@RequestMapping(value="/pay.do")
	public String pay(CouponVO cVO, Model model, HttpSession session) {

		cVO.setMid((String)session.getAttribute("member"));
		List<CouponVO> coupon = couponService.selectAllCoupon_STA(cVO);

		System.out.println("coupon : "+ coupon.size());
		model.addAttribute("coupon", coupon);
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