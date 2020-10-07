package com.bonvoyage.interceptor;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonvoyage.domain.UserRole;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class NoticeInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {
//		System.out.println("Calling preHandle");
        return super.preHandle(request, response, handler);

    }

    @Override
    public void postHandle(HttpServletRequest request,
                           HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        Principal principal = request.getUserPrincipal();
//        modelAndView.getModelMap().addAttribute ("Role", "TEST");
//        if (principal != null) {
//            if (request.isUserInRole("ADMIN"))
//                modelAndView.getModelMap().addAttribute ("Role", UserRole.ADMIN);
//            else
//                modelAndView.getModelMap().addAttribute("Role", principal.getName());
//        }

//		System.out.println("Calling postHandle");
//        modelAndView.getModelMap().addAttribute("SpecialBlurb", userMessage);
        super.postHandle(request, response, handler, modelAndView);
    }

    @Override
    public void afterCompletion(HttpServletRequest request,
                                HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
//		System.out.println("Calling afterCompletion");
        super.afterCompletion(request, response, handler, ex);
    }

}
