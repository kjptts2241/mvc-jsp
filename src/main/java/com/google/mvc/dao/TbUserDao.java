package com.google.mvc.dao;

import com.google.mvc.dto.TbFoodDto;
import com.google.mvc.dto.TbUserDto;

public interface TbUserDao {
    public TbUserDto findEmailPw(TbUserDto dto);
}
