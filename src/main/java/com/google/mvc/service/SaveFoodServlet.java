package com.google.mvc.service;

import com.google.mvc.dao.TbFoodDao;
import com.google.mvc.dao.TbFoodDaoImpl;
import com.google.mvc.dto.TbFoodDto;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "SaveFoodServlet", value = "/SaveFoodServlet")
public class SaveFoodServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String menuname = request.getParameter("menuname");
        String imgsrc = request.getParameter("imgsrc");
        TbFoodDto dto = new TbFoodDto();
        dto.setName(menuname);
        dto.setImg(imgsrc);

        TbFoodDao dao = new TbFoodDaoImpl();
        int result = dao.save(dto);
        // ajax에 result 정보 전달

        PrintWriter out = response.getWriter();
        out.println(result); // 0이면 실패, 1이면 성공
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}