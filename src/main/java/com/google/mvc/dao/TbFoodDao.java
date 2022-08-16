package com.google.mvc.dao;

import com.google.mvc.dto.TbFoodDto;

import java.util.List;

public interface TbFoodDao {
    public void save();
    public TbFoodDto findRandOne();
    public void update();

    public List<TbFoodDto> findAll();

}
