package com.lotte.service;

import com.lotte.dto.UserDTO;
import com.lotte.login.Login;
import com.lotte.mapper.UserMapper;
import lombok.RequiredArgsConstructor;
import org.apache.catalina.User;
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

    @Override
    public void addrecc(String recc , String member_id) {
        UserMapper.addrecc(recc, member_id);
    }

    @Override
    public void addphone(String member_phone, String member_address, String member_id) {
        UserMapper.addphone(member_phone,member_address,member_id);
    }

    @Override
    public void addsave(int member_savemoney, String member_id) {
        UserMapper.addsave(member_savemoney,member_id);
    }

    @Override
    public int count_user() {
        return UserMapper.count_user();
    }

    @Override
    public List<UserDTO> searchUser(String member_id) {
        return UserMapper.searchUser(member_id);
    }


}

