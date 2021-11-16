package com.lotte.controller;

import com.lotte.dto.ItemDTO;
import com.lotte.service.ItemService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class ItemController {

    private final ItemService itemService;

    // 모든 item정보 불러오기
    @RequestMapping(value = "/item", method = RequestMethod.GET)
    public List<ItemDTO> getItem() {
        return itemService.getItemList();
    }


}
