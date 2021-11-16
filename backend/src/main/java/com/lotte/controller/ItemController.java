package com.lotte.controller;

import com.lotte.dto.ItemDTO;
import com.lotte.service.ItemService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class ItemController {

    private final ItemService itemService;

    // 모든 item정보 불러오기
    @RequestMapping(value = "/allitem", method = RequestMethod.GET)
    public List<ItemDTO> getAllItem() {
        return itemService.getAllItemList();
    }

    // 특정 아이템 제목으로 검색
    @RequestMapping(value = "/searchid", method = RequestMethod.GET)
    public List<ItemDTO> getItemWithId(@RequestParam(value="item_code") String item_code) {
        return itemService.getItemIdList(item_code);
    }

    // 관리자용
    // 특정 아이템 삭제
    @RequestMapping(value = "/ditem", method = RequestMethod.DELETE)
    public List<ItemDTO> deleteItem(@RequestParam(value="item_code") String item_code) {
        return itemService.deleteItem(item_code);
    }

//    // 특정 아이템 등록
//    @RequestMapping(value = "/aitem", method = RequestMethod.POST)
//    public List<ItemDTO> addItem(@RequestParam(value="item_code") String item_code) {
//        return itemService.addItem(item_code);
//    }

}
