package com.lotte.service;
import com.lotte.dto.ItemDTO;
import com.lotte.dto.UserDTO;

import java.util.List;
public interface ItemService {

    List<ItemDTO> getAllItemList();

    List<ItemDTO> getItemIdList(String item_code);

    List<ItemDTO> deleteItem(String item_code);

}
