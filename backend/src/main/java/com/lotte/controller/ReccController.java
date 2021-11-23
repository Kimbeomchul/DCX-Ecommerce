package com.lotte.controller;

import com.lotte.dto.ItemDTO;
import com.lotte.dto.PayDTO;
import com.lotte.dto.ZzimDTO;
import com.lotte.service.ItemService;
import com.lotte.service.PayService;
import com.lotte.service.UserService;
import com.lotte.service.ZzimService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequiredArgsConstructor
public class ReccController {

    private final UserService userService;


    // 추천알고리즘
    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @RequestMapping(value = "/addrecc", method = RequestMethod.POST)
    public void addrecc(@RequestParam(value="recc") String recc, @RequestParam(value="member_id") String member_id) {
        System.out.println(member_id);
        System.out.println(recc);
        // 0 : 공부 목적  , 1 : 취미 목적 2 : 어린이 3 : 자기개발
        userService.addrecc(recc, member_id);

    }
}
