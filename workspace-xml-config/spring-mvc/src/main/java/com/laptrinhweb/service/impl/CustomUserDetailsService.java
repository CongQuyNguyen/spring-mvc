package com.laptrinhweb.service.impl;

import com.laptrinhweb.constant.SystemConstant;
import com.laptrinhweb.dto.MyUser;
import com.laptrinhweb.entity.RoleEntity;
import com.laptrinhweb.entity.UserEntity;
import com.laptrinhweb.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserEntity userEntity = userRepository.findOneByUserNameAndStatus(username, SystemConstant.ACTIVE_STATUS);

        /* Nếu không tìm thấy account thì sẽ thông báo lỗi và nhảy vào chỗ bị fail đã config trong file security.xml */
        if (userEntity == null) {
            throw new UsernameNotFoundException("User not found");
        }

        /* Lấy ra list roles trong UserEntity: Đây sẽ được truyền qua authorization xử lý phân quyền */
        List<GrantedAuthority> authorities = new ArrayList<>();
        for (RoleEntity role: userEntity.getRoles()) {
            authorities.add(new SimpleGrantedAuthority(role.getCode()));
        }

        /* Nếu tìm thấy sẽ put thông tin lên session (User đã được framework tạo sẵn) */
        /* Ở đây thì ta có thể tạo ra một class kế thừa từ User này để định nghĩa thêm các thuộc tính khác */
        MyUser myUser = new MyUser(userEntity.getUserName(), userEntity.getPassword(),
                true, true, true, true, authorities);

        /* Lấy fullname từ sesstion (là userEntity) */
        myUser.setFullName(userEntity.getFullName());
        return myUser;
    }
}
