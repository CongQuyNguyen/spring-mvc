package com.laptrinhweb.service.impl;
import com.laptrinhweb.converter.NewsConverter;
import com.laptrinhweb.dto.NewsDTO;
import com.laptrinhweb.entity.NewsEntity;
import com.laptrinhweb.repository.NewRepository;
import com.laptrinhweb.service.INewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class NewsService implements INewsService {
    @Autowired
    private NewRepository newRepository;

    @Autowired
    private NewsConverter newsConverter;

    @Override
    public List<NewsDTO> findAll(Pageable pageable) {
        List<NewsEntity> entities = newRepository.findAll(pageable).getContent();
        List<NewsDTO> models = new ArrayList<>();
        for(NewsEntity item : entities) {
            NewsDTO news = newsConverter.toDTO(item);
            models.add(news);
        }
        return models;
    }

    @Override
    public Integer getTotalItem() {
        return (int) newRepository.count();
    }

    @Override
    public NewsDTO findById(long id) {
        NewsEntity newsEntity = newRepository.findOne(id);
        return newsConverter.toDTO(newsEntity);
    }
}
