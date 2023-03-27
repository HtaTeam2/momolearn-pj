package com.momolearn;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.time.LocalDateTime;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.momolearn.model.CommentRepository;
import com.momolearn.model.MembersRepository;
import com.momolearn.model.entity.Board;
import com.momolearn.model.entity.Comment;
import com.momolearn.model.entity.Members;
import com.momolearn.model.service.CommentService;
import com.momolearn.model.service.MembersService;

@ExtendWith(SpringExtension.class)
@SpringBootTest
class MomolearnApplicationTests {
	
	@Autowired MembersRepository membersRepository;
	@Autowired MembersService membersService;
	@Autowired CommentRepository commentRepository;
	@Autowired CommentService commentService;


	@Autowired
	private WebApplicationContext controller;
	
	private MockHttpSession session;
	
	private MockMvc mock;
	
	@BeforeEach
	public void init() {
		mock = MockMvcBuilders.webAppContextSetup(controller).build();
	}
	
	@AfterEach
	public void clear(){
	    session.clearAttributes();
	    session = null;
	}
	
	
//	@Test
//	@WithMockUser(username="test03", roles={"USER"})
//	public void 댓글등록() throws Exception {
//		
//		session = new MockHttpSession();
//		session.setAttribute("id", "test03");
//		
//		mock.perform(post("/board/1/comment").param("cmtContent", "댓내용").param("id", "test03").param("password", "1234")
//				.session(session))
//		.andExpect(status().isOk())
//		.andDo(print());
//		
//	}
	@WithMockUser(username="test04", roles={"USER"})
	@Test
	public void 조회() throws Exception{
		Members member = new Members();
		member.setMemId("test04");
		Board board = new Board("community","글제목","모집","글내용",member,0);
		Comment cmt = new Comment(1,board,member,"내용입니다",LocalDateTime.now());
		mock.perform(get("/board/2/comment")).andExpect(status().isOk()).andDo(print());
	}

//	@Test
//	@WithMockUser(username="test04", roles={"USER"})
//	void contextLoads() throws Exception {
//		
//		session = new MockHttpSession();
//		//세션값 설정
//		session.setAttribute("id", "test04");
//		
//		//로그인 테스트
//		mock.perform(post("/member/login").param("id", "test04").param("password", "1234")
//			.session(session))
//			.andExpect(status().is3xxRedirection())	//200이 아닌 304발생 - 컨트롤러에서 redirect로 화면 넘겨줄때
//			.andDo(print());
//		
//		//id와 approve(=true)로 강사 조회 테스트
//		mock.perform(get("/lectures/uploadcheck")
//			.session(session)
//			.param("id", "test04"))
//			.andExpect(status().isOk())
//			.andDo(print());
//		
//		//id와 approve(=true)로 강사 조회 테스트
//		mock.perform(multipart("/lectures/uploadlecture")
//			.param("title", "자바의 정석")
//			.param("price", "5000")
//			.param("teacher_no", "1")
//			.param("info", "강의 설명")
//			.param("description", "1"))
//			.andExpect(status().isOk())
//			.andDo(print());
//		
//	}
//	@Test
//	void joinTest() {
//		Members members = new Members();
////		members.setmemId("test1");
//		
//		String id = MembersService.join(members);
//		
//		Members findMem = membersRepository.findById(id).get();
//		assertThat(findMem.getMemId()).isEqualTo(members.getMemId());
//		
//	}
//	@Test
//	void TestException() {
//		Members members = new Members();
////		members.setmemId("test1");
//		
//		Members members1 = new Members();
////		members.setmemId("test1");
//		
//		MembersService.join(members);
//		IllegalStateException e = assertThrows(IllegalStateException.class, 
//				()->MembersService.join(members1));
//		
//		assertThat(e.getMessage()).isEqualTo("이미존재하는 회원입니다.");
//		
//	}
//	@Autowired
//	private WebApplicationContext controller;
//	
//	private MockHttpSession session;
//	
//	private MockMvc mock;
//	
//	@BeforeEach
//	public void init() {
//		mock = MockMvcBuilders.webAppContextSetup(controller).build();
//	}
//	
//	@AfterEach
//	public void clear(){
//	    session.clearAttributes();
//	    session = null;
//	}
//
//	@Test
//	@WithMockUser(username="test04", roles={"USER"})
//	void contextLoads() throws Exception {
//		
//		session = new MockHttpSession();
//		//세션값 설정
//		session.setAttribute("id", "test04");
//		
//		//로그인 테스트
//		mock.perform(post("/member/login").param("id", "test04").param("password", "1234")
//			.session(session))
//			.andExpect(status().is3xxRedirection())	//200이 아닌 304발생 - 컨트롤러에서 redirect로 화면 넘겨줄때
//			.andDo(print());
//		
//		//id와 approve(=true)로 강사 조회 테스트
//		mock.perform(get("/lectures/uploadcheck")
//			.session(session)
//			.param("id", "test04"))
//			.andExpect(status().isOk())
//			.andDo(print());
//		
//	}
	
	
	

}