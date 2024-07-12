package com.laptrinhweb.dao.impl;

import com.laptrinhweb.dao.INewsDAO;
import com.laptrinhweb.mapper.NewsMapper;
import com.laptrinhweb.dto.NewsDTO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class NewsDAO extends AbstractDAO<NewsDTO> implements INewsDAO {
    @Override
    public List<NewsDTO> findAll() {
        // Vì không phải lúc nào cũng có offset và limit
        StringBuilder sql = new StringBuilder("select * from news");
        return query(sql.toString(), new NewsMapper());
    }
}
