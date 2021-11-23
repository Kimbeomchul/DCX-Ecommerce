package com.lotte.controller;


import com.lotte.dto.BasketDTO;
import com.lotte.login.Login;
import com.lotte.service.BasketService;
import com.lotte.service.UserService;
import lombok.RequiredArgsConstructor;
import org.json.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class LoginController {

    // 카카오 로그인
    // Docs : https://developers.kakao.com/docs/latest/ko/kakaologin/rest-api
    // test URL : https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=0283e78b831185c25b7ed36ea030a098&redirect_uri=http://localhost/auth/kakao/callback
    private final UserService userService;

    @GetMapping(value = "auth/kakao/callback")
    public String FindAuthCode(@RequestParam("code") String code){
        System.out.println(code);

        RestTemplate rt = new RestTemplate();
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        MultiValueMap<String,String> params = new LinkedMultiValueMap<>();
        params.add("grant_type","authorization_code");
        params.add("client_id","0283e78b831185c25b7ed36ea030a098");
        params.add("redirect_uri","http://localhost/auth/kakao/callback");
        params.add("code",code);

        HttpEntity<MultiValueMap<String,String>> kakaoTokenRequest = new HttpEntity<>(params,httpHeaders);

        ResponseEntity<String> response = rt.exchange(
                "https://kauth.kakao.com/oauth/token",
                HttpMethod.POST,
                kakaoTokenRequest,
                String.class
        );

        // 토큰값 Json 형식으로 가져오기위해 생성
        JSONObject jo = new JSONObject(response.getBody());
        // 토큰결과값
        System.out.println(response);

        RestTemplate rt2 = new RestTemplate();
        HttpHeaders headers2 = new HttpHeaders();

        headers2.add("Authorization", "Bearer "+ jo.get("access_token"));
        headers2.add("Content-type","application/x-www-form-urlencoded;charset=utf-8");

        HttpEntity<MultiValueMap<String,String >> kakaoProfileRequest2= new HttpEntity<>(headers2);

        ResponseEntity<String> response2 = rt2.exchange(
                "https://kapi.kakao.com/v2/user/me",
                HttpMethod.POST,
                kakaoProfileRequest2,
                String.class
        );



        // 토큰을 사용하여 사용자 정보 추출
        JSONObject jo2 = new JSONObject(response2.getBody());
//          ==== TEST ====
//        System.out.println(jo2.get("id"));
//        System.out.println(jo2.get("connected_at"));
//        System.out.println(jo2.getJSONObject("properties").get("profile_image"));
//        System.out.println(jo2.getJSONObject("properties").get("nickname"));
//        System.out.println(jo2.getJSONObject("kakao_account").get("email"));

        Login kakao = new Login();
        kakao.setId((Integer) jo2.get("id"));
        kakao.setConnected_time((String) jo2.get("connected_at"));
        kakao.setEmail((String) jo2.getJSONObject("kakao_account").get("email"));
        kakao.setNickname((String) jo2.getJSONObject("properties").get("nickname"));
        kakao.setProfile_image((String) jo2.getJSONObject("properties").get("profile_image"));

        String Flag = "";
        try {
            userService.setUserInfo(kakao.getId(), "Kakao", kakao.getNickname(), kakao.getConnected_time(), kakao.getProfile_image(), kakao.getEmail());
            Flag = "Y";
            System.out.println("DB saved");
        }catch(Exception e){
            Flag = "N";
            System.out.println("Already In DB ");
        }

        if("Y".equals(Flag)){
            return "Y " + response2.getBody();
        }else{
            return "N " + response2.getBody();
        }


    }
}
