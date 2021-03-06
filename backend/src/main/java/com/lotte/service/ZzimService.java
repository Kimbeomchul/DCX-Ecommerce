package com.lotte.service;
import com.lotte.dto.UserDTO;
import com.lotte.dto.ZzimDTO;
import com.lotte.login.Login;

import java.util.List;
public interface ZzimService {

    List<ZzimDTO> getAllZzim(String member_id);

    void addZzim(String member_id, int item_code);

    void delZzim(String member_id, int item_code);

    int zzimCount(int item_code);


}
