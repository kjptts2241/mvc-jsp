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
import java.util.List;


@WebServlet(name = "SearchNewsServlet", value = "/SearchNewsServlet")
public class SearchNewsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String search = request.getParameter("search");
        SearchDao dao = new SearchDaoImpl();
        String json = dao.newsApi(search);

        response.setContentType("application/json; charset=UTF-8"); // reponse json / UTF-8
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.println(json);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
