package com.lotte.service;

import com.lotte.dto.ItemDTO;
import com.lotte.dto.PayDTO;
import com.lotte.mapper.UserMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.util.List;
@Service
@RequiredArgsConstructor
class PayServicelmp implements PayService {

    private final UserMapper UserMapper;

    @Override
    public void addPay(String member_id, int item_code, String pay_kakao) {
        UserMapper.addPay(member_id, item_code,pay_kakao);
    }

    @Override
    public List<PayDTO> showPay(String member_id) {
        return UserMapper.showPay(member_id);
    }
}

