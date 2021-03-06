package com.lotte.service;
import com.lotte.dto.ItemDTO;
import com.lotte.dto.SectionDTO;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.List;
public interface ItemService {

    List<ItemDTO> getAllItemList();

    List<ItemDTO> getItemIdList(String item_title);

    List<ItemDTO> getItemWithRecc(String recc_code);

    List<ItemDTO> selectItem();

    void deleteItem(int item_code);

    void addItem(String item_section, String item_title, String item_image, String item_content, String item_writer, String item_date, int item_price);

    String getReccItem(String member_id);

    List<ItemDTO> getItemCode(Integer[] arr);

    List<SectionDTO> getSections();

    int item_count();
}
