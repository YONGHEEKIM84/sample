package com.sample.menu.service;

import com.sample.menu.model.MenuModel;
import com.sample.menu.mapper.MenuMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MenuService {

    @Autowired
    private MenuMapper mapper;

    public List<MenuModel> getMenuList() {
        Map<String, Object> param = new HashMap<>();
        param.put("user_id", "system");
        List<MenuModel> menuModel = this.mapper.selectMenuList(param);
        return menuModel;
    }
}
