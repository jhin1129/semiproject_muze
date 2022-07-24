package com.muze.mvc.common.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;

@WebFilter(filterName = "encoding", urlPatterns = "/*")
public class EncodingFilter implements Filter {
       
    public EncodingFilter() {
    }

    @Override
	public void init(FilterConfig fConfig) throws ServletException {
    	// 컨테이너가 필터를 생성 후 초기화를 위해서 호출한다.
    	System.out.println("인코딩 필터가 생성되어 초기화 진행");
	}

    @Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
    	
    	HttpServletRequest hr = (HttpServletRequest)request;
    	
    	if (hr.getMethod().equals("POST")) {
    		hr.setCharacterEncoding("UTF-8");
		}
 
		chain.doFilter(request, response);
	}

    @Override
	public void destroy() {
	}
}
