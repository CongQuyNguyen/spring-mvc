package com.laptrinhweb.service.impl;
import com.laptrinhweb.converter.NewsConverter;
import com.laptrinhweb.dto.NewsDTO;
import com.laptrinhweb.entity.CategoryEntity;
import com.laptrinhweb.entity.NewsEntity;
import com.laptrinhweb.repository.CategoryRepository;
import com.laptrinhweb.repository.NewRepository;
import com.laptrinhweb.service.INewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class NewsService implements INewsService {
    @Autowired
    private NewRepository newRepository;

    @Autowired
    private NewsConverter newsConverter;

    @Autowired
    private CategoryRepository categoryRepository;

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

    @Override
    @Transactional
    public NewsDTO save(NewsDTO newsDTO) {
        NewsEntity newsEntity = null;
        CategoryEntity category = categoryRepository.findOneByCode(newsDTO.getCategoryCode());
        if(newsDTO.getId() != null) {
            // Cập nhật
            NewsEntity oldNews = newRepository.findOne(newsDTO.getId());
            oldNews.setCategory(category);
            newsEntity = newsConverter.toEntity(oldNews, newsDTO);
        } else {
            newsEntity = newsConverter.toEntity(newsDTO);
            newsEntity.setCategory(category);
        }
        return newsConverter.toDTO(newRepository.save(newsEntity));
    }
}