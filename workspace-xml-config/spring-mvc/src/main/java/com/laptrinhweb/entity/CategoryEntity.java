package com.laptrinhweb.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "category")
public class CategoryEntity extends BaseEntity {
    @Column(name = "name")
    private String name;

    @Column(name = "code")
    private String code;

    @OneToMany(mappedBy = "category")
    private List<NewsEntity> listNews = new ArrayList<>();

    public List<NewsEntity> getListNews() {
        return listNews;
    }

    public void setListNews(List<NewsEntity> listNews) {
        this.listNews = listNews;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
