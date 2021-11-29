package com.lotte.controller;

import com.lotte.dto.ItemDTO;
import com.lotte.service.ItemService;
import jdk.nashorn.internal.parser.JSONParser;
import lombok.RequiredArgsConstructor;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
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

    // code 로 검색
    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @RequestMapping(value = "/getItemCode", method = RequestMethod.GET)
    public String getItemCode(@RequestParam(value="data") String data) {
        String[] list1 = data.split(",");

        JSONArray ary1 = new JSONArray();

        for (int i = 0; i < list1.length; i++) {
            HashMap<String,String> temp1 = itemService.getItemCode(Integer.parseInt(list1[i]));
            JSONObject obj1 = new JSONObject(temp1);
            ary1.put(obj1);
        }
        return ary1.toString();
    }



    // 특정 아이템 제목으로 검색
    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @RequestMapping(value = "/searchid", method = RequestMethod.GET)
    public List<ItemDTO> getItemWithId(@RequestParam(value="item_title") String item_title) {
        return itemService.getItemIdList(item_title);
    }

    // 추천하기위한 아이템 10개 픽
    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @RequestMapping(value = "/selectitem", method = RequestMethod.GET)
    public List<ItemDTO> selectItem() {
        return itemService.selectItem();
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
