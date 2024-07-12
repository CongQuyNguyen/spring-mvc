package com.laptrinhweb.util;

import com.laptrinhweb.dto.MyUser;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;

import java.util.ArrayList;
import java.util.List;

public class SecurityUtils {

    /* Hàm get tất cả thông tin của User (đã được lưu vào session sau khi hàm CustomUserDetailService thông qua */
    public static MyUser getPrincipal() {
        MyUser myUser = (MyUser) (SecurityContextHolder.getContext()).getAuthentication().getPrincipal();
        return myUser;
    }

    /* List lấy ra các roles hiện đang ở trong session sau khi authentication thông qua */
    @SuppressWarnings("unchecked")
    public static List<String> getAuthorities() {
        List<String> results = new ArrayList<>();
        List<GrantedAuthority> authorities = (List<GrantedAuthority>)(SecurityContextHolder.getContext().getAuthentication().getAuthorities());
        for (GrantedAuthority authority : authorities) {
            results.add(authority.getAuthority());
        }
        return results;
    }
}
