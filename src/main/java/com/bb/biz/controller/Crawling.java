package com.bb.biz.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.util.Iterator;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bb.biz.product.ProductService;
import com.bb.biz.product.ProductVO;

@Controller
public class Crawling  {

	@Autowired
	private ProductService productService;

	@RequestMapping("craw.do")
	public String sample (ProductVO vo, ProductVO vo2) {
		List<ProductVO> list=productService.selectAllProduct(vo);
		if(list.size()<5) {

			int n = 1; // 이미지 파일 번호
			int N = 1; // 상세이미지 파일 번호
			String figureUrl = "https://www.figurefarm.net/"; // 크롤링하려는 페이지의 url
			Document doc = null; // Document 객체 생성
			URL url = null;   // URL 객체생성
			InputStream in = null; // InputStream 객체 생성
			OutputStream out = null; // OutputStream 객체 생성

			try {
				doc = Jsoup.connect(figureUrl).get(); // Jsoup 클래스로 url 연결하여 정보를 doc에 담음

			} catch (IOException e) {
				e.printStackTrace();
			}

			String product = ".prdimg > a"; // 상세페이지로 가기 위한 주소가 있는 a태그
			Elements eles1 = doc.select(product); // a태그 정보만 eles1에 담음

			Iterator<Element> itr1 = eles1.iterator(); // 상세페이지 주소가 있는 a태그 정보를 요소 별로 분리
			itr1.next();
			itr1.next();
			itr1.next();
			itr1.next();
			while(itr1.hasNext()) {

				if(n>100) {
					break;
				}

				String product2 = itr1.next().attr("href"); // 장르를 정제하기 위해 속성값 href(상세정보 페이지) 추출
				//            System.out.println(product2);
				String str = "https://www.figurefarm.net/shop/detail.php?"+product2.substring(product2.lastIndexOf("?")+1,product2.indexOf("&"));
				System.out.println(str);
				//            System.out.println("로그"+product);
				String figureUrl2 = str; // 개별 소설의 상세정보 페이지
				Document doc2 = null;

				try {
					doc2 = Jsoup.connect(figureUrl2).get(); // 상세정보 페이지에 연결하여 정보를 담음

				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				String title = ".info > h3"; // 상세페이지에서의 제목 정보
				Elements eles2 = doc2.select(title); // 제목 정보만 eles2에 담음
				//         System.out.println("타이틀"+eles2);
				String price = ".info > .price > .sell > strong"; // 상세페이지에서의 가격 정보
				Elements eles6 = doc2.select(price); // 가격 정보만 eles6에 담음
				//         System.out.println("가격"+eles6);

				String img = ".prdimg > div > a > img";
				Elements eles4 = doc2.select(img);
				//         System.out.println("이미지"+eles4);

				String detail = ".list > tbody";
				Elements eles5 = doc2.select(detail);
				//         System.out.println("상품정보"+eles5);

				String a = ".detail_info";
				Elements eles7 = doc2.select(a);
				//			System.out.println("상세"+eles7);
				
				String detail_img = ".img_wrapper > img";
				Elements eles8 = doc2.select(detail_img);
				//			System.out.println("상세"+eles7);


				Iterator<Element> itr2 = eles2.iterator(); // 제목 정보를 요소별로 분리
				Iterator<Element> itr4 = eles4.iterator(); // 이미지 정보를 요소별로 분리
				Iterator<Element> itr5 = eles5.iterator(); // 상품 정보를 요소별로 분리
				Iterator<Element> itr6 = eles6.iterator(); // 가격 정보를 요소별로 분리
				Iterator<Element> itr7 = eles7.iterator(); // 상세 정보를 요소별로 분리
				Iterator<Element> itr8 = eles8.iterator(); // 상세 이미지를 요소별로 분리


				while(itr5.hasNext()) {

					String title2 = itr2.next().text();
					System.out.println("타이틀2: "+title2);
					
					String img2 = itr4.next().attr("src");
					System.out.println("이미지2: "+img2);
					
					String detail2 = itr5.next().text();
					System.out.println("상품정보2: "+detail2);
					
					String price2 = itr6.next().text();
					String price3=price2.replaceAll(",", "");
					String b = itr7.next().text();
					System.out.println("상세정보: "+b);
					
						try{
						String detail_img2 = itr8.next().attr("src");
						System.out.println("상세 이미지: "+detail_img2);
						vo2.setPdetail(detail_img2);
						}
						catch(java.util.NoSuchElementException e) {
						String detail_img2 = "";
						System.out.println("상세이미지2: "+detail_img2);
						vo2.setPdetail(detail_img2);
						} 
					
					int price4 = Integer.parseInt(price3);
					System.out.println("가격2: "+price4);

					if(-1!=detail2.lastIndexOf("재질") && -1!=detail2.lastIndexOf("치수")) {
						if(-1==b.lastIndexOf("정확한 발매이미지")) {
							String com = detail2.substring(detail2.lastIndexOf("제조사")+4, detail2.lastIndexOf("원산지"));
							System.out.println(com);

							String made = detail2.substring(detail2.lastIndexOf("원산지")+4, detail2.lastIndexOf("재질"));
							System.out.println(made);

							String mat = detail2.substring(detail2.lastIndexOf("재질")+3, detail2.lastIndexOf("치수"));
							System.out.println(mat);
							
							String size = "0";
							System.out.println(size);

							if(-1==detail2.lastIndexOf("약 :") ) {
								size = detail2.substring(detail2.lastIndexOf("치수")+5, detail2.lastIndexOf("cm"));
								System.out.println(size);
							}


							try {
								url = new URL(img2); // url 객체에 이미지 주소를 담음
								in = url.openStream(); // in 객체에 url 정보 담음(받고싶은 데이터 연결), 열림 1
								out = new FileOutputStream("D:\\0607Park\\이미지\\"+n+".png"); // out 객체에 저장경로(저장을 원하는 위치) 입력
								n++;
								while(true) {
									int data = in.read(); // in 객체로 해당 이미지를 읽어들임

									if(data==-1) { // 더이상 읽을것이 없으면 멈춤
										break;
									} 
									out.write(data); // 읽어들인 데이터를 경로에 작성		
								}
								
								vo2.setPmade(made);
								vo2.setPcom(com);
								vo2.setPmat(mat);
								vo2.setPsize(size);
								vo2.setPname(title2);
								vo2.setPimg(img2);
								vo2.setPrice(price4);
								vo2.setPcnt(10);
								System.out.println(vo2);
								productService.insertProduct(vo2);

							}catch (Exception e) {
								e.printStackTrace();
							} finally {
								try {
									in.close();
									out.close();
								} catch (IOException e) {
									e.printStackTrace();
								}            
							}  

						}
					}
				}
			}
		}

		return "main.do";
	}

	//	public static void main(String[] args) {
	//		Crawling cr = new Crawling();
	//		
	//		cr.sample();
	//	}

}
