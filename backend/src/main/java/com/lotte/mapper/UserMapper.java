package com.lotte.mapper;

import com.lotte.dto.BasketDTO;
import com.lotte.dto.ItemDTO;
import com.lotte.dto.UserDTO;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;
@Mapper
public interface UserMapper {

    // 유저리스트
    List<UserDTO> getUserList();

    // 책리스트
    List<ItemDTO> getItemList();

    // 전체 장바구니리스트
    List<BasketDTO> getAllBasketList();

    // 장바구니리스트 검색 ( id )
    List<BasketDTO> getBasketList(String member_id);

}
