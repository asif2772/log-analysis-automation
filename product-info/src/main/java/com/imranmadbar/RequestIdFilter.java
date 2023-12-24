//package com.imranmadbar;
//
//
//import java.io.IOException;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.slf4j.MDC;
//import org.springframework.stereotype.Component;
//
//import jakarta.servlet.Filter;
//import jakarta.servlet.FilterChain;
//import jakarta.servlet.FilterConfig;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.ServletRequest;
//import jakarta.servlet.ServletResponse;
//import jakarta.servlet.http.HttpServletRequest;
//
//@Component
//public class RequestIdFilter implements Filter {
//
//    private Logger logger = LoggerFactory.getLogger(RequestIdFilter.class);
//
//    @Override
//    public void init(FilterConfig filterConfig) throws ServletException {}
//
//    @Override
//    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
//            throws IOException, ServletException {
//        try {
//            MDC.put("X-Request-ID", ((HttpServletRequest) request).getHeader("X-Request-ID"));
//            chain.doFilter(request, response);
//        } catch (Exception e) {
//            logger.warn(e.getMessage());
//        } finally {
//            MDC.clear();
//        }
//    }
//
//    @Override
//    public void destroy() {}
//}