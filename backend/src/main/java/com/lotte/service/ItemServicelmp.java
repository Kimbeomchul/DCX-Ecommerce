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
    public List<ItemDTO> getItemIdList(String item_code) {
        return userMapper.getItemIdList(item_code);
    }


    // 아이템 삭제
    @Override
    public List<ItemDTO> deleteItem(String item_code) {
        return userMapper.deleteItem(item_code);
    }

}

