package com.google.mvc.dao;

import com.google.mvc.dto.TbFoodDto;

import java.util.List;

public interface TbFoodDao {
    public int save(TbFoodDto dto);
    public TbFoodDto findRandOne();
    public void update();

    public List<TbFoodDto> findAll();

}
