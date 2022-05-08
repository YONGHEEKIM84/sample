package com.sample.menu.model;

import lombok.Data;

@Data
public class MenuModel {
    private String menu_no;
    private String super_menu_no;
    private String menu_order;
    private String page_no;
    private String visible;
    private String page_url;
    private String menu_name;
    private String icon;
    private String permission;
    private String writable;
    private String depth_level;
}
