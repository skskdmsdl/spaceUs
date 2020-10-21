package com.kh.spaceus.space.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spaceus.common.Utils;
import com.kh.spaceus.host.model.service.HostService;
import com.kh.spaceus.member.model.service.MemberService;
import com.kh.spaceus.member.model.vo.Coupon;
import com.kh.spaceus.member.model.vo.Member;
import com.kh.spaceus.qna.model.vo.Qna;
import com.kh.spaceus.reservation.model.service.ReservationService;
import com.kh.spaceus.reservation.model.vo.ReservationAvail;
import com.kh.spaceus.space.model.service.SpaceService;
import com.kh.spaceus.space.model.vo.Attachment;
import com.kh.spaceus.space.model.vo.Option;
import com.kh.spaceus.space.model.vo.OptionList;
import com.kh.spaceus.space.model.vo.Review;
import com.kh.spaceus.space.model.vo.Space;
import com.kh.spaceus.space.model.vo.SpaceList;
import com.kh.spaceus.space.model.vo.SpaceTag;
import com.kh.spaceus.space.model.vo.Star;
import com.kh.spaceus.space.model.vo.Tag;
import com.kh.spaceus.space.model.vo.Wish;

import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONArray;

@Controller
@Slf4j
@RequestMapping("/space")
public class SpaceController {

	@Autowired
	private SpaceService spaceService;

	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private HostService hostService;

	// 공간등록하기 화면
	@RequestMapping(value = "/insertSpace.do", method = RequestMethod.GET)
	public String insertSpace() {
		return "space/insertSpace";
	}
	
