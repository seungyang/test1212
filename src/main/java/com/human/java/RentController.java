package com.human.java;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

//JAVA를 효율적으로 코딩하기위해 필요한 구조가  MVC 디자인 패턴
// M odel
// - JAVA를 이용해서 DB에 연결하는 과정에 대한 파일, 로직
// V iew
// - JSP, html, css, js등 화면에 출력하고자 하는 파일, 페이지
// C ontroller
// - 화면과 로직에 대해서 연결해주는 파일, 연결점

@Controller
public class RentController {
	
	// @Autowired : 스프링의 빈 컨테이너 안에 있는 객체를 탐색해주는 키워드
	// 빈 컨테이너 : servlet-context.xml 에서 만든 객체들
	@Autowired
	private RentDAO rentDAO; // RentDAO 라는 객체명을 가진 빈을 만들어준것

	// 우리가 매번 new를 통한 인스턴스 생성 혹은 싱글톤패턴을 만들 필요가 없어짐 
	
	// controller : 화면과 로직에 대해서 연결해주는 파일
	// @RequestMapping : 화면에서 요청할 이름,키워드,호출이름
	// return : 요청이 들어오면 보여줄 파일,화면,페이지
	
	// 화면에서 요청할 이름은 getMovieList 입니다.
	@RequestMapping("getMovieList")
	public String getMovieList(RentVO vo, Model model) {
		
		System.out.println("컨트롤러 진입");
		
		//----
		System.out.println(vo.getRentTitle());
		System.out.println(vo.getRentDirector());
		// 1. 검색어들을 위한 변수를 만들어도되고
		// 2. VO라는 변수를 이용해도되고
		
		// 1. 사용자가 검색어를 아예 안썻을떄	>> ""
		// 2. 사용자가 검색어를 올바르게 썻을때	>> 올바른값
		// 3. 페이지에 처음 들어왓을떄 		>> null
		if ( vo.getRentTitle() == null && vo.getRentDirector() == null){
			// 처음 로딩햇을때
			return "rentTest";
		}else {
			//--
			
			
			// 필요하다면  Model 에 대해 구현 ( 로직 , JAVA를 이용해서 DB에 연결하는 과정 )
			// Services도 만들고 DAO도 만드는것이 가장좋습니다.
			// 각각의 파일들에게 코드를 분업화 하는 것
			List<RentVO> rList = rentDAO.getMovieList(vo);
			
			System.out.println("컨트롤러 복귀");
			
			// rList : DB로 부터 가져온 데이터를 화면에 출력
			// session, model 등 통신을위한 내장객체를 활용, 파라미터로 선언해주시면 됩니다.
			model.addAttribute("rList", rList);
			// getMovieList 요청이 들어오면 보여줄 페이지이름
	//		return "test"; // WEB-INF/views/test.jsp 라는 파일
			// 추후에는 보여줄 페이지를 rendTest로 변경
			return "rentTest";
			// 위와 같은 경로가 만들어지는 이유 : servlet-context.xml에 설정되어잇음
			// - org.springframework.web.servlet.view.InternalResourceViewResolver
		}
	}
	
	@RequestMapping("ajax")
	@ResponseBody	
	// @ResponseBody 어노테이션이 붙으면 return 이라는친구가 페이지로 변환하는것이 아니라 데이터를 리턴
	public String ajax(RentVO vo) {
		
		System.out.println("ajax접근");
		System.out.println(vo.getRentTitle());
		System.out.println(vo.getRentDirector());
		
		// 데이터베이스 조회
		List<RentVO> rList = rentDAO.getMovieList(vo);
		
		
		return "ajax데이터";
		// return rList; // 이 코드가 정상적으로 진행되도록 구현 (*) List형태가 자바스크립에서 문제가 없어야합니다.
	}
}























