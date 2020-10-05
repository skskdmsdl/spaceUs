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
public class RefererInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
					throws Exception {
		log.info("인터셉트 체크!");
		HttpSession session = request.getSession();
		String referer = request.getHeader("referer");
			
		session.setAttribute("referer", referer);
		response.sendRedirect("redirect:" + referer);
			
		return super.preHandle(request, response, handler);
	}
}
