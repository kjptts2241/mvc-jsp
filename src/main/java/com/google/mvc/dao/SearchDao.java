package com.google.mvc.dao;

import com.google.mvc.dto.TbSearchDto;

import java.util.List;

public interface SearchDao {

    public List<TbSearchDto> search(String search);
}
