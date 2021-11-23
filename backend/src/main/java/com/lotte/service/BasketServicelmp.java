package com.lotte.service;

import com.lotte.dto.BasketDTO;
import com.lotte.mapper.UserMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.util.List;
@Service
@RequiredArgsConstructor
class BasketServicelmp implements BasketService {
    private final UserMapper UserMapper;


    @Override
    public List<BasketDTO> getBasketList(String member_id) {
        return UserMapper.getBasketList(member_id);
    }

    @Override
    public List<BasketDTO> getAllBasketList() {
        return UserMapper.getAllBasketList();
    }

    @Override
    public void deletebasket(int item_code, String member_id) {
        try{
            UserMapper.deletebasket(item_code, member_id);
        }catch(Exception e){
            System.out.println("Basket Delete Error : " + e);
        }
    }

    @Override
    public void deleteAllbasket(String member_id) {
        try{
            UserMapper.deleteAllbasket(member_id);
        }catch(Exception e){
            System.out.println("Basket Delete All Error : " + e);
        }
    }

    @Override
    public void addbasket(String member_id, int item_code) {

        try{
            UserMapper.addbasket(member_id, item_code);
        }catch(Exception e){
            System.out.println("Basket Insert Error : " + e);
        }
    }

}

