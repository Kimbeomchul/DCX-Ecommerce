package com.lotte.controller;

import com.lotte.dto.BasketDTO;
import com.lotte.dto.ItemDTO;
import com.lotte.service.BasketService;
import com.lotte.service.ItemService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class BasketController {

    private final BasketService basketService;

    // 모든 장바구니정보 불러오기
    @RequestMapping(value = "/allbasket", method = RequestMethod.GET)
    public List<BasketDTO> getBasketList() {
        return basketService.getAllBasketList();
    }

    // 장바구니 검색 ( key = member_id )
    @RequestMapping(value = "/basket", method = RequestMethod.GET)
    public List<BasketDTO> getBasketList(@RequestParam(value="member_id") String member_id) {
        return basketService.getBasketList(member_id);
    }


}
