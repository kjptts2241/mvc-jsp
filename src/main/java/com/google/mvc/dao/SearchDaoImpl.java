package com.google.mvc.dao;

import com.google.mvc.dto.TbSearchDto;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class SearchDaoImpl implements SearchDao{

    public List<TbSearchDto> search(String search) {
        System.out.println(search);
        List<TbSearchDto> list = new ArrayList<>();

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Connection conn = DB.conn();

        try {
            // 데이터 넣기
            String sql = "INSERT INTO `tb_search` (`search`) VALUES (?) ON DUPLICATE KEY UPDATE cnt = cnt + 1";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, search);
            pstmt.executeUpdate();
            // 데이터 불러오기
            sql = "select * from `tb_search`";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                TbSearchDto dto = new TbSearchDto();
                dto.setSearch(rs.getString("search"));
                dto.setCnt(rs.getInt("cnt"));
                list.add(dto);
            }
        } catch (SQLException e) {
            System.out.println("error: " + e);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null && !conn.isClosed()) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }
}
