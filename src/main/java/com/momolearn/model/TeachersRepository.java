package com.momolearn.model;

import java.util.Optional;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.momolearn.model.entity.Teachers;

@Repository
public interface TeachersRepository extends JpaRepository<Teachers, Integer>{

	//회원ID로 강사정보 조회
	Optional<Teachers> findByApplyTeacherMembersMemId(String memId);
	
	// 강사 신청서 정보를 강사 테이블에 저장
	Teachers save(Teachers teachers); 
		
	//강사 전체 목록 조회
	List<Teachers> findAll();
	
}
