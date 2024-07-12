package com.laptrinhweb.dao;

import com.laptrinhweb.mapper.RowsMapper;

import java.util.List;

public interface GenericDAO<T> {
    // Hàm common để select data
    List<T> query(String sql, RowsMapper<T> rowMapper, Object... parameters);

    // Hàm common để chỉnh sửa data
    void update(String sql, Object... parameters);

    // Hàm common để thêm data
    Long insert(String sql, Object... parameters);

    // Hàm để đếm
    int count(String sql, Object... parameters);
}
