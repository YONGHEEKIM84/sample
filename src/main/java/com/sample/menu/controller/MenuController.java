package com.sample.menu.controller;

import com.sample.menu.model.MenuModel;
import com.sample.menu.service.MenuService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Component
@Controller
@RestController
@RequestMapping(value = "/sample/menu")
public class MenuController {

    @Autowired
    private MenuService service;

    private static Logger log = LoggerFactory.getLogger(MenuController.class);

    @GetMapping(value = "/list")
    public List<MenuModel> getMenuList() {
        return service.getMenuList();
    }
}
