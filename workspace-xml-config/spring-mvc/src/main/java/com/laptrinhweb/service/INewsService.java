package com.laptrinhweb.service;

import com.laptrinhweb.dto.NewsDTO;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface INewsService {
    // Lấy toàn bộ các news
    List<NewsDTO> findAll(Pageable pageable);
    Integer getTotalItem();
    NewsDTO findById(long id);
    NewsDTO save(NewsDTO newsDTO);
}
