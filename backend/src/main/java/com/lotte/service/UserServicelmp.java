package com.lotte.service;

import com.lotte.dto.UserDTO;
import com.lotte.mapper.UserMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.util.List;
@Service
@RequiredArgsConstructor
class UserServicelmp implements UserService {
    private final UserMapper UserMapper;

    @Override public List<UserDTO> getUserList() {
        return UserMapper.getUserList();
    }


}

