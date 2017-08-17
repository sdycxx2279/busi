package com.dingzhang.interceptors;

import com.dingzhang.model.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author Xiao Xu
 * @create 2017-08-17 18:49
 **/

public class AdInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        HttpSession session = httpServletRequest.getSession();
        User user = (User) session.getAttribute("LoginUser");
        if(user.getAd()==1){
            //用户有管理员权限
            return true;
        }else{
            //用户无管理员权限
            httpServletRequest.getRequestDispatcher("/exceedAuthority.do").forward(httpServletRequest, httpServletResponse);
            return false;
        }
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
