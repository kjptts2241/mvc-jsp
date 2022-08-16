package com.google.mvc.dao;

import com.google.mvc.dto.TbFoodDto;
import com.google.mvc.dto.TbUserDto;

public interface TbUserDao {
    //회원가입
    public void save();
    // 로그인
    public TbUserDto findEmailPw(String email, String userPw);
}
