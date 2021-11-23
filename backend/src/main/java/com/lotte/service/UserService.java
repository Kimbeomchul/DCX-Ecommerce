package com.lotte.service;
import com.lotte.dto.UserDTO;
import com.lotte.login.Login;

import java.util.List;
public interface UserService {

    List<UserDTO> getUserList();

    void setUserInfo(int id, String Kakao, String nickname,  String login_time, String profile_image , String email);

}
