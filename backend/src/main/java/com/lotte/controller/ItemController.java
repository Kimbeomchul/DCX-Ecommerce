package com.lotte.controller;

import com.lotte.dto.ItemDTO;
import com.lotte.service.ItemService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class ItemController {

    private final ItemService itemService;

    // 모든 item정보 불러오기
    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @RequestMapping(value = "/allitem", method = RequestMethod.GET)
    public List<ItemDTO> getAllItem() {
        return itemService.getAllItemList();
    }

    // 특정 아이템 제목으로 검색
    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @RequestMapping(value = "/searchid", method = RequestMethod.GET)
    public List<ItemDTO> getItemWithId(@RequestParam(value="item_code") int item_code) {
        return itemService.getItemIdList(item_code);
    }

    // 관리자용
    // 특정 아이템 삭제
    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @RequestMapping(value = "/ditem", method = RequestMethod.DELETE)
    public void deleteItem(@RequestParam(value="item_code") int item_code) {
        itemService.deleteItem(item_code);
    }

    // 특정 아이템 등록
    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @RequestMapping(value = "/aitem", method = RequestMethod.POST)
    public void addItem(
            @RequestParam(value="item_section") String item_section,
            @RequestParam(value="item_title") String item_title,
            @RequestParam(value="item_image") String item_image,
            @RequestParam(value="item_content") String item_content,
            @RequestParam(value="item_writer") String item_writer,
            @RequestParam(value="item_date") String item_date,
            @RequestParam(value="item_price") int item_price) {

        itemService.addItem(item_section,item_title,item_image,item_content,item_writer,item_date,item_price);
    }


}
