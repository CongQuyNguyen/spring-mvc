package com.laptrinhweb.repository;

import com.laptrinhweb.entity.NewsEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NewRepository extends JpaRepository<NewsEntity, Long> {

}
