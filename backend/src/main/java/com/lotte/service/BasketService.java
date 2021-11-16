package com.lotte.service;
import com.lotte.dto.BasketDTO;

import java.util.List;
public interface BasketService {

    // 장바구니 전체
    List<BasketDTO> getAllBasketList();

    // 이용자별 장바구니 검색
    List<BasketDTO> getBasketList(String member_id);

}
