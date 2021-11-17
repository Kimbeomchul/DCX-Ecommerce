package com.lotte.controller;
import com.lotte.dto.UserDTO;
import com.lotte.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;

    // 모든 User정보 불러오기
    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public List<UserDTO> getUser() {
        return userService.getUserList();
    }



}
