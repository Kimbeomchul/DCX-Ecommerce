package com.lotte.service;

import com.lotte.dto.ItemDTO;
import com.lotte.mapper.UserMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.util.List;
@Service
@RequiredArgsConstructor
class ItemServicelmp implements ItemService {
    private final UserMapper userMapper;


    // 모든아이템 검색
    @Override
    public List<ItemDTO> getAllItemList() {
        return userMapper.getAllItemList();
    }

    // Item_id로 아이템 검색
    @Override
    public List<ItemDTO> getItemIdList(int item_code) {
        return userMapper.getItemIdList(item_code);
    }

    // 아이템 삭제
    @Override
    public void deleteItem(int item_code) {
        try{
            userMapper.deleteItem(item_code);
        }catch(Exception e){
            System.out.println("Delete Error : " + e );
        }

    }

    //아이템 등록
    @Override
    public void addItem(String item_section, String item_title, String item_image, String item_content, String item_writer, String item_date, int item_price) {

        try{
            userMapper.addItem(item_section,item_title,item_image,item_content,item_writer,item_date,item_price);
        }catch (Exception e){
            System.out.println("Insert Error : "+ e);
        }
    }
}
