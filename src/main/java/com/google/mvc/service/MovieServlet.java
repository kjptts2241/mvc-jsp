package com.google.mvc.service;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.mvc.dao.MovieDao;
import com.google.mvc.dao.MovieDaoImpl;
import com.google.mvc.dao.TbFoodDao;
import com.google.mvc.dao.TbFoodDaoImpl;
import com.google.mvc.utils.MovieApi;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;


@WebServlet(name = "MovieServlet", value = "/MovieServlet")
public class MovieServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // MovieDao dao = new MovieDaoImpl();
        List<String> movieList = MovieApi.movieApi();
        for (String m: movieList) {
            System.out.println(m);
        }

        Gson gson = new GsonBuilder().disableHtmlEscaping().create();
        String json = gson.toJson(movieList);
        System.out.println(json);

        response.setContentType("application/json; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.println(json);
        RequestDispatcher dis = request.getRequestDispatcher("movie.jsp");
        request.setAttribute("Movie", json);
        dis.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
