package com.laptrinhweb.repository;

import com.laptrinhweb.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;


public interface UserRepository extends JpaRepository<UserEntity, Long> {
    // Hàm hỗ trợ tìm kiếm một tài khoản đăng nhập bằng username và status
    UserEntity findOneByUserNameAndStatus(String name, int status);
}
