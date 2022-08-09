package com.google.mvc.service;

import com.google.mvc.dao.TbFoodDao;
import com.google.mvc.dao.TbFoodDaoImpl;
import com.google.mvc.dto.TbFoodDto;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "FoodRandomServlet", value = "/FoodRandomServlet")
public class FoodRandomServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        TbFoodDao dao = new TbFoodDaoImpl();
        TbFoodDto dto = dao.findRandOne();
        RequestDispatcher dis = request.getRequestDispatcher("foodrandom.jsp");
        request.setAttribute("food", dto);
        dis.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
