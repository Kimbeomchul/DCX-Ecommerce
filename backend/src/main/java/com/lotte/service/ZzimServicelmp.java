package com.lotte.service;

import com.lotte.dto.UserDTO;
import com.lotte.dto.ZzimDTO;
import com.lotte.login.Login;
import com.lotte.mapper.UserMapper;
import lombok.RequiredArgsConstructor;
import org.apache.catalina.User;
import org.springframework.stereotype.Service;
import java.util.List;
@Service
@RequiredArgsConstructor
class ZzimServicelmp implements ZzimService{
    private final UserMapper UserMapper;


    @Override
    public List<ZzimDTO> getAllZzim(String member_id) {
        return UserMapper.getAllZzim(member_id);
    }

    @Override
    public void addZzim(String member_id, int item_code) {
        try{
            UserMapper.addZzim(member_id,item_code);
        }catch (Exception e){
            System.out.println("zzim add fail : ( member_id , item_code ) "+ member_id + " " + item_code );
        }

    }

    @Override
    public void delZzim(String member_id, int item_code) {
        try{
            UserMapper.delZzim(member_id, item_code);
        }catch (Exception e){
            System.out.println("zzim delete fail : ( member_id , item_code ) "+ member_id + " " + item_code );
        }
    }

    @Override
    public int zzimCount(int item_code) {
        return UserMapper.zzimCount(item_code);
    }



}

