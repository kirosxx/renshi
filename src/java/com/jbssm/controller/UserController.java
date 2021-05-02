package com.jbssm.controller;


import com.jbssm.domain.Employee;
import com.jbssm.domain.User;
import com.jbssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Repository
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService service;

    /**
     * 登录和cookie
     * @param user
     * @param request
     * @param response
     * @return
     * @throws IOException
     */
    @RequestMapping(value="/login",method= RequestMethod.POST)
    public String login(User user, HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        User loginuser = service.login(user);
        request.getSession().setAttribute("loginuser",loginuser);
        request.getSession().setAttribute("uname",loginuser.getUsername());

        if (loginuser == null){
                PrintWriter out=response.getWriter();
                out.print("<script language='javascript'>alert('账号或密码错误,请重新输入'); " +
                        "window.setTimeout(\"window.location='../login.jsp'\",0);</script>");
                return null;
            }else {
                if (loginuser.getPost()=="员工"||loginuser.getPost().equals("员工")){

                    if ((request.getParameter("checkbox")!=null)) {  //记住我被选中
                        System.out.println("被选中！！！！！！！！！！！！！！！！！！！！！！！！！！！！");
                        //把cookie取出来  然后通过设置MaxAge来保持cookie
                        Cookie username = new Cookie("username", request.getParameter("username"));
                        Cookie password = new Cookie("password", request.getParameter("password"));
                        username.setMaxAge(60*60*24);
                        password.setMaxAge(60*60*24);
                        username.setPath("/");
                        password.setPath("/");
                        response.addCookie(username);
                        response.addCookie(password);
                        request.getSession().setAttribute("username", username);
                        request.getSession().setAttribute("password", password);
                        return "redirect:/ygloading.jsp";
                    }
                    else {
                        System.out.println("没有被选中！！！！！！！！！！！！！！！！！！！！！！！！！！！！");
                        //同样把cookie取出来  然后通过设置MacAge为0来清除cookie
                        Cookie username = new Cookie("username", request.getParameter("username"));
                        Cookie password = new Cookie("password", request.getParameter("password"));
                        username.setMaxAge(0);
                        password.setMaxAge(0);
                        username.setPath("/");
                        password.setPath("/");
                        response.addCookie(username);
                        response.addCookie(password);
                        request.getSession().setAttribute("username", username);
                        request.getSession().setAttribute("password", password);
                        return "redirect:/ygloading.jsp";
                    }

                }else if (loginuser.getPost()=="董事"||loginuser.getPost().equals("董事")){

                    if ((request.getParameter("checkbox")!=null)) {  //记住我被选中
                        System.out.println("被选中");
                        //把cookie取出来  然后通过设置MaxAge来保持cookie
                        Cookie username = new Cookie("username", request.getParameter("username"));
                        Cookie password = new Cookie("password", request.getParameter("password"));
                        username.setMaxAge(60*60*24);
                        password.setMaxAge(60*60*24);
                        username.setPath("/");
                        password.setPath("/");
                        response.addCookie(username);
                        response.addCookie(password);
                        request.getSession().setAttribute("username", username);
                        request.getSession().setAttribute("password", password);
                        return "redirect:/loading.jsp";
                    }
                    else {
                        System.out.println("没有被选中");
                        //同样把cookie取出来  然后通过设置MacAge为0来清除cookie
                        Cookie username = new Cookie("username", request.getParameter("username"));
                        Cookie password = new Cookie("password", request.getParameter("password"));
                        username.setMaxAge(0);
                        password.setMaxAge(0);
                        username.setPath("/");
                        password.setPath("/");
                        response.addCookie(username);
                        response.addCookie(password);
                        request.getSession().setAttribute("username", username);
                        request.getSession().setAttribute("password", password);
                        return "redirect:/loading.jsp";
                    }
                }else if (loginuser.getPost()=="经理"||loginuser.getPost().equals("经理")){
                    if ((request.getParameter("checkbox")!=null)) {  //记住我被选中
                        System.out.println("被选中");
                        //把cookie取出来  然后通过设置MaxAge来保持cookie
                        Cookie username = new Cookie("username", request.getParameter("username"));
                        Cookie password = new Cookie("password", request.getParameter("password"));
                        username.setMaxAge(60*60*24);
                        password.setMaxAge(60*60*24);
                        username.setPath("/");
                        password.setPath("/");
                        response.addCookie(username);
                        response.addCookie(password);
                        request.getSession().setAttribute("username", username);
                        request.getSession().setAttribute("password", password);
                        return "redirect:/jlloading.jsp";
                    }
                    else {
                        System.out.println("没有被选中");
                        //同样把cookie取出来  然后通过设置MacAge为0来清除cookie
                        Cookie username = new Cookie("username", request.getParameter("username"));
                        Cookie password = new Cookie("password", request.getParameter("password"));
                        username.setMaxAge(0);
                        password.setMaxAge(0);
                        username.setPath("/");
                        password.setPath("/");
                        response.addCookie(username);
                        response.addCookie(password);
                        request.getSession().setAttribute("username", username);
                        request.getSession().setAttribute("password", password);
                        return "redirect:/jlloading.jsp";
                    }

                }else{
                    System.out.println(loginuser.getPost());
                    return null;
                }


        }
    }


    /**
     * 用户注册
     */
    @RequestMapping(value="/register",method= RequestMethod.POST)
    public void Register(User user,HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        //获取用户输入的验证码
        String inputcode = request.getParameter("inputcode");
        //验证码校验
        HttpSession session = request.getSession();
        String checkcode_server = (String)session.getAttribute("CHECKCODE_SERVER");

        if(!checkcode_server.equalsIgnoreCase(inputcode)){
            //设置编码
            response.setContentType("text/html;charset=utf-8");
            //验证码不正确
            PrintWriter out=response.getWriter();
            out.print("<script language='javascript'>alert('验证码错误,请重新输入'); " +
                    "window.setTimeout(\"window.location='../register.jsp'\",0);</script>");
            return;
        }
        //验证码正确，注入user
        service.register(user);
        //跳转
        response.sendRedirect("../loading1.jsp");
    }


    /**
     * ajax检查用户名
     * @param username
     * @param response
     * @throws IOException
     */
    @RequestMapping("/ishava")
    public void isAlreadyHave(String username, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out=response.getWriter();
        User user = service.findByName(username);
        if(user!=null){
            out.println("该用户名不可用！");
        }else{
            out.println("恭喜，该用户名可用！");
        }

        out.flush();
        out.close();
    }


    @RequestMapping("/findAllUser")
    public String hello(Model model) {
        List<User> users = service.findAllUser();
        model.addAttribute("users",users);
        return "showuser";
    }

    @RequestMapping("/deleteUser")
    public String deleteUser(int id){
        service.deleteUser(id);
        return "redirect:/user/findAllUser";
    }

    @RequestMapping("/findByName")
    public String findEmployeeByEno(String name,Model model){
        User user = service.findByName(name);
        model.addAttribute("user",user);
        return "updateuser";
    }

    @RequestMapping("/updateUser")
    public String updateUser(User user){
        service.updateUser(user);
        return "redirect:/user/findAllUser";
    }

    @RequestMapping("/addUser")
    public String addUser(User user){
        service.addUser(user);
        return "redirect:/user/findAllUser";
    }




}
