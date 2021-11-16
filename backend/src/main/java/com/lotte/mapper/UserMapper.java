package com.lotte.mapper;

import com.lotte.dto.BasketDTO;
import com.lotte.dto.ItemDTO;
import com.lotte.dto.UserDTO;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;
@Mapper
public interface UserMapper {

    //======================== 유저 ==============================//

    // 유저리스트
    List<UserDTO> getUserList();

    //======================== 아이템 ==============================//

    // 전체 책리스트
    List<ItemDTO> getAllItemList();
    // 제목으로 책 검색
    List<ItemDTO> getItemIdList(String item_code);
    // 책 삭제
    List<ItemDTO> deleteItem(String item_code);

    //======================== 장바구니 ==============================//

    // 전체 장바구니리스트
    List<BasketDTO> getAllBasketList();
    // 장바구니리스트 검색 ( id )
    List<BasketDTO> getBasketList(String member_id);
    // 장바구니 특정 아이템 삭제 ( id )
    List<BasketDTO> deletebasket(String item_code , String member_id);
    // 장바구니 전체삭제
    List<BasketDTO> deleteAllbasket(String member_id);

}
