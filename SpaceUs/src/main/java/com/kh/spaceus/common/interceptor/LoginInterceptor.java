package com.kh.spaceus.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.FlashMapManager;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.kh.spaceus.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request,
							 HttpServletResponse response,
							 Object handler)
					throws Exception {
		log.debug("로그인 여부 체크!");

		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		if(loginMember == null) {
			
			FlashMap flashMap = new FlashMap();
			flashMap.put("msg", "로그인 후 이용할 수 있습니다.");
			
			FlashMapManager manager = RequestContextUtils.getFlashMapManager(request);
			manager.saveOutputFlashMap(flashMap, request, response);
			
			String uri = request.getRequestURI();
			uri = uri.replace(request.getContextPath(), "");
			
			String param = request.getQueryString();
			
			uri += (!"".equals(param)) ? 
					 "?" + param :
						 param;
			
			log.debug("uri = {}" + uri);
			
			session.setAttribute("next", uri);
			
			response.sendRedirect(request.getContextPath() + "/member/memberLoginForm.do");
			
			return false;
		}
		
		
		return super.preHandle(request, response, handler);
	}
}
