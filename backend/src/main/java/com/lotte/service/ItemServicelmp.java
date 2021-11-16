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


    @Override
    public List<ItemDTO> getItemList() {
        return userMapper.getItemList();
    }

}

