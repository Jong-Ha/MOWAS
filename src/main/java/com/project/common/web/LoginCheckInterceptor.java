package com.project.common.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginCheckInterceptor implements HandlerInterceptor {

	public LoginCheckInterceptor() {
		System.out.println("LoginCheckInterceptor 기본 생성자");
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		System.out.println("LoginCheckInterceptor start");
		String uri = request.getRequestURI();
		String json = "";// RestController,Controller
		uri = uri.substring(uri.indexOf("/") + 1);
		String controller = uri.substring(0, uri.indexOf("/"));// user,product...
		uri = uri.substring(uri.indexOf("/") + 1);
		String method = uri;// login,logout...

		HttpSession session = request.getSession();

		// 비로그인
		if(false){
			return false;
		}

		return true;

	}// end of preHandle

}
