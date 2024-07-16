package com.laptrinhweb.api.admin;

import com.laptrinhweb.dto.NewsDTO;
import com.laptrinhweb.service.INewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController(value = "newsAPIOfAdmin")
public class NewsAPI {

    @Autowired
    private INewsService newsService;

    @PostMapping("/api/news")
    public NewsDTO createNews(@RequestBody NewsDTO newsDTO) {
        // Về cơ bản thì chúng ta sẽ nhận thông tin JSON của một newsDTO (chưa có id)
        // sau đó tiến hành thêm vào CSDL (đã được spring build sẵn) và trả ra một newsDTO
        // đã có id để chứng tỏ đã được thêm
        return newsService.save(newsDTO);
    }

    @PutMapping("/api/news")
    public NewsDTO updateNews(@RequestBody NewsDTO newsDTO) {
        return newsService.save(newsDTO);
    }

    @DeleteMapping("/api/news")
    public void deleteNews(@RequestBody long[] ids) {
        System.out.println(ids);
    }
}
