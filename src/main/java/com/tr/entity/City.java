package com.tr.entity;

public class City {
	
    /** 主键Id */
    private Integer id;

    /** 城市名称 */
    private String name;

    /** ip地址 */
    private Integer ip;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getIp() {
        return ip;
    }

    public void setIp(Integer ip) {
        this.ip = ip;
    }
    
}