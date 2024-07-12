package com.laptrinhweb.dao;

import com.laptrinhweb.dto.NewsDTO;

import java.util.List;

public interface INewsDAO extends GenericDAO<NewsDTO> {
    // Tìm kiếm tất cả bài viết
    List<NewsDTO> findAll();
}
