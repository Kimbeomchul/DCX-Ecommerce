package com.lotte.controller;

import com.lotte.dto.ItemDTO;
import com.lotte.dto.SectionDTO;
import com.lotte.service.ItemService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/item")
public class ItemController {

    private final ItemService itemService;

    // 모든 item정보 불러오기
    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @RequestMapping(value = "/all", method = RequestMethod.GET)
    public List<ItemDTO> getAllItem() {
        return itemService.getAllItemList();
    }

    // code 로 검색
    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @RequestMapping(value = "/code", method = RequestMethod.GET)
    public List<ItemDTO> getItemCode(@RequestParam(value="data") String data) {

        String[] temp = data.split(",");
        Integer[] arr = new Integer[temp.length];

        for(int i =0; i<temp.length; i++){
            arr[i] = Integer.parseInt(temp[i]);
        }
        return itemService.getItemCode(arr);
    }


    // 책 건수 조회
    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @RequestMapping(value = "/count", method = RequestMethod.GET)
    public int count_item() {
        return itemService.item_count();
    }

    // 장르조회
    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @RequestMapping(value = "/genre", method = RequestMethod.GET)
    public List<SectionDTO> sections() {
        return itemService.getSections();
    }

    // 특정 아이템 제목으로 검색
    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @RequestMapping(value = "/title", method = RequestMethod.GET)
    public List<ItemDTO> getItemWithId(@RequestParam(value="item_title") String item_title) {
        return itemService.getItemIdList(item_title);
    }

    // 추천하기위한 아이템 10개 픽
    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @RequestMapping(value = "/recc", method = RequestMethod.GET)
    public List<ItemDTO> selectItem() {
        return itemService.selectItem();
    }

    // 관리자용
    // 특정 아이템 삭제
    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @RequestMapping(value = "/code", method = RequestMethod.DELETE)
    public void deleteItem(@RequestParam(value="item_code") int item_code) {
        itemService.deleteItem(item_code);
    }

    // 특정 아이템 등록
    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @RequestMapping(value = "/code", method = RequestMethod.POST)
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
