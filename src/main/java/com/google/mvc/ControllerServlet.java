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
            // out.println("<br>영화 정보 페이지");
            path = "/MovieServlet";
        } else if (URI.equals("/search.gg")) {
            // out.println("<br>검색 페이지");
            String search = request.getParameter("search");
            System.out.println(search);
            path = "/SearchServlet";
        } else if (URI.equals("/news.gg")) {
            // out.println("<br>뉴스 결과 JSON 페이지");
            path = "/SearchNewsServlet";
        } else if (URI.equals("/foodrandom.gg")) {
            // out.println("<br>음식을 랜덤으로 골라주는 페이지");
            path = "/FoodRandomServlet";
        } else if (URI.equals("/foodlist.gg")) {
            // out.println("<br>음식 리스트 페이지");
            path = "/FoodListServlet";
        } else if (URI.equals("/login.gg")) {
            // out.println("<br>로그인 페이지");
            path = "login.jsp";
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
