package com.lotte.service;

import com.lotte.dto.UserDTO;
import com.lotte.login.Login;
import com.lotte.mapper.UserMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.util.List;
@Service
@RequiredArgsConstructor
class UserServicelmp implements UserService{
    private final UserMapper UserMapper;

    @Override public List<UserDTO> getUserList() {
        return UserMapper.getUserList();
    }

    @Override public void setUserInfo(int id, String Kakao, String nickname, String login_time, String profile_image, String email) {
         UserMapper.setUserInfo(id, Kakao , nickname, login_time, profile_image , email);
    }



}

