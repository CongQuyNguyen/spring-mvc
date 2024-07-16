package com.laptrinhweb.converter;

import com.laptrinhweb.dto.NewsDTO;
import com.laptrinhweb.entity.NewsEntity;
import org.springframework.stereotype.Component;

@Component
public class NewsConverter {

    public NewsDTO toDTO(NewsEntity entity) {
        NewsDTO result = new NewsDTO();
        result.setId(entity.getId());
        result.setTitle(entity.getTitle());
        result.setShortDescription(entity.getShortDescription());
        result.setContent(entity.getContent());
        result.setThumbnail(entity.getThumbnail());
        // Do framework build sẵn hàm này khi có liên kết OneToMany
        // Có thể set ở đây được do bản thân Entity khi lấy lên đã có sẵn Category rồi
        result.setCategoryCode(entity.getCategory().getCode());
        return result;
    }

    public NewsEntity toEntity(NewsDTO dto) {
        NewsEntity result = new NewsEntity();
        result.setTitle(dto.getTitle());
        result.setShortDescription(dto.getShortDescription());
        result.setContent(dto.getContent());
        result.setThumbnail(dto.getThumbnail());
        // Còn thằng này phải xử lý cái Category ở Service
        return result;
    }

    public NewsEntity toEntity(NewsEntity result, NewsDTO dto) {
        result.setTitle(dto.getTitle());
        result.setShortDescription(dto.getShortDescription());
        result.setContent(dto.getContent());
        result.setThumbnail(dto.getThumbnail());
        return result;
    }

}
