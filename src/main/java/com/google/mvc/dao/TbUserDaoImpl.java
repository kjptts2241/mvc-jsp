package com.google.mvc.dao;

import com.google.mvc.dto.TbFoodDto;
import com.google.mvc.dto.TbUserDto;

import javax.sound.midi.Soundbank;
import java.sql.*;

public class TbUserDaoImpl implements TbUserDao{

    @Override
    public void save() {

    }

    @Override
    public TbUserDto findEmailPw(String email, String userPw) {
        TbUserDto dto = null;

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Connection conn = DB.conn();
        try {
            String sql = "SELECT * FROM `tb_user` WHERE email = ? AND userpw = ?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, userPw);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                dto = new TbUserDto();
                dto.setId(rs.getInt("id"));
                dto.setEmail(rs.getString("email"));
                dto.setUserPw(rs.getString("userpw"));
                dto.setName(rs.getString("name"));
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
}
