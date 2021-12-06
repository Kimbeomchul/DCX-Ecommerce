package com.lotte.service;
import com.lotte.dto.UserDTO;
import com.lotte.login.Login;

import java.util.List;
public interface UserService {

    List<UserDTO> getUserList();

    void setUserInfo(int id, String Kakao, String nickname,  String login_time, String profile_image , String email);

    void addrecc(String recc, String member_id);

    void addphone(String member_phone, String member_address , String member_id);

    void addsave(int member_savemoney , String member_id);

    int count_user();

    List<UserDTO> searchUser(String member_id);
}
