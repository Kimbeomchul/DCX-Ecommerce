package com.lotte.controller;

import com.lotte.dto.ItemDTO;
import com.lotte.dto.PayDTO;
import com.lotte.dto.ZzimDTO;
import com.lotte.service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequiredArgsConstructor
public class PayController {

    private final PayService payService;
    private final BasketService basketService;

    // 결제내역 저장
    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @RequestMapping(value = "/paysave", method = RequestMethod.POST)
    public void addPay(@RequestParam(value="datas") String datas, @RequestParam(value="savemoney") int savemoney, @RequestParam(value="member_id") String member_id , @RequestParam(value="pay_kakao") String pay_kakao) {


        try {
            String[] list1 = datas.split(",");
            for (int i = 0; i < list1.length; i++) {
                payService.addPay(member_id, Integer.parseInt(list1[i]), pay_kakao);
                basketService.deletebasket(Integer.parseInt(list1[i]),member_id);
            }
        }catch (Exception e){
            System.out.println("Error with payment : < addPay > "+ e );
        }
    }


    // 결제내역 조회
    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @RequestMapping(value = "/paylist", method = RequestMethod.GET)
    public List<PayDTO> payList(@RequestParam(value="member_id") String member_id) {

        return payService.showPay(member_id);
    }

    // 결제내역 전체조회
    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @RequestMapping(value = "/allpaylist", method = RequestMethod.GET)
    public List<PayDTO> payAllList() {
        return payService.showAllPay();
    }
}
