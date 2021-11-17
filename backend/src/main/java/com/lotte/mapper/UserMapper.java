package com.lotte.mapper;

import com.lotte.dto.BasketDTO;
import com.lotte.dto.ItemDTO;
import com.lotte.dto.UserDTO;
import com.lotte.dto.ZzimDTO;
import com.lotte.login.Login;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;
@Mapper
public interface UserMapper {

    //======================== 유저 ==============================//

    // 유저리스트
    List<UserDTO> getUserList();

    void setUserInfo(int id, String Kakao , String email, String nickname, String login_time, String profile_image);

    //======================== 아이템 ==============================//

    // 전체 책리스트
    List<ItemDTO> getAllItemList();
    // 제목으로 책 검색
    List<ItemDTO> getItemIdList(int item_code);
    // 책 삭제
    void deleteItem(int item_code);
    void addItem(String item_section, String item_title, String item_image, String item_content, String item_writer, String item_date, int item_price);

    //======================== 장바구니 ==============================//

    // 전체 장바구니리스트
    List<BasketDTO> getAllBasketList();
    // 장바구니리스트 검색 ( id )
    List<BasketDTO> getBasketList(String member_id);
    // 장바구니 특정 아이템 삭제 ( id )
    void deletebasket(int item_code , String member_id);
    // 장바구니 전체삭제
    void deleteAllbasket(String member_id);
    // 장바구니에 항목추가
    void addbasket(String member_id, int item_code, String basket_date);


    //======================== 찜 ==============================//

    //전체 찜 리스트
    List<ZzimDTO> getAllZzim(String member_id);
    void addZzim(String member_id, int item_code);
    void delZzim(String member_id, int item_code);


}
