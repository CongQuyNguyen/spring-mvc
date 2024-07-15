package com.laptrinhweb.controller.admin;

import com.laptrinhweb.dto.NewsDTO;
import com.laptrinhweb.service.ICategoryService;
import com.laptrinhweb.service.INewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "newsControllerOfAdmin")
public class NewsController {

	@Autowired
	private INewsService newsService;

	@Autowired
	private ICategoryService categoryService;
	
	@RequestMapping(value = "/admin/news/list", method = RequestMethod.GET)
	public ModelAndView showNewsList(@RequestParam("page") int page, @RequestParam("limit") int limit) {
		NewsDTO model = new NewsDTO();

		model.setPage(page);
		model.setLimit(limit);
		Pageable pageable = new PageRequest(page - 1, limit);

		// Tiến hành lấy danh sách dữ liệu vào để giao diện có thể sử dụng
		model.setListResult(newsService.findAll(pageable));
		model.setTotalItem(newsService.getTotalItem());
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));

		ModelAndView mav = new ModelAndView("admin/news/list");
		mav.addObject("model", model);
		return mav;
	}
	@RequestMapping(value = "/admin/news/edit", method = RequestMethod.GET)
	public ModelAndView editNews(@RequestParam(value = "id", required = false) Long id) {
		ModelAndView mav = new ModelAndView("admin/news/edit");
		NewsDTO model = new NewsDTO();
		// Là cập nhật
		if(id != null) {
			model = newsService.findById(id);
		}
		// Lấy danh sách category lên
		mav.addObject("categories", categoryService.findAll());
		mav.addObject("model", model);
		return mav;
	}
}
