package com.lotte.service;
import com.lotte.dto.ItemDTO;

import java.util.List;
public interface ItemService {

    List<ItemDTO> getAllItemList();

    List<ItemDTO> getItemIdList(String item_code);

    void deleteItem(String item_code);

    void addItem(String item_section, String item_title, String item_image, String item_content, String item_writer, String item_date, int item_price);
}
