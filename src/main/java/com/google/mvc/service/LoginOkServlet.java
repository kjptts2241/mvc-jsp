package com.google.mvc.service;

import com.google.mvc.dao.TbFoodDao;
import com.google.mvc.dao.TbFoodDaoImpl;
import com.google.mvc.dao.TbUserDao;
import com.google.mvc.dao.TbUserDaoImpl;
import com.google.mvc.dto.TbFoodDto;
import com.google.mvc.dto.TbUserDto;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginOkServlet", value = "/LoginOkServlet")
public class LoginOkServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        TbUserDto dto = new TbUserDto();
        dto.setEmail(request.getParameter("email"));
        dto.setUserpw(request.getParameter("userpw"));

        TbUserDao dao = new TbUserDaoImpl();
        dao.findEmailPw(dto);

        //PrintWriter out = response.getWriter();
        //out.println(result); // 0이면 실패, 1이면 성공
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}