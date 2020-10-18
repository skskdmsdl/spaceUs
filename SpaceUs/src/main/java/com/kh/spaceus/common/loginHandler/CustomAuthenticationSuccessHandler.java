package com.kh.spaceus.common.loginHandler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler{

	 private RequestCache requestCache = new HttpSessionRequestCache();
	    private RedirectStrategy redirectStratgy = new DefaultRedirectStrategy();
	    
	 
	    @Override
	    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
	            Authentication authentication) throws IOException, ServletException {
	        
	        
	        resultRedirectStrategy(request, response, authentication);
	        
	    }
	 
	    
	    protected void resultRedirectStrategy(HttpServletRequest request, HttpServletResponse response,
	            Authentication authentication) throws IOException, ServletException {
	        
	    	RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	    	RequestCache requestCache = new HttpSessionRequestCache();

	    	SavedRequest savedRequest = requestCache.getRequest(request, response); 
	    	String targetUrl = savedRequest.getRedirectUrl();
	    	System.out.println(targetUrl);
	    	redirectStrategy.sendRedirect(request, response, targetUrl);



	    	
	    	/* SavedRequest savedRequest = requestCache.getRequest(request, response);
	        
	        if(savedRequest!=null) {
	            String targetUrl = savedRequest.getRedirectUrl();
	            redirectStratgy.sendRedirect(request, response, targetUrl);
	        } else {
	        	String targetUrl = savedRequest.getRedirectUrl();
	            redirectStratgy.sendRedirect(request, response, targetUrl);
	        }*/
	        
	    }
}



