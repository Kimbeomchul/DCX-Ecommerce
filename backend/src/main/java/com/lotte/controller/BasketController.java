package com.lotte.controller;

import com.lotte.dto.BasketDTO;
import com.lotte.service.BasketService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/basket")
public class BasketController {

    private final BasketService basketService;

    // 모든 장바구니정보 불러오기
    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @RequestMapping(value = "/all", method = RequestMethod.GET)
    public List<BasketDTO> getAllBasketList() {
        return basketService.getAllBasketList();
    }

    // 장바구니 검색 ( key = member_id )
    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public List<BasketDTO> getBasketList(@RequestParam(value="member_id") String member_id) {
        return basketService.getBasketList(member_id);
    }

    // 장바구니 특정 아이템 삭제
    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @RequestMapping(value = "/item", method = RequestMethod.DELETE)
    public void deletebasket(@RequestParam(value="item_code") int item_code, @RequestParam(value="member_id") String member_id) {
        basketService.deletebasket(item_code,member_id);
    }

    // 장바구니 전체 삭제
    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @RequestMapping(value = "/all", method = RequestMethod.DELETE)
    public void deleteAllbasket(@RequestParam(value="member_id") String member_id) {
        basketService.deleteAllbasket(member_id);
    }

    // 장바구니 아이템 추가 ?!?!?
    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @RequestMapping(value = "/item", method = RequestMethod.POST)
    public void addbasket(@RequestParam(value="member_id") String member_id, @RequestParam(value="item_code") int item_code) {
        basketService.addbasket(member_id, item_code);
    }

}
