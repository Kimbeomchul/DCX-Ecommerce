package com.lotte.controller;

import lombok.RequiredArgsConstructor;
import org.json.JSONObject;
import org.springframework.http.*;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

@RestController
@RequiredArgsConstructor
public class KakaoPayController {


    //카카오페이 결제시스템 개발
    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @RequestMapping(value = "/pay")
    public String KakaoPay() {

        RestTemplate rt = new RestTemplate();
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Authorization", "KakaoAK "+ "babc5602310e57dae1596a270b1b4466");
        httpHeaders.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();

        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", "1001");
        params.add("partner_user_id", "gorany");
        params.add("item_name", "lotte_malang");
        params.add("quantity", "1");
        params.add("total_amount", "999999");
        params.add("tax_free_amount", "0");
        params.add("approval_url", "http://localhost/user");
        params.add("cancel_url", "http://localhost/allitem");
        params.add("fail_url", "http://localhost/allbasket");

        HttpEntity<MultiValueMap<String, String>> kakaopay = new HttpEntity<>(params, httpHeaders);

        ResponseEntity<String> response = rt.exchange(
                "https://kapi.kakao.com/v1/payment/ready",
                HttpMethod.POST,
                kakaopay,
                String.class
        );

        System.out.println(response);


        // Pay 리다이렉트 링크 가져오기
        JSONObject jo = new JSONObject(response.getBody());
        System.out.println(jo.get("tid"));

        // tid : 결제고유번호 = 결제내역 확인용 코드
        // DB에 tid , member_id , item_code 저장해야함

        // 적립금 저장


        String redirect_url = (String) jo.get("next_redirect_pc_url");
        return redirect_url;
    }
}
