package com.lotte.service;
import com.lotte.dto.ItemDTO;
import com.lotte.dto.PayDTO;

import java.util.List;
public interface PayService {


    void addPay(String member_id, int item_code, String pay_kakao);
    List showPay(String member_id);
    List<PayDTO> showAllPay();

}
