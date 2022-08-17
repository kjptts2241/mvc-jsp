package com.google.mvc;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "ControllerServlet", value = "*.gg")
public class ControllerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Hello world");
        String URI = request.getRequestURI();
        String URL = request.getRequestURL().toString();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("getRequestURI : " + URI);
        out.println("<br>");
        out.println("getRequestURL : " + URL);

        // 만약에 main.gg 가 들어오면 메인 페이지 화면을 보이게
        // movie.gg 가 들어오면 영화 정보 화면이 보이게
        // search.gg 가 들어오면 검색 화면이 보이게
        // foodrandom.gg 가 들어오면 음식을 랜덤으로 골라주는 화면이 보이게
        // login.gg 가 들어오면 로그인 화면이 보이게
        // 회원가입 등등...

        String path = null;

        if (URI.equals("/main.gg")) {
            // out.println("<br>메인 페이지");
            path = "main.jsp";
        } else if (URI.equals("/movie.gg")) {
            path = "/movie.jsp";
        } else if (URI.equals("/movieList.gg")) {
            path = "/MovieServlet";
        } else if (URI.equals("/search.gg")) {
            path = "search.jsp";
        } else if (URI.equals("/searchList.gg")) {
            path = "/SearchServlet";
        } else if (URI.equals("/news.gg")) {
            path = "/SearchNewsServlet";
        } else if (URI.equals("/foodrandom.gg")) {
            path = "/FoodRandomServlet";
        } else if (URI.equals("/foodlist.gg")) {
            path = "/FoodListServlet";
        } else if (URI.equals("/savefood.gg")) {
            path = "/SaveFoodServlet";
        } else if (URI.equals("/login.gg")) {
            path = "login.jsp";
        } else if (URI.equals("/loginok.gg")) {
            path = "/LoginOkServlet";
        } else if (URI.equals("/logout.gg")) {
            path = "/logout.jsp";
        } else {
            out.println("<br>오류 페이지");
            path = "404.jsp";
        }
        RequestDispatcher dis = request.getRequestDispatcher(path);
        dis.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