	//공간등록 제출
	@RequestMapping(value="/insertSpace.do",method = RequestMethod.POST)
	public String insertSpace(Space space,
							  @RequestParam String optionNo,
							  @RequestParam String day,
							  @RequestParam String[] tag,
							  @RequestParam(value="upFile",required=true) MultipartFile[] upFiles,
							  HttpServletRequest request,
							  RedirectAttributes redirectAttr,
							  Principal principal
							 ) {
		space.setMemberEmail(principal.getName());
		
	   //1. 파일을 서버컴퓨터에 저장
		List<Attachment> attachList  = new ArrayList<>();
		String saveDirectory = request.getServletContext()
									  .getRealPath("/resources/upload/space");
		
		for(MultipartFile f : upFiles) {
			
			if(!f.isEmpty() && f.getSize() != 0) {
				//1. 파일명 생성
				String renamedFileName = Utils.getRenamedFileName(f.getOriginalFilename());
				
				//2. 메모리의 파일 -> 서버경로상의 파일 
				File newFile = new File(saveDirectory, renamedFileName); //임의의 자바파일객체를 만들고 이동시킴
					try {
						f.transferTo(newFile);
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
				//3. attachment객체 생성(db 저장을 위한 준비)
				Attachment attach = new Attachment();
				attach.setOname(f.getOriginalFilename());
				attach.setRname(renamedFileName);
				attachList.add(attach);
			}
		}
		space.setAttachList(attachList);
		
		//2. 게시글, 첨부파일정보를 DB에 저장
		try {
			int result1 = spaceService.insertSpace(space);
			Space spaceInfo = spaceService.selectOneSpace(space.getBusinessNo());
			String spaceNo = spaceInfo.getSpaceNo();
			
			
			List<Map<String,Object>> info = new ArrayList<Map<String,Object>>();
			ReservationAvail reservationAvail = new ReservationAvail();
			
		    info = JSONArray.fromObject(day);
		    for (Map<String, Object> memberInfo : info) {
		    	if((int)memberInfo.get("startHour")==-1||(int)memberInfo.get("endHour")==-1)
		    		continue;
		    	reservationAvail.setDay((String) memberInfo.get("day"));
		    	reservationAvail.setSpaceNo(spaceNo);
		    	reservationAvail.setStartHour((int)memberInfo.get("startHour"));
		    	reservationAvail.setEndHour((int)memberInfo.get("endHour"));
		    	int result2 = reservationService.insertReservationVail(reservationAvail);
		    } 
		    String[] array = optionNo.split(",");
		    List<Option> optionList = new ArrayList<>();
		    Option option = new Option();
		    for(String str : array) {
		    	option.setOptionNo(str);
		    	option.setSpaceNo(spaceNo);
		    	int result3 = spaceService.insertOption(option);
		    }
		    
		    int result4 = 0;
		    SpaceTag spaceTag = new SpaceTag();
		    for(String s : tag) {
		    	Tag tagOne = spaceService.selectOneTag(s);
		    	spaceTag.setSpaceNo(spaceNo);
		    	spaceTag.setTagNo(tagOne.getNo());
		    	result4 = spaceService.insertSpaceTag(spaceTag);
		    }
		    String msg = result4 > 0 ? "공간이 등록되었습니다! 심사 후 공개로 전환됩니다." : "등록실패";
		    redirectAttr.addFlashAttribute("msg", msg);
		} catch(Exception e) {
			log.error("게시물 등록 오류", e);
			
			//예외발생을 spring container에게 전달 : 지정한  예외페이지로 응답처리
			throw e;
		}
	
		return "redirect:/";
	}

	@GetMapping("/insertHashTag.do")
	public ModelAndView insertHashTag(ModelAndView mav, @RequestParam("hashTag") String hashTag) {
		// 1.업무로직 : 중복체크
		Tag tag = spaceService.selectOneTag(hashTag);
		if (tag != null) {
			mav.addObject("hashTag", hashTag);
			mav.setViewName("jsonView");
		} else {
			spaceService.insertHashTag(hashTag);
			mav.addObject("hashTag", hashTag);
			mav.setViewName("jsonView");
		}
		return mav;
	}

	@RequestMapping("/spaceDetail.do")
	public String spaceDetail(Model model, @RequestParam("spaceNo") String spaceNo, Principal principal, Space space,
			@RequestParam(defaultValue = "1", value = "cPage") int cPage, HttpServletRequest request, HttpServletResponse response) {
		
		try {
			int qnaTotal = spaceService.selectQuestionTotalContents(spaceNo);
			
			// qna 조회
			final int limit1 = 5 + space.getQnaPaging(); 
			int offset1 = (cPage - 1) * limit1;
			int qnaPaging = space.getQnaPaging();
			int width = space.getWidth();
			
			List<Qna> qlist = spaceService.selectQuestionList(spaceNo, limit1, offset1);
			
			// 리뷰 한 페이지당 개수 제한
			final int limit = 5 + space.getReviewPaging(); 
			int offset = (cPage - 1) * limit;
			int reviewPaging = space.getReviewPaging();
			System.out.println("11111111reviewPaging"+reviewPaging);
			
			List<Review> review = spaceService.selectListReview(spaceNo, limit, offset);

			// 전체리뷰수 구하기
			int reviewTotal = spaceService.selectReviewTotalContents(spaceNo);
			// 별점조회
			Star star = spaceService.selectStar(spaceNo);
			
			star.setSumStar(star.getStar1() + star.getStar2() + star.getStar3() + star.getStar4() + star.getStar5());
			
			String url = request.getRequestURI() + "?spaceNo=" + spaceNo;
			String pageBar = Utils.getPageBarHtml(cPage, limit, reviewTotal, url);

			//쿠키검사 : spaceCookie
			Cookie[] cookies = request.getCookies();
			String spaceCookieVal = "";
			boolean hasRead = false;
			
			if(cookies != null) {
				for(Cookie c : cookies) {
					String name = c.getName();
					String value = c.getValue();
					
					if("spaceCookie".equals(name)) {
						spaceCookieVal = value;
						
						if(value.contains("[" + spaceNo + "]"))
							hasRead = true;
					}
				}
			}
			if(!hasRead) {
				//spaceCookie생성
				Cookie spaceCookie = new Cookie("spaceCookie", spaceCookieVal + "["+ spaceNo +"]");
				spaceCookie.setPath(request.getContextPath()+"/space");
				spaceCookie.setMaxAge(24*60*60);
				response.addCookie(spaceCookie);
				int result = spaceService.increaseSpaceReadCnt(spaceNo);	
			}
		
		space = spaceService.selectOneSpace(spaceNo);
		
		List<Tag> tag = spaceService.selectListSpaceTag(spaceNo);
		
		// 같은 카테고리 공간 리스트(최대 3개)
		List<SpaceList> spcList = spaceService.selectSameCategory(space);

		// 추천 공간 카테고리명
		String cateName = spaceService.selectCateName(spaceNo);

		
		System.out.println("1."+space.getAddress());
		System.out.println("2."+space.getSpaceName());
		System.out.println("3."+space.getContent());
		// option 조회
		List<OptionList> optionList = spaceService.selectOptionList(spaceNo);
		
		model.addAttribute("spcList", spcList);
		model.addAttribute("cateName", cateName);
		model.addAttribute("spaceAddr", space.getAddress());
		model.addAttribute("spaceName", space.getSpaceName());
		model.addAttribute("spaceCon", space.getContent());

		model.addAttribute("qlist", qlist);
		model.addAttribute("qnaPaging", qnaPaging);
		model.addAttribute("qnaTotal", qnaTotal);

		model.addAttribute("space", space);
		model.addAttribute("tag", tag);
		model.addAttribute("loginMember", principal);

		model.addAttribute("review", review);
		model.addAttribute("reviewTotal", reviewTotal);
		model.addAttribute("reviewPaging", reviewPaging);
		model.addAttribute("star", star); 
		model.addAttribute("pageBar", pageBar);
		model.addAttribute("width", width);
		
		model.addAttribute("optionList",optionList);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "space/spaceDetail";
	}
	
	
	//리뷰링크 클릭시 이동하는 공간상세페이지
	@RequestMapping("/spaceReviewDetail.do")
	public String spaceReviewDetail(Model model, @RequestParam("spaceNo") String spaceNo, Principal principal, Space space,
			@RequestParam(defaultValue = "1", value = "cPage") int cPage, HttpServletRequest request, HttpServletResponse response) {

		try {
			int qnaTotal = spaceService.selectQuestionTotalContents(spaceNo);
			
			// qna 조회
			final int limit1 = 5 + space.getQnaPaging(); 
			int offset1 = (cPage - 1) * limit1;
			int qnaPaging = space.getQnaPaging();
			int width = space.getWidth();
			
			List<Qna> qlist = spaceService.selectQuestionList(spaceNo, limit1, offset1);
			
			// 리뷰 한 페이지당 개수 제한
			final int limit = 5 + space.getReviewPaging(); 
			int offset = (cPage - 1) * limit;
			int reviewPaging = space.getReviewPaging();
			
			List<Review> review = spaceService.selectListReview(spaceNo, limit, offset);

			// 전체리뷰수 구하기
			int reviewTotal = spaceService.selectReviewTotalContents(spaceNo);
			// 별점조회
			Star star = spaceService.selectStar(spaceNo);
			
			star.setSumStar(star.getStar1() + star.getStar2() + star.getStar3() + star.getStar4() + star.getStar5());
			
			String url = request.getRequestURI() + "?spaceNo=" + spaceNo;
			String pageBar = Utils.getPageBarHtml(cPage, limit, reviewTotal, url);
			
			//쿠키검사 : spaceCookie
			Cookie[] cookies = request.getCookies();
			String spaceCookieVal = "";
			boolean hasRead = false;
			
			if(cookies != null) {
				for(Cookie c : cookies) {
					String name = c.getName();
					String value = c.getValue();
					
					if("spaceCookie".equals(name)) {
						spaceCookieVal = value;
						
						if(value.contains("[" + spaceNo + "]"))
							hasRead = true;
					}
				}
			}
			if(!hasRead) {
				//spaceCookie생성
				Cookie spaceCookie = new Cookie("spaceCookie", spaceCookieVal + "["+ spaceNo +"]");
				spaceCookie.setPath(request.getContextPath()+"/space");
				spaceCookie.setMaxAge(24*60*60);
				response.addCookie(spaceCookie);
				int result = spaceService.increaseSpaceReadCnt(spaceNo);
				log.info("result = {}",result);			
			}
		
		
		space = spaceService.selectOneSpace(spaceNo);
		List<Tag> tag = spaceService.selectListSpaceTag(spaceNo);

		// 같은 카테고리 공간 리스트(최대 6개)
		List<SpaceList> spcList = spaceService.selectSameCategory(space);

		// 추천 공간 카테고리명
		String cateName = spaceService.selectCateName(spaceNo);
		
		// option 조회
		List<OptionList> optionList = spaceService.selectOptionList(spaceNo);
		
		model.addAttribute("spcList", spcList);
		model.addAttribute("cateName", cateName);

		model.addAttribute("qlist", qlist);
		model.addAttribute("qnaPaging", qnaPaging);
		model.addAttribute("qnaTotal", qnaTotal);

		model.addAttribute("space", space);
		model.addAttribute("tag", tag);
		model.addAttribute("loginMember", principal);

		model.addAttribute("review", review);
		model.addAttribute("reviewTotal", reviewTotal);
		model.addAttribute("reviewPaging", reviewPaging);
		model.addAttribute("star", star); 
		model.addAttribute("pageBar", pageBar);
		
		model.addAttribute("optionList",optionList);
		model.addAttribute("bool", 1);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "space/spaceDetail";
	}
	
	@RequestMapping("/spaceQnaDetail.do")
	public String spaceQnaDetail(Model model, @RequestParam("spaceNo") String spaceNo, Principal principal, Space space,
			@RequestParam(defaultValue = "1", value = "cPage") int cPage, HttpServletRequest request, HttpServletResponse response) {
		
		try {
			int qnaTotal = spaceService.selectQuestionTotalContents(spaceNo);
			
			// qna 조회
			final int limit1 = 5 + space.getQnaPaging(); 
			int offset1 = (cPage - 1) * limit1;
			int qnaPaging = space.getQnaPaging();
			int width = space.getWidth();
			
			List<Qna> qlist = spaceService.selectQuestionList(spaceNo, limit1, offset1);
			
			// 리뷰 한 페이지당 개수 제한
			final int limit = 5 + space.getReviewPaging(); 
			int offset = (cPage - 1) * limit;
			int reviewPaging = space.getReviewPaging();
			System.out.println("11111111reviewPaging"+reviewPaging);
			
			List<Review> review = spaceService.selectListReview(spaceNo, limit, offset);

			// 전체리뷰수 구하기
			int reviewTotal = spaceService.selectReviewTotalContents(spaceNo);
			// 별점조회
			Star star = spaceService.selectStar(spaceNo);
			
			star.setSumStar(star.getStar1() + star.getStar2() + star.getStar3() + star.getStar4() + star.getStar5());
			
			String url = request.getRequestURI() + "?spaceNo=" + spaceNo;
			String pageBar = Utils.getPageBarHtml(cPage, limit, reviewTotal, url);

			//쿠키검사 : spaceCookie
			Cookie[] cookies = request.getCookies();
			String spaceCookieVal = "";
			boolean hasRead = false;
			
			if(cookies != null) {
				for(Cookie c : cookies) {
					String name = c.getName();
					String value = c.getValue();
					
					if("spaceCookie".equals(name)) {
						spaceCookieVal = value;
						
						if(value.contains("[" + spaceNo + "]"))
							hasRead = true;
					}
				}
			}
			if(!hasRead) {
				//spaceCookie생성
				Cookie spaceCookie = new Cookie("spaceCookie", spaceCookieVal + "["+ spaceNo +"]");
				spaceCookie.setPath(request.getContextPath()+"/space");
				spaceCookie.setMaxAge(24*60*60);
				response.addCookie(spaceCookie);
				int result = spaceService.increaseSpaceReadCnt(spaceNo);	
			}
		
		space = spaceService.selectOneSpace(spaceNo);
		
		List<Tag> tag = spaceService.selectListSpaceTag(spaceNo);
		
		// 같은 카테고리 공간 리스트(최대 3개)
		List<SpaceList> spcList = spaceService.selectSameCategory(space);

		// 추천 공간 카테고리명
		String cateName = spaceService.selectCateName(spaceNo);

		
		System.out.println("1."+space.getAddress());
		System.out.println("2."+space.getSpaceName());
		System.out.println("3."+space.getContent());
		// option 조회
		List<OptionList> optionList = spaceService.selectOptionList(spaceNo);
		
		model.addAttribute("bool", 2);
		model.addAttribute("spcList", spcList);
		model.addAttribute("cateName", cateName);
		model.addAttribute("spaceAddr", space.getAddress());
		model.addAttribute("spaceName", space.getSpaceName());
		model.addAttribute("spaceCon", space.getContent());

		model.addAttribute("qlist", qlist);
		model.addAttribute("qnaPaging", qnaPaging);
		model.addAttribute("qnaTotal", qnaTotal);

		model.addAttribute("space", space);
		model.addAttribute("tag", tag);
		model.addAttribute("loginMember", principal);

		model.addAttribute("review", review);
		model.addAttribute("reviewTotal", reviewTotal);
		model.addAttribute("reviewPaging", reviewPaging);
		model.addAttribute("star", star); 
		model.addAttribute("pageBar", pageBar);
		model.addAttribute("width", width);
		
		model.addAttribute("optionList",optionList);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "space/spaceDetail";
	}
	
	

	// 예약하기버튼
	@RequestMapping("/reserveSpace.do")
	public ModelAndView reserveSpace(
							   ModelAndView mav,
							   @RequestParam("spaceNo") String spaceNo,
							   Principal principal) {
		Space space = spaceService.selectOneSpace(spaceNo);
		Member member = memberService.selectOneMember(principal.getName());
		
		//spaceNo로 옵션정보가져와서 전달하기
		List<OptionList> optionList = spaceService.selectOptionList(spaceNo);
		
		//spaceNo로 예약가능한 날짜 가져오기
		List<ReservationAvail> availList = reservationService.selectListAvail(spaceNo);

		//쿠폰 보내기
		List<Coupon> couponList = memberService.selectCouponList(principal.getName());
		for(int i=0; i<couponList.size(); i++) {
			if(couponList == null)
				break;
			
			if(couponList.get(i).getType().equals("come"))
				couponList.get(i).setType("회원가입 축하 쿠폰");
			else if(couponList.get(i).getType().equals("btd"))
				couponList.get(i).setType("생일 축하 쿠폰");
			else
				couponList.get(i).setType("기타");
		}
		
		mav.addObject("space",space);
		mav.addObject("member",member);
		mav.addObject("optionList",optionList);
		mav.addObject("availList",availList);
		mav.addObject("couponList",couponList);
		
		mav.setViewName("space/reserveSpace");
		return mav;

	}

	// 위시리스트 추가
	@RequestMapping(value = "/heart.do", method = RequestMethod.POST)
	@ResponseBody
	public String insertWish(Wish wish, HttpServletResponse response) {
		int result = spaceService.insertWish(wish);
		
		String msg = (result>0) ? "위시 추가 성공!" : "위시 추가 실패";
		return msg;
	}

	// 좋아요수 읽어오고 전달받은 멤버이메일이 있을경우 좋아요 여부 검색하기
	@RequestMapping(value = "/readLikeCnt.do", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> selectLikeCount(Wish wish, HttpServletResponse response) {
		int cnt = spaceService.selectLikeCnt(wish.getSpaceNo());
		//좋아요 한 상태인지 아닌지
		String status = null;
		
		if(wish.getEmail()!=null) {
		  Wish selected = spaceService.selectOneWish(wish);
		  if(selected!=null) {
				status="liked";
			}else {
				status=null;
			}
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("status", status);
		map.put("cnt", cnt);
		
		return map;
	}

	// 위시리스트 삭제
	@RequestMapping(value = "/cancelHeart.do", method = RequestMethod.POST)
	@ResponseBody
	public String deleteWishList(Wish wish, HttpServletResponse response) {
		int result = spaceService.deleteWish(wish);
		spaceService.minusLikeCnt(wish);
		String msg = (result>0) ? "위시 삭제 성공!" : "위시 삭제 실패";
		return msg;
	}

	//인덱스 페이지 이용자리뷰
	@RequestMapping(value = "/recentRev.do", method = RequestMethod.GET)
	@ResponseBody
	public List<Review> selectRecentReviewList(){
		List<Review> revList = spaceService.selectRecentReviewList();
		return revList;
	}

	
	// 사업자등록증 조회
	@GetMapping("/checkIdDuplicate.do")
	public ModelAndView checkIdDuplicate1(ModelAndView mav, @RequestParam("businessNo") long businessNo) {

		// 1.업무로직 : 중복체크
		Space space = spaceService.selectOneSpace(businessNo);
		boolean isUsable = space == null;

		// 2. model에 속성 등록
		mav.addObject("isUsable", isUsable);

		// 3. viewName : jsonView빈 지정
		mav.setViewName("jsonView"); // /WEB-INF/views/jsonView.jsp

		return mav;
	}
	
	//인덱스 페이지 인기공간
	@GetMapping("/selectPopularSpaces.do")
	public ModelAndView selectPopularSpaces(ModelAndView mav) {

		List<SpaceList> popularList = spaceService.selectPopularSpaces();
		List<Attachment> imageList = new ArrayList<>(); 
		List<SpaceList> list = new ArrayList<>(); 
		
		 for(SpaceList s : popularList) { Attachment att =
		 spaceService.selectPopularImage(s.getSpaceNo());
		 s.setAddress(s.getAddress());
		 s.setRenamedFilename(att.getRname()); list.add(s); }
		 
		
		mav.addObject("list", popularList);
		mav.setViewName("jsonView");

		return mav;
	}
	
	@RequestMapping("/deleteSpace.do")
	public String deleteMember (@RequestParam("spaceNo") String spaceNo,
								Principal principal,
								RedirectAttributes redirectAttr) {
		//완료되지 않은 예약이 있으면 삭제못하게 막기
		//System.out.println(spaceNo+ " : " + principal.getName());
		int remainder = reservationService.confirmReservation(spaceNo);
		
		if(remainder != 0) {
			redirectAttr.addFlashAttribute("msg", "아직 예약이 있어 공간삭제가 불가능합니다.");
			return "redirect:/host/spaceInfo.do";
		}
		
		 //삭제 
		int result = spaceService.deleteSpace(spaceNo);
		
		 //성공하면 호스트->유저로 바꾸기 
		if(result>0) { 
			//권한변경
			int authResult = memberService.updateUser(principal.getName());
			redirectAttr.addFlashAttribute("msg", "성공적으로 공간을 삭제했습니다.");
			//SecurityContextHolder.clearContext();
		 } else
			 redirectAttr.addFlashAttribute("msg", "공간 삭제에 실패했습니다.");
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		List<GrantedAuthority> updatedAuthorities = new ArrayList<>();
		updatedAuthorities.add(new SimpleGrantedAuthority("ROLE_USER"));
		Authentication newAuth = new UsernamePasswordAuthenticationToken(auth.getPrincipal(), auth.getCredentials(), updatedAuthorities);
		SecurityContextHolder.getContext().setAuthentication(newAuth);
		
		return "redirect:/member/memberProfile.do";

	}
	
}
