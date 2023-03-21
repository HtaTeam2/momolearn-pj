package com.momolearn.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.momolearn.model.MembersRepository;
import com.momolearn.model.entity.Members;
import com.momolearn.model.service.FileService;
import com.momolearn.model.service.MembersService;

@RestController
public class MemberSignUpController {
	
	@Autowired
	private MembersService membersService;
	
	@Autowired
	private MembersRepository membersRepository;
	
	@Autowired
	private FileService fileService;
	
	//회원가입 입력폼 -- 없어도 됨
    @GetMapping("member/joinView")
    protected ModelAndView memJoinView() throws SQLException {
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("redirect:/page/auth/join.jsp");   
		return mv;
	}
	

	// 회원가입 후 정보 보기 ( 회원가입 실패 / 정보 화면 미구현)
	@PostMapping(value = "member/join", produces = "application/json; charset=UTF-8")
	protected ModelAndView memInsert(Model sessionData, Members members, @RequestParam("memId") String memId,@RequestParam("password") String pw, @RequestParam("name") String name, @RequestParam("email") String email,@RequestParam("profile") MultipartFile file) throws SQLException, IOException {
		ModelAndView mv = new ModelAndView();
		
		System.out.println("insert() -----");
		
		
        // profile 파일 저장
		String savedFileName = fileService.getProfile(memId, file);
        
		members.setMemId(memId);
		members.setPw(pw);
		members.setName(name);
		members.setEmail(email);
		members.setProfile(savedFileName);
        members.setGrade("student");
        members.setRegdate(LocalDateTime.now());
		
		Members newmem = membersService.memJoin(members);
		
		// Member 저장
		membersRepository.save(members);

		sessionData.addAttribute("members", members); // 회원가입 정보를 모델에 담아서 리턴
		mv.setViewName("redirect:/page/auth/myInfo.html"); //정보화면으로 넘어가기

		return mv;
	}
    
	//아이디 중복 체크 (성공)
	@PostMapping("member/checkOk")
	public boolean dedupId( String memId) throws Exception {
		System.out.println("입력받은 데이터 : " + memId);
		
		boolean check = membersService.checkId(memId);
		System.out.println(check);
		
		return check;
	}			
}
