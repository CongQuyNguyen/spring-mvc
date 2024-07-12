package com.laptrinhweb.mapper;

import java.sql.ResultSet;

public interface RowsMapper<T> {
    T mapRow(ResultSet resultSet);

    public interface RowMapper<T> {
        T mapRow(ResultSet resultset);
    }
}
