package com.human.java;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

// DB와 직접 연결하는 클래스  + mybatis를 통해서 데이터베이스 쿼리문을 관리
@Repository
public class RentDAO {
	// mybatis를 쓰기전에는 해당 클래스에 문자열의 형태인 sql 문장을 만들어야했습니다.
	// String sql ="";
	// mybatis를 사용하면 xml 파일을 통해서 DB연결관리는 도움받는것
	// config.xml (설정) & mapper.xml (쿼리) 이 필요합니다.
	// mybatis를 스프링에 등록하기위해서는 pom.xml 을 통해서 외부의 라이브러리를 추가
	// bean 이라는 객체로 설정 및 XML 파일을 추가 >> root-context.xml 에서 설정

	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public List<RentVO> getMovieList(RentVO vo) {
		System.out.println("DAO getMovieList 접근");
		// DB와 접근 >> select라는 조회
		// mapper라는 데이터 안에는 여러 쿼리문이 들어있는데 
		// 그 쿼리문마다 올바른 사용방법이 있습니다.
		// insert() / update() / delete() : 추가 수정 삭제 
		// selectOne() : 조회, 값이 하나만 조회해야하는 경우 > SELECT결과가 행이 하나여야합니다.
		// selectList() : 조회, 값이 여러개 조회해야하는 경우 > SELECT결과가 행이 몇개든 상관없습니다. 
		// 메소드("namespace.id", 입력할데이터(생략가능) )
		List<RentVO> rList = mybatis.selectList("rentDAO.getMovieList",vo);
		
		// rList : 데이터베이스를 접근하여 나온 결과
		// 화면까지 되돌려야합니다.
		return rList;
		
		// return mybatis.selectList("rentDAO.getMovieList");
	}
}
