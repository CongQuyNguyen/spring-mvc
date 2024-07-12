package com.laptrinhweb.mapper;

import com.laptrinhweb.dto.NewsDTO;

import java.sql.ResultSet;
import java.sql.SQLException;

public class NewsMapper implements RowsMapper<NewsDTO> {
    @Override
    public NewsDTO mapRow(ResultSet resultSet) {
        try {
            NewsDTO news = new NewsDTO();
            news.setId(resultSet.getLong("id"));
            news.setTitle(resultSet.getString("title"));
            news.setContent(resultSet.getString("content"));
            news.setCategoryId(resultSet.getLong("category_id"));
            news.setThumbnail(resultSet.getString("thumbnail"));
            news.setShortDescription(resultSet.getString("short_description"));
            news.setCreatedBy(resultSet.getString("created_by"));
            news.setCreatedDate(resultSet.getTimestamp("created_date"));
            if(resultSet.getString("modified_by") != null) {
                news.setModifiedBy(resultSet.getString("modified_by"));
            }
            if(resultSet.getTimestamp("modified_date") != null) {
                news.setModifiedDate(resultSet.getTimestamp("modified_date"));
            }

            return news;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }
    }
}
