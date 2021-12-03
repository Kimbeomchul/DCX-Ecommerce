package com.lotte.mapper;

import com.lotte.dto.*;
import com.lotte.login.Login;
import org.apache.ibatis.annotations.Mapper;
import org.json.JSONArray;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.List;
@Mapper
public interface UserMapper {

    //======================== 유저 ==============================//
    int count_user();

    // 유저리스트
    List<UserDTO> getUserList();

    // 유저 등록 < 소셜로그인 >
    void setUserInfo(int id, String Kakao , String nickname, String login_time, String profile_image  , String email);

    void addrecc(String recc, String member_id);

    void addphone(String member_phone , String member_address, String member_id);

    void addsave(int member_savemoney, String member_id);
    //======================== 아이템 ==============================//

    // 아이템 카운트
    int item_count();
    // 장르조회
    List<SectionDTO> getSections();
    // 코드로검색
    List<ItemDTO> getItemCode(Integer[] arr);
    // 전체 책리스트
    List<ItemDTO> getAllItemList();
    // 제목으로 책 검색
    List<ItemDTO> getItemIdList(String item_title);
    // 추천하기위해 아이템 선택
    List<ItemDTO> selectItem();
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
    void addbasket(String member_id, int item_code);


    //======================== 찜 ==============================//

    //전체 찜 리스트
    List<ZzimDTO> getAllZzim(String member_id);

    //찜 추가
    List<ZzimDTO> addZzim(String member_id, int item_code);

    //찜 삭제
    void delZzim(String member_id, int item_code);

    //======================== 구매 ==============================//

    void addPay(String member_id, int item_code, String pay_kakao);
    List<PayDTO> showPay(String member_id);
    List<PayDTO> showAllPay();

    //======================== 추천 ==============================//

    String getReccItem(String member_id);

    List<ItemDTO> getItemWithRecc(String recc_code);

}
