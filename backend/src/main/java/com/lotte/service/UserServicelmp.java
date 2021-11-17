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

    @Override public void setUserInfo(int id, String Kakao, String email, String login_time, String nickname, String profile_image) {
         UserMapper.setUserInfo(id, Kakao , email,login_time,nickname, profile_image);
    }



}

