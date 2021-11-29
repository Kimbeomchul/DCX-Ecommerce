package com.lotte.controller;

import com.lotte.dto.ItemDTO;
import com.lotte.dto.PayDTO;
import com.lotte.dto.ZzimDTO;
import com.lotte.service.ItemService;
import com.lotte.service.PayService;
import com.lotte.service.ZzimService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequiredArgsConstructor
public class PayController {

    private final PayService payService;

    // 결제내역 저장
    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @RequestMapping(value = "/paysave", method = RequestMethod.POST)
    public void addPay(@RequestParam(value="nodap") String nodap, @RequestParam(value="member_id") String member_id , @RequestParam(value="pay_kakao") String pay_kakao) {
        System.out.println("DATAS : " + nodap);
        System.out.println("ID : " +member_id);
        System.out.println("TID : " +pay_kakao);

        try {
            String[] list1 = datas.split(",");
            for (int i = 0; i < list1.length; i++) {
                payService.addPay(member_id, Integer.parseInt(list1[i]), pay_kakao);
            }
        }catch (Exception e){
            System.out.println("Error with payment : < addPay > "+ e );
        }
    }


    // 결제내역 조회
    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @RequestMapping(value = "/paylist", method = RequestMethod.POST)
    public List<PayDTO> addPay(@RequestParam(value="member_id") String member_id) {

        return payService.showPay(member_id);
    }
}
