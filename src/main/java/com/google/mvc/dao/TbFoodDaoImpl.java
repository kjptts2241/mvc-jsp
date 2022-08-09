package com.google.mvc.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.google.mvc.dto.TbFoodDto;

public class TbFoodDaoImpl implements TbFoodDao {

    public Connection dbConn() {
        final String driver = "org.mariadb.jdbc.Driver";
        final String DB_IP = "localhost";
        final String DB_PORT = "3306";
        final String DB_NAME = "dbdb";
        final String DB_URL =
                "jdbc:mariadb://" + DB_IP + ":" + DB_PORT + "/" + DB_NAME;
        Connection conn = null;

        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(DB_URL, "root", "1234");
            if (conn != null) {
                System.out.println("DB 접속 성공");
            }

        } catch (ClassNotFoundException e) {
            System.out.println("드라이버 로드 실패");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("DB 접속 실패");
            e.printStackTrace();
        }
        return conn;
    }

    @Override
    public void save() {

    }

    @Override
    public TbFoodDto findRandOne() {
        dbConn();
        TbFoodDto dto = new TbFoodDto();

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Connection conn = dbConn();
        try {
            String sql = "SELECT  * FROM tb_food ORDER BY RAND() LIMIT 1;";

            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                dto.setId(rs.getInt("id"));
                dto.setName(rs.getString("name"));
                dto.setImg(rs.getString("img"));
            } else {
                System.out.println("정보가 없습니다.");
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
        return dto;

    }

    @Override
    public void update() {

    }
}
