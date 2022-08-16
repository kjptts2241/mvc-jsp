package com.google.mvc.service;

import com.google.mvc.dao.TbFoodDao;
import com.google.mvc.dao.TbFoodDaoImpl;
import com.google.mvc.dao.TbUserDao;
import com.google.mvc.dao.TbUserDaoImpl;
import com.google.mvc.dto.TbFoodDto;
import com.google.mvc.dto.TbUserDto;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginOkServlet", value = "/LoginOkServlet")
public class LoginOkServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String email = request.getParameter("email");
        String userPw = request.getParameter("userpw");

        TbUserDao dao = new TbUserDaoImpl();
        TbUserDto dto = dao.findEmailPw(email, userPw);

        if (dto != null) {
            System.out.println("성공");
            HttpSession session = request.getSession();
            session.setAttribute("username", dto.getName());
            response.sendRedirect("main.gg");
        } else {
            System.out.println("실패");
            response.sendRedirect("login.gg");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}