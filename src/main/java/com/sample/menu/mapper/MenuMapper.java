package com.sample.menu.mapper;

import com.sample.menu.model.MenuModel;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface MenuMapper {
    List<MenuModel> selectMenuList(Map<String, Object> param);
}
