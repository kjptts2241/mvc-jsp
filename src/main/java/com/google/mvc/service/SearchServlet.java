package com.google.mvc.service;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.mvc.dao.SearchDao;
import com.google.mvc.dao.SearchDaoImpl;
import com.google.mvc.dto.TbSearchDto;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;


@WebServlet(name = "SearchServlet", value = "/SearchServlet")
public class SearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String search = request.getParameter("search");
        // System.out.println(search);

        SearchDao dao = new SearchDaoImpl();
        List<TbSearchDto> searchList = dao.search(search); // 검색 목록

        RequestDispatcher dis = request.getRequestDispatcher("search.jsp");
        request.setAttribute("search", search);
        request.setAttribute("searchList", searchList);
        dis.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
