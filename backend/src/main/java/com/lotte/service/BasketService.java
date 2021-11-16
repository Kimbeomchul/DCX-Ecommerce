package com.lotte.service;
import com.lotte.dto.BasketDTO;

import java.util.List;
public interface BasketService {

    // 장바구니 전체
    List<BasketDTO> getAllBasketList();

    // 이용자별 장바구니 검색
    List<BasketDTO> getBasketList(String member_id);

    // 장바구니에서 특정 아이템 삭제
    List<BasketDTO> deletebasket(String item_code, String member_id);

    // 장바구니에서 특정 아이템 삭제
    List<BasketDTO> deleteAllbasket(String member_id);


}
