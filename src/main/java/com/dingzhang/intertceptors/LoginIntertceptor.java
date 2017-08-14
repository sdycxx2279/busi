package com.dingzhang.intertceptors;

import com.dingzhang.model.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 检查登录是否过期
 * @author Xiao Xu
 * @create 2017-08-04 17:44
 **/

public class LoginIntertceptor implements HandlerInterceptor {


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("LoginUser");
        if(user!=null){
            //登陆成功的用户
            return true;
        }else {
            //没有登陆，转向登陆界面
            java.io.PrintWriter out=response.getWriter();
            out.println("<html>");
            out.println("<script>");
            String path=request.getContextPath() + "/login.do";
            out.println("window.open('"+path+"','_top')");
            out.println("</script>");
            out.println("</html>");
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
